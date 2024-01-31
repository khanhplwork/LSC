import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:lsc/core/api/api.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/presentation/splash_screen/models/splash_model.dart';
part 'splash_event.dart';
part 'splash_state.dart';

/// A bloc that manages the state of a Splash according to the event that is dispatched to it.
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(SplashState initialState) : super(initialState) {
    on<SplashInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SplashInitialEvent event,
    Emitter<SplashState> emit,
  ) async {
    var box = Hive.box('lscBox');
    bool isLogin = box.get('isLogin') ?? false;

    if (isLogin) {
      String username = box.get('username');
      String password = box.get('password');
      bool result = await login(username, password);
      if (result) {
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeScreen);
      } else {
        disposeConstant();
        var box = Hive.box('lscBox');
        box.clear();
        Fluttertoast.showToast(
            msg: "Login Failed! Please try again.",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 2,
            textColor: Colors.white,
            fontSize: 14);
      }
    } else {
      box.clear();
      disposeConstant();
      Future.delayed(const Duration(milliseconds: 3000), () {
        NavigatorService.popAndPushNamed(
          AppRoutes.loginScreen,
        );
      });
    }
  }
}

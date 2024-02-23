import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:lsc/core/api/api.dart';
import 'package:lsc/core/app_export.dart';
import 'package:lsc/widgets/dialog/loading_dialog.dart';
part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginInitialEvent>(_onInitialize);
    on<ChangeSwitchEvent>(_changeSwitch);
    on<OnClickLoginEvent>(_onClickLogin);
  }
  _onClickLogin(
    OnClickLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    showLoadingDialog();
    bool result = await login(state.emailController!.text.trim(),
        state.passwordController!.text.trim());
    Navigator.pop(NavigatorService.navigatorKey.currentContext!);
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
  }

  _changeSwitch(
    ChangeSwitchEvent event,     
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(
      isSelectedSwitch: event.value,
    ));
  }

  _onInitialize(
    LoginInitialEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      isSelectedSwitch: false,
    ));
  }
}

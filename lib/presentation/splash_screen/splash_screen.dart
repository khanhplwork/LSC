import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:flutter/material.dart';
import 'package:lsc/core/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              body: SizedBox(
                  width: 307.h,
                  child: Column(children: [
                    SizedBox(height: 266.v),
                    Expanded(
                        child: SingleChildScrollView(
                            child: CustomImageView(
                                imagePath: ImageConstant.imgImage1,
                                height: 666.v,
                                width: 307.h)))
                  ]))));
    });
  }
}

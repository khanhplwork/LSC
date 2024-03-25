import 'package:lsc/presentation/splash_screen/models/splash_model.dart';

import 'bloc/splash_bloc.dart';

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
          body: Container(
            width: 390.h,
            height: 844.v,
            child: Center(
              child: Container(
                width: 300.h,
                height: 160.v,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageConstant.imgImage1),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}

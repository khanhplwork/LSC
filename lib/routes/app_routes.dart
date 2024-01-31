import 'package:flutter/material.dart';
import 'package:lsc/presentation/control_panel_screen/control_panel_screen.dart';
import 'package:lsc/presentation/home_screen/home_screen.dart';
import 'package:lsc/presentation/login_screen/login_screen.dart';
import 'package:lsc/presentation/notification_screen/notification.dart';
import 'package:lsc/presentation/profile_screen/profile_screen.dart';
import 'package:lsc/presentation/splash_screen/splash_screen.dart';

import '../presentation/inprogress_order_screen/inprogress_order_screen.dart';

class AppRoutes {
  static const String profileScreen = '/profile_screen';

  static const String controlPanelScreen = '/control_panel_screen';

  static const String inProgressOrderScreen = '/in_progress_order_screen';

  static const String notificationScreen = '/notification_screen';

  static const String homeScreen = '/home_screen';

  static const String loginScreen = '/login_screen';

  static const String splashScreen = '/splash_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        profileScreen: ProfileScreen.builder,
        controlPanelScreen: ControlPanelScreen.builder,
        inProgressOrderScreen: InProgressOrderScreen.builder,
        notificationScreen: NotificationScreen.builder,
        homeScreen: HomeScreen.builder,
        loginScreen: LoginScreen.builder,
        splashScreen: SplashScreen.builder,
        initialRoute: SplashScreen.builder
      };
}

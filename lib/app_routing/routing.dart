import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:potatoes_test/app_libs/tabs/screen.dart';
import 'package:potatoes_test/app_routing/routes.dart';
import 'package:potatoes_test/authentication/screens/login/auth_binding.dart';
import 'package:potatoes_test/authentication/screens/login/screen.dart';
import 'package:potatoes_test/clasification/clasification_binding.dart';
import 'package:potatoes_test/profile/profile_binding.dart';
import 'package:potatoes_test/profile/profile_controller.dart';
import 'package:potatoes_test/splash/screens/splash/screen.dart';
import 'package:potatoes_test/splash/screens/splash/screen_binding.dart';

class AppRouting {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return GetPageRoute(
          settings: settings,
          page: () => LoginScreen(),
        );

      // case AppRoutes.signup:
      //   return GetPageRoute(settings: settings, page: () => SignUpScreen());

      case AppRoutes.tabs:
        return GetPageRoute(
            settings: settings,
            page: () => TabsScreen(),
            bindings: [ClasificationBinding(), ProfileBinding()]);

      default:
        return GetPageRoute(
            settings: settings,
            page: () => SplashScreen(),
            binding: SplashScreenBindings());
    }
  }
}

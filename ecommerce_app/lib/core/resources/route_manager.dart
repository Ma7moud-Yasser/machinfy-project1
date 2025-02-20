import 'package:ecommerce_app/features/auth_screens/view/forget_password/presentation/view/forget_password_screen.dart';
import 'package:ecommerce_app/features/on_boardings/presentation/view/on_boarding_screens.dart';
import 'package:ecommerce_app/features/auth_screens/view/auth_screens/presentation/view/auth_screens.dart';
import 'package:ecommerce_app/features/splash/presentation/view/splash_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String introRoute = "/";
  static const String splashScreen = "/splashScreen";
  static const String onBoardingScreen = "/onBoardingScreen";
  // static const String loginScreen = "/loginScreen";
  static const String authScreens = "/authScreens";
  static const String forgetPasswordScreens = "/forgetPasswordScreens";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.authScreens:
        return MaterialPageRoute(builder: (_) => const AuthScreens());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.forgetPasswordScreens:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      // case Routes.loginScreen:
      // return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return unDefinedRoute();
    }
  }

  // static String getInit() {
  //   if (CacheManager.cacheBox.isNotEmpty) {
  //     dynamic studentJson =
  //         CacheManager.getValueFromCache(CacheKeys.studentModel);
  //     dynamic adminJson = CacheManager.getValueFromCache(CacheKeys.adminModel);
  //     dynamic parentJson =
  //         CacheManager.getValueFromCache(CacheKeys.parentModel);

  //     if (studentJson != null && studentJson is Map<dynamic, dynamic>) {
  //       StudentModel student = StudentModel.fromJson(studentJson);
  //       if (student.role == UserRoles.student) {
  //         return Routes.studentHome;
  //       }
  //     }

  //     if (adminJson != null && adminJson is Map<dynamic, dynamic>) {
  //       AdminModel admin = AdminModel.fromJson(adminJson);
  //       if (admin.role == UserRoles.admin) {
  //         return Routes.adminHome;
  //       }
  //     }

  //     if (parentJson != null && parentJson is Map<dynamic, dynamic>) {
  //       ParentModel parent = ParentModel.fromJson(parentJson);
  //       if (parent.role == UserRoles.parent) {
  //         return Routes.parentHome;
  //       }
  //     }
  //   }

  //   return Routes.onBoardingScreen;
  // }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text("noRouteFound")),
            body: const Center(child: Text("noRouteFound")),
          ),
    );
  }
}

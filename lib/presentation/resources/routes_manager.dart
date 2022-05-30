import 'package:flutter/material.dart';

import 'package:hamo_app/presentation/onboarding/onboarding_screen.dart';
import 'package:hamo_app/presentation/resources/strings_manager.dart';
import 'package:hamo_app/presentation/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onboardingRoute = '/onboarding';
  static const String homeRoute = '/home';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      default:
        return undefinedRoute();
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(),
              body: Center(child: Text(AppStrings.NoRouteFound)),
            ));
  }
}

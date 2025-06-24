import 'package:balanced_meal_app/core/utils/routes/route_name.dart';
import 'package:balanced_meal_app/features/welcome/view/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  AppRoute._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}

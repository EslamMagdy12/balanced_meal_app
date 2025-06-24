import 'package:balanced_meal_app/core/utils/routes/route_name.dart';
import 'package:flutter/material.dart';

import '../../../features/user_details/presentation/view/screens/user_details_screen.dart';
import '../../../features/welcome/presentation/view/screens/welcome_screen.dart';

class AppRoute {
  AppRoute._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case RouteName.userDetailsRoute:
        return MaterialPageRoute(builder: (_) => UserDetailsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}

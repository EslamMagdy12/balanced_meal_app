import 'package:balanced_meal_app/core/utils/routes/route_name.dart';
import 'package:balanced_meal_app/features/order/presentation/view/screens/order_screen.dart';
import 'package:flutter/material.dart';

import '../../../features/order/presentation/view/screens/order_summary_screen.dart';
import '../../../features/user_details/presentation/view/screens/user_details_screen.dart';
import '../../../features/welcome/presentation/view/screens/welcome_screen.dart';

class AppRoute {
  AppRoute._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.welcomeRoute:
        return _handelMaterialPageRoute(
          widget: const WelcomeScreen(),
          settings: settings,
        );
      case RouteName.userDetailsRoute:
        return _handelMaterialPageRoute(
          widget: UserDetailsScreen(),
          settings: settings,
        );
      case RouteName.homeRoute:
        return _handelMaterialPageRoute(
          widget: OrderScreen(),
          settings: settings,
        );
      case RouteName.orderSummaryRoute:
        return _handelMaterialPageRoute(
          widget: const OrderSummaryScreen(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }

  static MaterialPageRoute<dynamic> _handelMaterialPageRoute({
    required Widget widget,
    required RouteSettings settings,
  }) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}

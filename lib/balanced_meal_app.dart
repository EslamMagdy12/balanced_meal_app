import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/functions/route_initializer.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/di/di.dart';
import 'core/utils/routes/app_route.dart';

class BalancedMealApp extends StatelessWidget {
  final routeInitializer = getIt<RouteInitializer>();
  BalancedMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: "Super Fitness App",
      theme: AppTheme.appTheme,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: routeInitializer.computeInitialRoute(),
    );
  }
}

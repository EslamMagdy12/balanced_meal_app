import 'package:balanced_meal_app/core/utils/routes/route_name.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/routes/app_route.dart';

class BalancedMealApp extends StatelessWidget {
  const BalancedMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: "Balanced Meal App",
      theme: AppTheme.appTheme,
      onGenerateRoute: AppRoute.generateRoute,
      initialRoute: RouteName.welcomeRoute,
    );
  }
}

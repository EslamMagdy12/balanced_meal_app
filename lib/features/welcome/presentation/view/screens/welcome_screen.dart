import 'package:balanced_meal_app/core/assets/app_colors.dart';
import 'package:balanced_meal_app/core/utils/l10n/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/assets/app_images.dart';
import '../../../../../core/utils/routes/route_name.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppImages.backgroundImage, fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.55),
                    Color.fromRGBO(0, 0, 0, 0.0),
                  ],
                  stops: [0.2432, 1.0],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 48),
                Text(
                  LocaleKeys.BalancedMeal.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 48,
                    color: AppColors.white,
                  ),
                ),
                const Spacer(),
                Text(
                  LocaleKeys.CraftYourIdealMeal.tr(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 20,
                    color: AppColors.lightGray,
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.userDetailsRoute);
                  },
                  child: Text(LocaleKeys.OrderFood.tr()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:balanced_meal_app/balanced_meal_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

import 'core/utils/app_starter.dart';
import 'core/utils/bloc_observer/bloc_observer_service.dart';
import 'core/utils/constants.dart';
import 'core/utils/di/di.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppStarter.init();

  Bloc.observer = BlocObserverService(getIt<Logger>());
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale(Constants.ar), Locale(Constants.en)],
      path: Constants.assetsTranslations,
      startLocale: AppStarter.startLocale ?? const Locale(Constants.en),
      fallbackLocale: const Locale(Constants.en),
      child: const BalancedMealApp(),
    ),
  );
}

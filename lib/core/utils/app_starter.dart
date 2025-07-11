import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../firebase_options.dart';
import 'constants.dart';
import 'di/di.dart';

abstract class AppStarter {
  AppStarter._();

  static Locale? startLocale;

  static Future<void> init() async {
    await Future.wait([
      Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform),
      EasyLocalization.ensureInitialized(),
      configureDependencies(),
    ]);

    final sharedPreferences = getIt<SharedPreferences>();

    final langCode = selectedLanguageCode(sharedPreferences);
    startLocale = Locale(langCode);
  }

  static String selectedLanguageCode(SharedPreferences sharedPreferences) {
    return sharedPreferences.getString(Constants.selectedLanguageCode) ??
        Constants.en;
  }
}

import 'package:flutter/material.dart';

import '../assets/app_colors.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    primaryColor: AppColors.orange,
    secondaryHeaderColor: AppColors.black,
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      backgroundColor: AppColors.white,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: AppColors.white),
      titleMedium: TextStyle(color: AppColors.white),
      titleSmall: TextStyle(color: AppColors.white),
      labelLarge: TextStyle(color: AppColors.white),
      labelMedium: TextStyle(color: AppColors.white),
      labelSmall: TextStyle(color: AppColors.white),
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.white),
      bodySmall: TextStyle(color: AppColors.white),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.orange,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.orange),
        foregroundColor: WidgetStateProperty.all(AppColors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10000)),
        ),
        elevation: WidgetStateProperty.all(0),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        padding: WidgetStateProperty.all(const EdgeInsets.all(16)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      errorStyle: const TextStyle(color: AppColors.red, fontSize: 12),
      contentPadding: const EdgeInsets.all(16),
      hintStyle: TextStyle(color: AppColors.orange, fontSize: 14),
      suffixIconColor: AppColors.mediumGray,
      labelStyle: TextStyle(fontSize: 12, color: AppColors.mediumGray),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.lightBlue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.orange),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(width: 1, color: AppColors.red),
      ),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.contains(WidgetState.error)) {
          return const TextStyle(color: AppColors.red);
        } else if (states.contains(WidgetState.focused)) {
          return const TextStyle(color: AppColors.orange);
        } else {
          return TextStyle(color: AppColors.lightBlue);
        }
      }),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        foregroundColor: WidgetStateProperty.all(AppColors.orange),
        textStyle: WidgetStateProperty.all(
          const TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.orange,
          ),
        ),
      ),
    ),
    checkboxTheme: const CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(AppColors.white),
      side: BorderSide(color: AppColors.orange),
      overlayColor: WidgetStatePropertyAll(AppColors.orange),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        foregroundColor: AppColors.orange,
        side: const BorderSide(color: AppColors.orange),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.orange,
      unselectedItemColor: AppColors.white,
      showUnselectedLabels: false,
      showSelectedLabels: true,
    ),
  );
}

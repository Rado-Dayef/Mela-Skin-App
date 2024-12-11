import 'package:flutter/material.dart';
import 'package:mela_skin/constants/colors.dart';
import 'package:mela_skin/constants/strings.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
    fontFamily: AppStrings.timesFont,
    splashColor: AppColors.transparentColor,
    highlightColor: AppColors.transparentColor,
    scaffoldBackgroundColor: AppColors.darkBlueColor,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: AppColors.whiteColor,
      backgroundColor: AppColors.darkBlueColor,
    ),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontSize: 20,
        color: AppColors.darkBlueColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        color: AppColors.darkBlueColor,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        color: AppColors.darkBlueColor,
      ),
      labelSmall: TextStyle(
        fontSize: 16,
        color: AppColors.darkBlueColor,
      ),
      labelLarge: TextStyle(
        fontSize: 24,
        color: AppColors.darkBlueColor,
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        color: AppColors.darkBlueColor,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        color: AppColors.darkBlueColor,
      ),
      displayLarge: TextStyle(
        fontSize: 24,
        color: AppColors.darkBlueColor,
      ),
      displayMedium: TextStyle(
        fontSize: 20,
        color: AppColors.darkBlueColor,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        color: AppColors.darkBlueColor,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 60,
        color: AppColors.darkBlueColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 30,
        color: AppColors.darkBlueColor,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 16,
        color: AppColors.darkBlueColor,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: TextStyle(
        fontSize: 24,
        color: AppColors.darkBlueColor,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 20,
        color: AppColors.darkBlueColor,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

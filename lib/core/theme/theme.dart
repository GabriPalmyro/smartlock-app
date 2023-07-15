import 'package:flutter/material.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';
import 'package:smartlock_app/core/configs/app_typography.dart';

/// Abstract class that contains the dark and the light theme for the app
abstract class CustomTheme {
  static ThemeData getDarkTheme() {
    return ThemeData(
      fontFamily: AppTypography.Montserrat,
      primaryColor: kPrimary,
      textTheme: TextTheme(
        bodySmall: const TextStyle(
          color: kText,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        bodyMedium: const TextStyle(
          color: kText,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        bodyLarge: const TextStyle(
          color: kText,
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
        titleLarge: TextStyle(
          color: kText.withOpacity(0.87),
          fontWeight: FontWeight.w400,
          fontSize: 40,
        ),
      ),
      appBarTheme:
          const AppBarTheme(iconTheme: IconThemeData(color: kWhite, size: 20)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: kTextFieldBackground,
          selectedIconTheme: const IconThemeData(color: kWhite),
          unselectedIconTheme: IconThemeData(color: kWhite.withOpacity(0.6))),
      colorScheme: const ColorScheme(
        primary: kPrimary,
        background: kBackground,
        secondary: kSecondary,
        brightness: Brightness.dark,
        error: kError,
        onBackground: kBackground,
        onError: kError,
        onPrimary: kPrimary,
        onSecondary: kSecondary,
        surface: kSurface,
        onSurface: kSurface,
        tertiary: kTextFieldBackground,
        primaryContainer: kWhite,
        secondaryContainer: kSecondaryContainer,
        onTertiary: kInputBackgroundDark,
      ),
    );
  }
}

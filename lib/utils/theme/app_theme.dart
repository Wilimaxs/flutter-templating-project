import 'package:flutter/material.dart';
import 'package:template_flutter/gen/fonts.gen.dart';
import 'app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _createTheme(Brightness.light);

  static ThemeData get dark => _createTheme(Brightness.dark);

  static ThemeData _createTheme(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: FontFamily.plusJakartaSans,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: isDark ? AppColors.primaryDark : AppColors.primaryLight,
        onPrimary: isDark ? AppColors.black : AppColors.white,
        primaryContainer: isDark
            ? AppColors.primaryContainerDark
            : AppColors.primaryContainerLight,
        onPrimaryContainer: isDark ? AppColors.white : AppColors.primaryLight,
        secondary: isDark ? AppColors.secondaryDark : AppColors.secondaryLight,
        onSecondary: isDark ? AppColors.black : AppColors.white,
        error: AppColors.error,
        onError: AppColors.white,
        surface: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        onSurface: isDark ? AppColors.text10 : AppColors.text90,
        outline: isDark ? AppColors.outlineDark : AppColors.outlineLight,
        onSurfaceVariant: isDark ? AppColors.text50 : AppColors.text70,
      ),
      scaffoldBackgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,

      textTheme: const TextTheme(
        // for big titles
        displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),

        // for headings
        headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),

        // for titles cards, sections
        titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),

        // for body text
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),

        // for label styles (untuk teks kecil/button)
        labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ppob_koperasi_payment/gen/fonts.gen.dart';
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
    );
  }
}

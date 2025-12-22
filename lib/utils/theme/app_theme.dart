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
        primary: isDark ? AppColor.primaryDark : AppColor.primaryLight,
        onPrimary: isDark ? AppColor.black : AppColor.white,
        primaryContainer: isDark
            ? AppColor.primaryContainerDark
            : AppColor.primaryContainerLight,
        onPrimaryContainer: isDark ? AppColor.white : AppColor.primaryLight,
        secondary: isDark ? AppColor.secondaryDark : AppColor.secondaryLight,
        onSecondary: isDark ? AppColor.black : AppColor.white,
        error: AppColor.error,
        onError: AppColor.white,
        surface: isDark ? AppColor.surfaceDark : AppColor.surfaceLight,
        onSurface: isDark ? AppColor.text10 : AppColor.text90,
        outline: isDark ? AppColor.outlineDark : AppColor.outlineLight,
        onSurfaceVariant: isDark ? AppColor.text50 : AppColor.text70,
      ),
      scaffoldBackgroundColor: isDark
          ? AppColor.backgroundDark
          : AppColor.backgroundLight,
    );
  }
}

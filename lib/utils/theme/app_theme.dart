import 'package:flutter/material.dart';
import 'package:template_flutter/gen/fonts.gen.dart';

import 'app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get light => _createTheme(Brightness.light);
  static ThemeData get dark => _createTheme(Brightness.dark);

  static ThemeData _createTheme(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.seed,
      brightness: brightness,
    ).copyWith(
      primary: isDark ? AppColors.primaryDark : AppColors.primaryLight,
      onPrimary: isDark ? AppColors.black : AppColors.white,
      primaryContainer: isDark
          ? AppColors.primaryContainerDark
          : AppColors.primaryContainerLight,
      onPrimaryContainer: isDark ? AppColors.text10 : AppColors.text90,
      secondary: isDark ? AppColors.secondaryDark : AppColors.secondaryLight,
      onSecondary: isDark ? AppColors.text90 : AppColors.white,
      tertiary: isDark ? AppColors.tertiaryDark : AppColors.tertiary,
      onTertiary: isDark ? AppColors.text90 : AppColors.white,
      error: AppColors.error,
      onError: AppColors.white,
      surface: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      onSurface: isDark ? AppColors.text10 : AppColors.text90,
      surfaceContainerLowest: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      surfaceContainerLow: isDark
          ? AppColors.surfaceDark
          : AppColors.surfaceContainerLight,
      outline: isDark ? AppColors.outlineDark : AppColors.outlineLight,
      outlineVariant: isDark
          ? AppColors.outlineVariantDark
          : AppColors.text30,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: isDark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      fontFamily: FontFamily.plusJakartaSans,
      textTheme: _textTheme(colorScheme),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      cardTheme: CardThemeData(
        color: isDark ? AppColors.surfaceContainerDark : AppColors.surfaceLight,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: colorScheme.outlineVariant.withValues(alpha: 0.6),
          ),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant.withValues(alpha: 0.6),
        thickness: 1,
        space: 1,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: _inputBorder(colorScheme.outline),
        enabledBorder: _inputBorder(colorScheme.outline),
        focusedBorder: _inputBorder(colorScheme.primary, width: 1.5),
        errorBorder: _inputBorder(colorScheme.error),
        focusedErrorBorder: _inputBorder(colorScheme.error, width: 1.5),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.onSurface.withValues(alpha: 0.12),
          disabledForegroundColor: colorScheme.onSurface.withValues(alpha: 0.38),
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        elevation: 0,
      ),
    );
  }

  static TextTheme _textTheme(ColorScheme colorScheme) {
    return const TextTheme(
      displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
      headlineLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      bodyLarge: TextStyle(fontSize: 16),
      bodyMedium: TextStyle(fontSize: 14),
      bodySmall: TextStyle(fontSize: 12),
      labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      labelMedium: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      labelSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
    ).apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    );
  }

  static OutlineInputBorder _inputBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';

/// App type scale — bundled Inter across the whole product (iOS + Android).
class TextStyles {
  /// Family declared in pubspec.yaml, backed by assets/fonts/Inter-*.ttf.
  static const fontFamily = 'Inter';

  static TextStyle _base({
    required double size,
    FontWeight weight = FontWeight.w400,
    Color? color,
    double height = 1.4,
    double letterSpacing = 0,
    List<FontFeature>? features,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: weight,
      color: color ?? AppColors.textPrimary,
      height: height,
      letterSpacing: letterSpacing,
      fontFeatures: features,
    );
  }

  static const _digits = [FontFeature.tabularFigures()];

  /// Hero success / splash — 28 bold.
  static TextStyle get display => _base(
        size: 28,
        weight: FontWeight.w700,
        height: 1.2,
      );

  static TextStyle get bodyBase => body;

  static TextStyle get ui => _base(size: 14, weight: FontWeight.w500);

  /// Screen titles — 24 bold.
  static TextStyle heading1 = _base(
    size: 24,
    weight: FontWeight.w700,
    height: 1.25,
  );

  /// Page titles — 20 bold.
  static TextStyle heading2 = _base(
    size: 20,
    weight: FontWeight.w700,
    height: 1.3,
  );

  /// Section titles — 16 semibold.
  static TextStyle heading3 = _base(
    size: 16,
    weight: FontWeight.w600,
    height: 1.35,
  );

  /// Body / descriptions — 14 regular.
  static TextStyle body = _base(
    size: 14,
    weight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.45,
  );

  /// List titles, fund names — 14 semibold.
  static TextStyle bodyBold = _base(
    size: 14,
    weight: FontWeight.w600,
    height: 1.35,
  );

  /// Captions / meta — 12 regular.
  static TextStyle caption = _base(
    size: 12,
    weight: FontWeight.w400,
    color: AppColors.textMuted,
    height: 1.35,
  );

  /// Buttons — 16 semibold.
  static TextStyle button = _base(
    size: 16,
    weight: FontWeight.w600,
    color: AppColors.white,
    height: 1.2,
  );

  /// Large currency (home / SIP) — 36 bold, tabular digits.
  static TextStyle amount = _base(
    size: 36,
    weight: FontWeight.w700,
    height: 1.15,
    features: _digits,
  );

  /// Mid currency in cards — 26 bold.
  static TextStyle amountMd = _base(
    size: 26,
    weight: FontWeight.w700,
    height: 1.2,
    features: _digits,
  );

  /// Row / list amounts — 15 semibold.
  static TextStyle amountSm = _base(
    size: 15,
    weight: FontWeight.w600,
    height: 1.25,
    features: _digits,
  );

  /// Field labels — 11 medium tracked.
  static TextStyle label = _base(
    size: 11,
    weight: FontWeight.w500,
    color: AppColors.textSecondary,
    letterSpacing: 0.4,
    height: 1.3,
  );

  /// Section overlines — 11 semibold tracked.
  static TextStyle overline = _base(
    size: 11,
    weight: FontWeight.w600,
    color: AppColors.textMuted,
    letterSpacing: 0.9,
    height: 1.3,
  );

  static TextTheme get materialTextTheme {
    return TextTheme(
      displayLarge: display,
      displayMedium: heading1,
      displaySmall: heading2,
      headlineLarge: heading1,
      headlineMedium: heading2,
      headlineSmall: heading3,
      titleLarge: heading3,
      titleMedium: bodyBold,
      titleSmall: bodyBold.copyWith(fontSize: 13),
      bodyLarge: body.copyWith(color: AppColors.textPrimary),
      bodyMedium: body,
      bodySmall: caption,
      labelLarge: button,
      labelMedium: label,
      labelSmall: overline,
    );
  }
}

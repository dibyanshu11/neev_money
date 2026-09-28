import 'package:flutter/material.dart';
import 'package:new_app/core/constants/app_colors.dart';

/// Neev design-board typography — bundled **Bricolage Grotesque** (same on iOS + Android).
///
/// Hierarchy from mockup:
/// • Bold 700 — screen titles, hero amounts, primary headings
/// • Semibold 600 — sections, list titles, buttons, labels
/// • Medium 500 — nav inactive, field hints, chips
/// • Regular 400 — body, captions, helper text
class TextStyles {
  static const fontFamily = 'Bricolage Grotesque';

  static TextStyle _base({
    required double size,
    FontWeight weight = FontWeight.w400,
    Color? color,
    double height = 1.4,
    double letterSpacing = 0,
    List<FontFeature>? features,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: weight,
      color: color ?? AppColors.textPrimary,
      height: height,
      letterSpacing: letterSpacing,
      fontFeatures: features,
      decoration: decoration,
    );
  }

  static const _digits = [FontFeature.tabularFigures()];

  // ── Headings ──────────────────────────────────────────────────────────────

  /// Splash hero / large marketing line — 28 bold.
  static TextStyle get display => _base(
        size: 28,
        weight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.3,
      );

  /// Screen titles: “Welcome”, “Enter the code”, “Portfolio” — 28 bold.
  static TextStyle get heading1 => _base(
        size: 28,
        weight: FontWeight.w700,
        height: 1.22,
        letterSpacing: -0.4,
      );

  /// App bar / page titles: “Start a SIP”, “Confirm & pay” — 20 bold.
  static TextStyle get heading2 => _base(
        size: 20,
        weight: FontWeight.w700,
        height: 1.3,
        letterSpacing: -0.2,
      );

  /// Section headers: “Your goals”, “Your Funds”, “Allocation” — 18 bold.
  static TextStyle get sectionTitle => _base(
        size: 18,
        weight: FontWeight.w700,
        height: 1.3,
        letterSpacing: -0.2,
      );

  /// Sub-section titles — 16 semibold.
  static TextStyle get heading3 => _base(
        size: 16,
        weight: FontWeight.w600,
        height: 1.35,
      );

  /// Splash tagline (“Sapne Aapke…”) — 32 bold on welcome screen.
  static TextStyle get tagline => _base(
        size: 32,
        weight: FontWeight.w700,
        height: 1.32,
        letterSpacing: -0.3,
      );

  /// Compact tagline on intro splash — 28 bold.
  static TextStyle get taglineSm => tagline.copyWith(fontSize: 28);

  static TextStyle get appBarTitle =>
      heading2.copyWith(color: AppColors.textPrimary);

  // ── Body ──────────────────────────────────────────────────────────────────

  /// Helper / intro under titles — 15 regular.
  static TextStyle get subtitle => _base(
        size: 15,
        weight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.55,
      );

  /// Standard body — 14 regular.
  static TextStyle get body => _base(
        size: 14,
        weight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  /// Slightly larger body — 15 regular.
  static TextStyle get bodyLarge => subtitle;

  /// List titles, fund names — 14 semibold.
  static TextStyle get bodyBold => _base(
        size: 14,
        weight: FontWeight.w600,
        height: 1.35,
      );

  /// Meta / secondary — 12 regular.
  static TextStyle get caption => _base(
        size: 12,
        weight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.35,
      );

  /// Small bold meta — 12 semibold.
  static TextStyle get captionBold => _base(
        size: 12,
        weight: FontWeight.w600,
        color: AppColors.textMuted,
        height: 1.35,
      );

  /// Fine print — 10 regular.
  static TextStyle get micro => _base(
        size: 10,
        weight: FontWeight.w400,
        color: AppColors.textMuted,
        height: 1.3,
      );

  // ── Interactive ───────────────────────────────────────────────────────────

  /// Primary / filled buttons — 16 semibold.
  static TextStyle get button => _base(
        size: 16,
        weight: FontWeight.w600,
        color: AppColors.white,
        height: 1.2,
        letterSpacing: -0.1,
      );

  /// Gold accent buttons (black text on orange) — 16 semibold.
  static TextStyle get buttonAccent =>
      button.copyWith(color: AppColors.textPrimary);

  /// Text links — 14 semibold.
  static TextStyle get link => _base(
        size: 14,
        weight: FontWeight.w600,
        color: AppColors.primary,
        height: 1.35,
      );

  /// Filter / option chips — 13 semibold.
  static TextStyle get chip => _base(
        size: 13,
        weight: FontWeight.w600,
        height: 1.25,
      );

  // ── Forms ─────────────────────────────────────────────────────────────────

  /// Uppercase field labels — 11 medium tracked.
  static TextStyle get label => _base(
        size: 11,
        weight: FontWeight.w500,
        color: AppColors.textSecondary,
        letterSpacing: 0.8,
        height: 1.3,
      );

  /// Form field labels (“Mobile number”) — 13 semibold.
  static TextStyle get fieldLabel => _base(
        size: 13,
        weight: FontWeight.w600,
        height: 1.3,
      );

  /// Text inputs — 16 regular.
  static TextStyle get input => _base(
        size: 16,
        weight: FontWeight.w400,
        height: 1.35,
      );

  /// Phone / numeric inputs — 16 semibold.
  static TextStyle get inputBold => _base(
        size: 16,
        weight: FontWeight.w600,
        height: 1.35,
      );

  /// Section overlines — 11 semibold tracked.
  static TextStyle get overline => _base(
        size: 11,
        weight: FontWeight.w600,
        color: AppColors.textMuted,
        letterSpacing: 0.8,
        height: 1.3,
      );

  // ── Navigation ────────────────────────────────────────────────────────────

  /// Bottom nav — active tab — 10 semibold.
  static TextStyle get navActive => _base(
        size: 10,
        weight: FontWeight.w600,
        height: 1.1,
      );

  /// Bottom nav — inactive tab — 10 medium.
  static TextStyle get navInactive => _base(
        size: 10,
        weight: FontWeight.w500,
        color: AppColors.textMuted,
        height: 1.1,
      );

  // ── Financial ─────────────────────────────────────────────────────────────

  /// Portfolio hero amount — 36 bold, tabular digits.
  static TextStyle get amount => _base(
        size: 36,
        weight: FontWeight.w700,
        height: 1.12,
        letterSpacing: -0.8,
        features: _digits,
      );

  /// Card / detail amounts — 26 bold.
  static TextStyle get amountMd => _base(
        size: 26,
        weight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.5,
        features: _digits,
      );

  /// Row amounts — 15 semibold.
  static TextStyle get amountSm => _base(
        size: 15,
        weight: FontWeight.w600,
        height: 1.25,
        features: _digits,
      );

  /// Green returns — 13 semibold.
  static TextStyle get positive => bodyBold.copyWith(
        fontSize: 13,
        color: AppColors.positive,
      );

  /// Red losses — 13 semibold.
  static TextStyle get negative => bodyBold.copyWith(
        fontSize: 13,
        color: AppColors.negative,
      );

  // ── Legacy aliases ────────────────────────────────────────────────────────

  static TextStyle get bodyBase => body;
  static TextStyle get ui => _base(size: 14, weight: FontWeight.w500);

  // ── Material theme ────────────────────────────────────────────────────────

  static TextTheme get materialTextTheme {
    return TextTheme(
      displayLarge: display,
      displayMedium: heading1,
      displaySmall: heading2,
      headlineLarge: heading1,
      headlineMedium: heading2,
      headlineSmall: sectionTitle,
      titleLarge: sectionTitle,
      titleMedium: heading3,
      titleSmall: bodyBold.copyWith(fontSize: 13),
      bodyLarge: bodyLarge.copyWith(color: AppColors.textPrimary),
      bodyMedium: body,
      bodySmall: caption,
      labelLarge: button,
      labelMedium: label,
      labelSmall: overline,
    );
  }
}

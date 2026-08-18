import 'package:flutter/material.dart';

/// Neev Money palette — white canvas · deep green · gold CTAs (design board).
class AppColors {
  // Brand — sampled from the design board.
  static const primary = Color(0xFF0C4941);
  static const primarySoft = Color(0xFF184B46);
  static const primaryLight = Color(0xFF22554E);
  static const secondary = Color(0xFFF2A83D);
  static const secondaryDark = Color(0xFFC47D0A);
  static const secondarySoft = Color(0xFFFFF4DF);

  // Surfaces — page background is pure white
  static const background = Color(0xFFFFFFFF);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceMuted = Color(0xFFF2F7F5);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);

  // Text
  static const textPrimary = Color(0xFF000000);
  static const textSecondary = Color(0xFF666666);
  static const textMuted = Color(0xFF8A8A8A);

  // Lines
  static const grey = Color(0xFF666666);
  static const lightGrey = Color(0xFFE8EEEC);
  static const border = Color(0xFFE2E8E6);
  static const divider = Color(0xFFEEF2F1);
  static const cardBorder = Color(0xFFE8EEEC);

  // Feedback
  static const success = Color(0xFF27AE60);
  static const error = Color(0xFFD64545);
  static const warning = Color(0xFFFFF4DF);
  static const warningText = Color(0xFF9A6408);
  static const positive = Color(0xFF27AE60);
  static const negative = Color(0xFFD64545);

  // Feature tokens
  /// Secondary CTA on the splash canvas.
  static const splashButton = Color(0xFF234E46);

  /// Muted green a filled CTA falls back to while it can't be tapped.
  static const buttonDisabled = Color(0xFF9CB3AD);
  static const inputFill = Color(0xFFF2F7F5);
  static const linkBlue = Color(0xFF2563EB);
  static const securityBanner = Color(0xFFF2F9F6);
  static const investOrange = Color(0xFFF2A83D);
  /// Gold Invest pills — background + label (matches design board).
  static const investButtonBg = investOrange;
  static const investButtonFg = textPrimary;
  static const alertBanner = Color(0xFFFFF6E8);
  static const returnsPill = Color(0xFF0C4941);
  static const chipSelectedBg = Color(0xFFE8F5F1);
  static const navSelected = Color(0xFF0C4941);
  static const allocationHybrid = Color(0xFFF2A83D);
  static const allocationDebt = Color(0xFFC9D5D1);

  static List<BoxShadow> get softShadow => [
        BoxShadow(
          color: const Color(0xFF0C2E24).withValues(alpha: 0.08),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];

  /// Flat list cards (border only — no elevation).
  static List<BoxShadow> get cardShadow => const [];
}

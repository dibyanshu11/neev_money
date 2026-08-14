import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_app/core/constant/app_colors.dart';

/// Renders a bundled SVG with optional tint (stroke icons use currentColor).
class AppSvgIcon extends StatelessWidget {
  const AppSvgIcon(
    this.asset, {
    super.key,
    this.size = 24,
    this.color,
    this.semanticsLabel,
  });

  final String asset;
  final double size;
  final Color? color;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    final tint = color ?? AppColors.textPrimary;
    return SvgPicture.asset(
      asset,
      width: size,
      height: size,
      semanticsLabel: semanticsLabel,
      colorFilter: ColorFilter.mode(tint, BlendMode.srcIn),
    );
  }
}

/// Brand mark — preserves original SVG fills (no tint).
class AppSvgLogo extends StatelessWidget {
  const AppSvgLogo({
    super.key,
    required this.asset,
    this.size = 40,
  });

  final String asset;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: size,
      height: size,
    );
  }
}

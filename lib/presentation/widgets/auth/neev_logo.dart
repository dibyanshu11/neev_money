import 'package:flutter/material.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/core/constants/app_svg_assets.dart';
import 'package:new_app/presentation/widgets/app_svg_icon.dart';

class NeevLogo extends StatelessWidget {
  const NeevLogo({
    super.key,
    this.size = 72,
    this.showLabel = true,
    this.labelColor = AppColors.white,
  });

  final double size;
  final bool showLabel;
  final Color labelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSvgLogo(asset: AppSvgAssets.logoNeev, size: size),
        if (showLabel) ...[
          SizedBox(height: size * 0.28),
          Text(
            'Sapne Aapke Neev Hamari',
            textAlign: TextAlign.center,
            style: TextStyles.tagline.copyWith(
              fontSize: size * 0.22,
              color: labelColor,
            ),
          ),
        ],
      ],
    );
  }
}

/// Logo mark for dark backgrounds — icon only (tagline shown separately).
class NeevSplashMark extends StatelessWidget {
  const NeevSplashMark({super.key, this.size = 80});

  final double size;

  @override
  Widget build(BuildContext context) {
    return AppSvgLogo(asset: AppSvgAssets.logoNeev, size: size);
  }
}

/// Compact brand mark for login — deep green tile with white bars.
class NeevLogoMark extends StatelessWidget {
  const NeevLogoMark({super.key, this.size = 40});

  final double size;

  @override
  Widget build(BuildContext context) {
    return AppSvgLogo(asset: AppSvgAssets.logoNeev, size: size);
  }
}

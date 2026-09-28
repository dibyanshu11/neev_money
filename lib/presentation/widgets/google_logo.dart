import 'package:flutter/material.dart';
import 'package:new_app/core/constants/app_svg_assets.dart';
import 'package:new_app/presentation/widgets/app_svg_icon.dart';

/// Google “G” mark for Continue with Google.
class GoogleLogo extends StatelessWidget {
  const GoogleLogo({super.key, this.size = 22});

  final double size;

  @override
  Widget build(BuildContext context) {
    return AppSvgLogo(asset: AppSvgAssets.logoGoogle, size: size);
  }
}

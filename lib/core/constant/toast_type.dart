import 'dart:ui' show Color;

import 'package:new_app/core/constant/app_svg_assets.dart';

enum ToastType {
  success(
    borderColor: Color(0xFF2E7D32),
    bgColor: Color(0xFFE8F5E9),
    iconAsset: AppSvgAssets.check,
  ),
  info(
    borderColor: Color(0xFF1565C0),
    bgColor: Color(0xFFE3F2FD),
    iconAsset: AppSvgAssets.info,
  ),
  warning(
    borderColor: Color(0xFFEF6C00),
    bgColor: Color(0xFFFFF8E1),
    iconAsset: AppSvgAssets.info,
  ),
  error(
    borderColor: Color(0xFFC62828),
    bgColor: Color(0xFFFDECEA),
    iconAsset: AppSvgAssets.x,
  );

  final Color borderColor;
  final Color bgColor;
  final String iconAsset;

  const ToastType({
    required this.borderColor,
    required this.bgColor,
    required this.iconAsset,
  });
}

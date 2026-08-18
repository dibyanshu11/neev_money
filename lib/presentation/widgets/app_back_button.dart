import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/router/route_manager.dart';

/// Consistent white rounded-square back control used across the app.
class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onPressed,
    this.size = 40,
  });

  final VoidCallback? onPressed;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onPressed ??
            () {
              if (Navigator.of(context).canPop()) {
                NavigateTo.back(context);
              }
            },
        child: Container(
          width: size,
          height: size,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.cardBorder),
            boxShadow: AppColors.cardShadow,
          ),
          child: AppIcon(
            AppIcons.back(),
            color: AppColors.textPrimary,
            size: AppIconSizes.sm,
          ),
        ),
      ),
    );
  }
}

/// Shared page title style for AppBars and custom headers.
TextStyle get appBarTitleStyle => TextStyles.appBarTitle;

/// Convenience leading widget with padding for Material [AppBar].
Widget appBarLeading(BuildContext context, {VoidCallback? onPressed}) {
  return Padding(
    padding: const EdgeInsets.only(left: 8),
    child: Center(
      child: AppBackButton(onPressed: onPressed),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/core/utils/toast_utils.dart';

/// Floating WhatsApp CTA to connect with RM — bottom-right per Screen 10 notes.
class WhatsAppFab extends StatelessWidget {
  const WhatsAppFab({
    super.key,
    this.message = 'Hi, I need help with my Neev Money investments.',
  });

  final String message;

  void _tap(BuildContext context) {
    HapticFeedback.lightImpact();
    ToastUtils.showToast(
      context,
      message: 'Opening WhatsApp with your RM…',
      type: ToastType.info,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: 'Chat on WhatsApp',
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _tap(context),
          borderRadius: BorderRadius.circular(28),
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFF25D366),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF25D366).withValues(alpha: 0.35),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            alignment: Alignment.center,
            child: AppIcon(
              AppIcons.message(),
              color: Colors.white,
              size: AppIconSizes.lg,
            ),
          ),
        ),
      ),
    );
  }
}

class WhatsAppButton extends StatelessWidget {
  const WhatsAppButton({
    super.key,
    required this.label,
    this.message = 'Hi, I want to speak to my RM about starting a SIP.',
  });

  final String label;
  final String message;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {
        HapticFeedback.lightImpact();
        ToastUtils.showToast(
          context,
          message: '$label — connecting you on WhatsApp',
          type: ToastType.info,
        );
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: const BorderSide(color: AppColors.primary, width: 1.4),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      ),
      icon: AppIcon(AppIcons.message(), size: AppIconSizes.sm, color: AppColors.primary),
      label: Text(label, style: TextStyles.bodyBold),
    );
  }
}

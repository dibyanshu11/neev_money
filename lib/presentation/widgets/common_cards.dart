import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/constant/app_svg_assets.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/widgets/app_svg_icon.dart';

class InvestmentSummaryCard extends StatelessWidget {
  const InvestmentSummaryCard({
    super.key,
    required this.label,
    required this.amount,
    required this.returnsPercent,
    this.returnsAmount,
    this.subtitle,
    this.showReturnsPill = true,
  });

  final String label;
  final double amount;
  final double returnsPercent;
  final double? returnsAmount;
  final String? subtitle;
  final bool showReturnsPill;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.22),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.body.copyWith(
              color: AppColors.white.withValues(alpha: 0.85),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 10),
          Text(Formatters.currency(amount), style: TextStyles.amount),
          if (showReturnsPill && returnsAmount != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.returnsPill,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppSvgIcon(
                    AppSvgAssets.trendingUp,
                    color: AppColors.secondary,
                    size: AppIconSizes.xs,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${Formatters.currency(returnsAmount!)} · ${Formatters.percentage(returnsPercent)}',
                    style: TextStyles.caption.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (subtitle != null) ...[
            const SizedBox(height: 10),
            Text(
              subtitle!,
              style: TextStyles.caption.copyWith(
                color: AppColors.white.withValues(alpha: 0.75),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class FilterPill extends StatelessWidget {
  const FilterPill({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.compact = false,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(right: 8),
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 12 : 16,
          vertical: compact ? 6 : 8,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.surfaceMuted,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.surfaceMuted,
          ),
        ),
        child: Text(
          label,
          style: TextStyles.caption.copyWith(
            color: isSelected ? AppColors.white : AppColors.textPrimary,
            fontWeight: FontWeight.w600,
            fontSize: compact ? 12 : 13,
          ),
        ),
      ),
    );
  }
}

class QuickActionButton extends StatelessWidget {
  const QuickActionButton({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  final AppIconSpec icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFF3F7F5),
              shape: BoxShape.circle,
            ),
            child: AppIcon(icon, color: AppColors.primary, size: AppIconSizes.sm),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyles.caption.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}

class SecurityBanner extends StatelessWidget {
  const SecurityBanner({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.securityBanner,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppIcon(AppIcons.lock(), size: AppIconSizes.sm, color: AppColors.primary),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyles.caption.copyWith(
                color: AppColors.primary,
                height: 1.4,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

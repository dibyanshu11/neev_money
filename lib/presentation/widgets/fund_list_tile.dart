import 'package:flutter/material.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/core/constants/app_icon_sizes.dart';
import 'package:new_app/core/constants/app_svg_assets.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/presentation/widgets/app_svg_icon.dart';
import 'package:new_app/domain/entities/fund_model.dart';
import 'package:new_app/domain/entities/portfolio_model.dart';

class FundAvatar extends StatelessWidget {
  const FundAvatar({
    super.key,
    required this.fund,
    this.size = 44,
    this.roundedSquare = false,
  });

  final FundModel fund;
  final double size;
  /// Brand mark as rounded square (Explore / detail headers).
  final bool roundedSquare;

  @override
  Widget build(BuildContext context) {
    final color = _colorForFund(fund.id);
    final code = fund.shortCode.isNotEmpty
        ? fund.shortCode
        : fund.name.substring(0, 2).toUpperCase();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: roundedSquare ? color : color.withValues(alpha: 0.14),
        shape: roundedSquare ? BoxShape.rectangle : BoxShape.circle,
        borderRadius: roundedSquare ? BorderRadius.circular(size * 0.28) : null,
      ),
      alignment: Alignment.center,
      child: Text(
        code,
        style: TextStyles.bodyBold.copyWith(
          color: roundedSquare ? AppColors.white : color,
          fontSize: size * 0.32,
        ),
      ),
    );
  }

  static Color _colorForFund(String id) {
    return switch (id) {
      '1' => AppColors.primary,
      '2' => AppColors.primaryLight,
      '3' => AppColors.secondaryDark,
      '4' => const Color(0xFF5C6B7A),
      '5' => const Color(0xFF1B7A4E),
      _ => AppColors.primarySoft,
    };
  }
}

class HomeHoldingTile extends StatelessWidget {
  const HomeHoldingTile({
    super.key,
    required this.fund,
    required this.holding,
    this.onTap,
  });

  final FundModel fund;
  final PortfolioHolding holding;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder),
          boxShadow: AppColors.cardShadow,
        ),
        child: Row(
          children: [
            FundAvatar(fund: fund, size: 42),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                holding.fundName,
                style: TextStyles.bodyBold.copyWith(fontSize: 14),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  Formatters.currency(holding.currentValue),
                  style: TextStyles.bodyBold.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(
                  Formatters.percentage(holding.profitLossPercent),
                  style: TextStyles.caption.copyWith(
                    color: AppColors.positive,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PortfolioHoldingTile extends StatelessWidget {
  const PortfolioHoldingTile({
    super.key,
    required this.fund,
    required this.holding,
  });

  final FundModel fund;
  final PortfolioHolding holding;

  @override
  Widget build(BuildContext context) {
    final isPositive = holding.profitLoss >= 0;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          FundAvatar(fund: fund, size: 42),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  holding.fundName,
                  style: TextStyles.bodyBold.copyWith(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  Formatters.currency(holding.currentValue),
                  style: TextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${isPositive ? '+' : ''}${Formatters.currency(holding.profitLoss.abs())}',
                style: TextStyles.bodyBold.copyWith(
                  color: isPositive ? AppColors.positive : AppColors.negative,
                  fontSize: 14,
                ),
              ),
              Text(
                Formatters.percentage(holding.profitLossPercent),
                style: TextStyles.caption.copyWith(
                  color: isPositive ? AppColors.positive : AppColors.negative,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  const StarRating({super.key, required this.rating, this.size = AppIconSizes.xs});
  final double rating;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (i) {
        final filled = i < rating.floor();
        final half = !filled && i < rating;
        return AppSvgIcon(
          AppSvgAssets.star,
          size: size,
          color: filled || half
              ? AppColors.secondary
              : AppColors.secondary.withValues(alpha: 0.28),
        );
      }),
    );
  }
}

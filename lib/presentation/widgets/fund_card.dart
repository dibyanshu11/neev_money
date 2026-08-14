import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/domain/models/fund_model.dart';
import 'package:new_app/presentation/widgets/fund_list_tile.dart';

class FundCard extends StatelessWidget {
  const FundCard({
    super.key,
    required this.fund,
    this.onInvest,
    this.onTap,
    this.showInvestButton = true,
  });

  final FundModel fund;
  final VoidCallback? onInvest;
  final VoidCallback? onTap;
  final bool showInvestButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FundAvatar(fund: fund, size: 44),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fund.name,
                        style: TextStyles.bodyBold.copyWith(fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${fund.category} · ${fund.riskLevel}',
                        style: TextStyles.caption,
                      ),
                      const SizedBox(height: 6),
                      StarRating(rating: fund.rating, size: 13),
                    ],
                  ),
                ),
                if (showInvestButton)
                  GestureDetector(
                    onTap: onInvest,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.investOrange,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        'Invest',
                        style: TextStyles.caption.copyWith(
                          color: AppColors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                _Metric(label: '3Y returns', value: Formatters.percentage(fund.returns3Y)),
                const SizedBox(width: 24),
                _Metric(
                  label: 'Min SIP',
                  value: Formatters.currency(fund.minSip),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.caption.copyWith(fontSize: 11)),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyles.bodyBold.copyWith(
            color: label.contains('returns') ? AppColors.positive : AppColors.black,
          ),
        ),
      ],
    );
  }
}

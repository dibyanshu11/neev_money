import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/onboarding_data.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';

class HoldingsData {
  const HoldingsData({
    required this.invested,
    required this.current,
    required this.byFund,
  });

  final double invested;
  final double current;
  final Map<String, ({double invested, double current})> byFund;
}

HoldingsData computeHoldings(OnboardingBloc bloc, OnboardingState state) {
  final band = bloc.getBand();
  final total = bloc.getTotalAmount();
  final pcts = {
    'equity': band.equityPct,
    'hybrid': band.hybridPct,
    'debt': band.debtPct,
  };

  final byFund = <String, ({double invested, double current})>{};
  var investedTotal = 0.0;
  var currentTotal = 0.0;

  for (final key in fundKeys) {
    final baseInvested = total * pcts[key]! / 100;
    final invested = baseInvested + (state.extraInvestments[key] ?? 0);
    final current = invested * growthFactor[key]!;
    byFund[key] = (invested: invested, current: current);
    investedTotal += invested;
    currentTotal += current;
  }

  return HoldingsData(
    invested: investedTotal,
    current: currentTotal,
    byFund: byFund,
  );
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.state, required this.bloc});

  final OnboardingState state;
  final OnboardingBloc bloc;

  @override
  Widget build(BuildContext context) {
    final holdings = computeHoldings(bloc, state);
    final gains = holdings.current - holdings.invested;
    final gainsPct = holdings.invested > 0
        ? (gains / holdings.invested) * 100
        : 0.0;
    final goal = goalById(state.selectedGoalId);
    final total = bloc.getTotalAmount();
    final progress = total > 0
        ? (holdings.current / total).clamp(0.0, 1.0)
        : 0.0;
    final firstName = state.name.isNotEmpty
        ? state.name.split(' ').first
        : 'there';

    return OnboardingPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, $firstName',
                      style: TextStyles.caption.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('My Portfolio', style: TextStyles.heading2),
                  ],
                ),
              ),
              AvatarCircle(initials: nameInitials(state.name), size: 44),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primarySoft, AppColors.primary],
              ),
              boxShadow: AppColors.softShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Current value',
                  style: TextStyles.caption.copyWith(
                    color: Colors.white.withValues(alpha: 0.72),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  Formatters.currency(holdings.current),
                  style: TextStyles.amount.copyWith(color: AppColors.white),
                ),
                const SizedBox(height: 14),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.secondary.withValues(alpha: 0.45),
                    ),
                  ),
                  child: Text(
                    '${gains >= 0 ? '▲' : '▼'} ${Formatters.currency(gains.abs())}  ·  ${Formatters.percentage(gainsPct)} since inception',
                    style: TextStyles.caption.copyWith(
                      color: const Color(0xFFFFE7B0),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (goal != null) ...[
            const SizedBox(height: 14),
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.secondarySoft,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Goal progress',
                          style: TextStyles.caption.copyWith(
                            color: AppColors.secondaryDark,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        '${(progress * 100).toStringAsFixed(0)}%',
                        style: TextStyles.bodyBold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    goal.label,
                    style: TextStyles.bodyBold.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 12),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 10,
                      backgroundColor: AppColors.lightGrey,
                      valueColor: const AlwaysStoppedAnimation(
                        AppColors.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${Formatters.currency(holdings.current)} of ${Formatters.currency(total)}',
                    style: TextStyles.caption,
                  ),
                ],
              ),
            ),
          ],
          if (state.sip != null) ...[
            const SizedBox(height: 12),
            _SipBanner(sip: state.sip!),
          ],
          const SizedBox(height: 24),
          Row(
            children: [
              Text('Holdings', style: TextStyles.heading3),
              const Spacer(),
              Text(
                '${fundKeys.length} funds',
                style: TextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final key in fundKeys)
            _HoldingTile(
              fundKey: key,
              invested: holdings.byFund[key]!.invested,
              current: holdings.byFund[key]!.current,
            ),
        ],
      ),
    );
  }
}

class _HoldingTile extends StatelessWidget {
  const _HoldingTile({
    required this.fundKey,
    required this.invested,
    required this.current,
  });

  final String fundKey;
  final double invested;
  final double current;

  @override
  Widget build(BuildContext context) {
    final fund = fundTemplates[fundKey]!;
    final pl = current - invested;
    final plPct = invested > 0 ? (pl / invested) * 100 : 0.0;

    return AppCard(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.chipSelectedBg,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              fund.category[0],
              style: TextStyles.bodyBold.copyWith(color: AppColors.primary),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fund.name, style: TextStyles.bodyBold, maxLines: 1),
                const SizedBox(height: 2),
                Text(
                  'Invested ${Formatters.currency(invested)}',
                  style: TextStyles.caption,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(Formatters.currency(current), style: TextStyles.bodyBold),
              Text(
                '${pl >= 0 ? '+' : ''}${Formatters.percentage(plPct)}',
                style: TextStyles.caption.copyWith(
                  color: pl >= 0 ? AppColors.positive : AppColors.negative,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SipBanner extends StatelessWidget {
  const _SipBanner({required this.sip});

  final SipConfig sip;

  @override
  Widget build(BuildContext context) {
    final fund = fundTemplates[sip.fundKey]!;
    return AppCard(
      color: AppColors.secondarySoft,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(14),
            ),
            child: AppIcon(
              AppIcons.sip(),
              color: AppColors.secondaryDark,
              size: AppIconSizes.md,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Active SIP',
                  style: TextStyles.caption.copyWith(
                    color: AppColors.secondaryDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${Formatters.currency(sip.amount)} on ${sip.date} · ${fund.name}',
                  style: TextStyles.bodyBold.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

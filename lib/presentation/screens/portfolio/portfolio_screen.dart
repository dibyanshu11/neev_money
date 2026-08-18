import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/mock_data.dart';
import 'package:new_app/data/local/onboarding_data.dart';
import 'package:new_app/presentation/blocs/portfolio/portfolio_bloc.dart';
import 'package:new_app/presentation/blocs/portfolio/portfolio_event_state.dart';
import 'package:new_app/presentation/widgets/charts/fund_line_chart.dart';
import 'package:new_app/presentation/widgets/custom_bottom_nav.dart';
import 'package:new_app/presentation/widgets/notifications_bell.dart';
import 'package:new_app/presentation/widgets/whatsapp_fab.dart';
import 'package:new_app/core/utils/toast_utils.dart';
import 'package:new_app/router/route_manager.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({super.key});

  @override
  State<PortfolioScreen> createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen> {
  int _goalIndex = 0;

  static const _goals = <({
    String id,
    String label,
    double amount,
    String tenure,
    double monthlySip,
  })>[
    (
      id: 'home',
      label: 'Home',
      amount: 2500000,
      tenure: '2032',
      monthlySip: 8000,
    ),
    (
      id: 'travel',
      label: 'Travel',
      amount: 400000,
      tenure: '2027',
      monthlySip: 5500,
    ),
    (
      id: 'education',
      label: "Child's future",
      amount: 4000000,
      tenure: '15 yrs',
      monthlySip: 8000,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioBloc, PortfolioState>(
      builder: (context, state) {
        if (state.isLoading && state.portfolio == null) {
          return const ColoredBox(
            color: AppColors.background,
            child: Center(
              child: AppProgress(color: AppColors.primary),
            ),
          );
        }

        // Keep portfolio load warm even though UI is plan-driven.
        final _ = state.portfolio ?? MockData.portfolio;
        final goal = _goals[_goalIndex];
        final funds = samplePlanFunds(goal.id);
        final invest = goal.amount * 0.36;
        final growth = goal.amount - invest;

        return ColoredBox(
          color: AppColors.background,
          child: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.fromLTRB(
                20,
                16,
                20,
                CustomBottomNav.scrollBottomInset(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text('Portfolio', style: TextStyles.heading1),
                      ),
                      const NotificationsBell(),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Sample plans for each goal — tap a tab to switch funds.',
                    style: TextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 64,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: _goals.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, i) {
                        final g = _goals[i];
                        final selected = i == _goalIndex;
                        return GestureDetector(
                          onTap: () => setState(() => _goalIndex = i),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeOutCubic,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: selected
                                  ? AppColors.primary
                                  : AppColors.surface,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: selected
                                    ? AppColors.primary
                                    : AppColors.border,
                              ),
                              boxShadow:
                                  selected ? null : AppColors.cardShadow,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  g.label,
                                  style: TextStyles.chip.copyWith(
                                    color: selected
                                        ? AppColors.white
                                        : AppColors.textPrimary,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${Formatters.currency(g.amount)} · ${g.tenure}',
                                  style: TextStyles.caption.copyWith(
                                    color: selected
                                        ? Colors.white.withValues(alpha: 0.8)
                                        : AppColors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Growth chart on top (Screen 9)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.primarySoft, AppColors.primary],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.22),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
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
                                    'Suggested monthly SIP',
                                    style: TextStyles.caption.copyWith(
                                      color:
                                          Colors.white.withValues(alpha: 0.72),
                                    ),
                                  ),
                                  Text(
                                    Formatters.currency(goal.monthlySip),
                                    style: TextStyles.amountMd.copyWith(
                                      color: AppColors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'On track for',
                                  style: TextStyles.caption.copyWith(
                                    color:
                                        Colors.white.withValues(alpha: 0.72),
                                  ),
                                ),
                                Text(
                                  '≈ ${Formatters.currency(goal.amount)}',
                                  style: TextStyles.sectionTitle.copyWith(
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const GrowthLineChart(height: 92, onDark: true),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            Expanded(
                              child: _MiniStat(
                                label: 'You invest',
                                value: Formatters.currency(invest),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _MiniStat(
                                label: 'Est. growth',
                                value: '+${Formatters.currency(growth)}',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          "Illustrative, assuming ~12% p.a. Mutual funds are subject to market risk; returns aren't guaranteed.",
                          style: TextStyles.micro.copyWith(
                            color: Colors.white.withValues(alpha: 0.65),
                            height: 1.35,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text('Funds & allocation', style: TextStyles.sectionTitle),
                  const SizedBox(height: 12),
                  for (final fund in funds)
                    _PlanFundTile(
                      fund: fund,
                      monthly: goal.monthlySip * fund.pct / 100,
                    ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () => NavigateTo.kycDetails(context, '1'),
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: Text(
                        'Start this plan · ${Formatters.currency(goal.monthlySip)}/mo',
                        style:
                            TextStyles.button.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        ToastUtils.showToast(
                          context,
                          message: 'Adjust opens after you start this plan.',
                          type: ToastType.info,
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(
                          color: AppColors.primary,
                          width: 1.4,
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: Text(
                        'Adjust amount or funds',
                        style: TextStyles.bodyBold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: WhatsAppButton(
                      label: 'WhatsApp · speak to your RM',
                      message:
                          'Hi, I want to discuss my ${goal.label} portfolio on Neev Money.',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Regular plans · distributed by JK Capital · ARN-XXXXXX',
                      style: TextStyles.micro,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.caption.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyles.amountSm.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

class _PlanFundTile extends StatelessWidget {
  const _PlanFundTile({required this.fund, required this.monthly});

  final PlanFundLine fund;
  final double monthly;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(fund.color),
              shape: BoxShape.circle,
            ),
            child: Text(
              fund.initials,
              style: TextStyles.captionBold.copyWith(color: AppColors.white),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fund.name, style: TextStyles.bodyBold),
                const SizedBox(height: 2),
                Text(fund.subtitle, style: TextStyles.caption),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('${fund.pct}%', style: TextStyles.amountSm),
              Text(
                '${Formatters.currency(monthly)}/mo',
                style: TextStyles.amountSm.copyWith(
                  fontSize: 12,
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

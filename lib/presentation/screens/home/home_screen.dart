import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/goals_data.dart';
import 'package:new_app/data/local/mock_data.dart';
import 'package:new_app/data/local/notification_mock.dart';
import 'package:new_app/domain/models/portfolio_model.dart';
import 'package:new_app/presentation/blocs/home/home_bloc.dart';
import 'package:new_app/presentation/blocs/home/home_event_state.dart';
import 'package:new_app/presentation/screens/main/main_tab_controller.dart';
import 'package:new_app/presentation/widgets/custom_bottom_nav.dart';
import 'package:new_app/presentation/widgets/goal_card.dart';
import 'package:new_app/core/utils/toast_utils.dart';
import 'package:new_app/router/route_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.isLoading && state.portfolio == null) {
          return const Center(child: AppProgress(color: AppColors.primary));
        }

        final user = state.user ?? MockData.user;
        final portfolio = state.portfolio ?? MockData.portfolio;
        final name = user.name;
        final topInset = MediaQuery.paddingOf(context).top;
        final hasInvestment = portfolio.currentValue > 0;
        final goalsPreview = [...userGoals, ...demoGoals].take(3).toList();
        final topHoldings = portfolio.holdings.take(2).toList();

        return ColoredBox(
          color: const Color(0xFFF7F9F8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _HomeHeader(
                topInset: topInset,
                name: name,
                portfolio: portfolio,
                hasInvestment: hasInvestment,
              ),
              Expanded(
                child: RefreshIndicator(
                  color: AppColors.primary,
                  onRefresh: () async {
                    context.read<HomeBloc>().add(const HomeEvent.load());
                  },
                  child: ListView(
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    padding: EdgeInsets.fromLTRB(
                      16,
                      8,
                      16,
                      CustomBottomNav.scrollBottomInset(context),
                    ),
                    children: [
                      if (hasInvestment) ...[
                        _PortfolioStats(portfolio: portfolio),
                        const SizedBox(height: 14),
                        const _SipReminder(),
                        const SizedBox(height: 22),
                      ] else ...[
                        _EmptyInvestCard(
                          onInvest: () =>
                              MainTabController.instance.goExplore(),
                        ),
                        const SizedBox(height: 22),
                      ],
                      _SectionHeader(
                        title: 'Your goals',
                        action: 'See all',
                        onAction: () => NavigateTo.goals(context),
                      ),
                      const SizedBox(height: 12),
                      for (var i = 0; i < goalsPreview.length; i++) ...[
                        if (i > 0) const SizedBox(height: 10),
                        GoalCard(
                          goal: goalsPreview[i],
                          onTap: () => NavigateTo.goals(context),
                        ),
                      ],
                      if (hasInvestment && topHoldings.isNotEmpty) ...[
                        const SizedBox(height: 26),
                        _SectionHeader(
                          title: 'Top holdings',
                          action: 'Portfolio',
                          onAction: () =>
                              MainTabController.instance.goPortfolio(),
                        ),
                        const SizedBox(height: 12),
                        _HoldingsCard(holdings: topHoldings),
                      ],
                      const SizedBox(height: 26),
                      _InsightBanner(
                        onTap: () => MainTabController.instance.goExplore(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.action,
    required this.onAction,
  });

  final String title;
  final String action;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyles.sectionTitle),
        const Spacer(),
        GestureDetector(
          onTap: onAction,
          child: Text(
            '$action →',
            style: TextStyles.link.copyWith(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({
    required this.topInset,
    required this.name,
    required this.portfolio,
    required this.hasInvestment,
  });

  final double topInset;
  final String name;
  final PortfolioSummary portfolio;
  final bool hasInvestment;

  @override
  Widget build(BuildContext context) {
    final dayUp = portfolio.oneDayChange >= 0;

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(20, topInset + 12, 20, 86),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF0F3A30),
                    AppColors.primary,
                    Color(0xFF164A3C),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28),
                ),
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
                              _timeGreeting(),
                              style: TextStyles.caption.copyWith(
                                color: Colors.white.withValues(alpha: 0.7),
                                letterSpacing: 0.2,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              name.split(' ').first,
                              style: TextStyles.heading3.copyWith(
                                color: AppColors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.white.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(14),
                        child: InkWell(
                          onTap: () => NavigateTo.notifications(context),
                          borderRadius: BorderRadius.circular(14),
                          child: SizedBox(
                            width: 42,
                            height: 42,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                AppIcon(
                                  AppIcons.notifications(),
                                  color: AppColors.white,
                                  size: AppIconSizes.sm,
                                ),
                                if (NotificationMock.items
                                    .any((n) => n.unread))
                                  Positioned(
                                    top: 10,
                                    right: 10,
                                    child: Container(
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        color: AppColors.secondary,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppColors.primary,
                                          width: 1.5,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 26),
                  Text(
                    hasInvestment
                        ? 'Portfolio value'
                        : 'Start building wealth',
                    style: TextStyles.caption.copyWith(
                      color: Colors.white.withValues(alpha: 0.68),
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    hasInvestment
                        ? Formatters.currency(portfolio.currentValue)
                        : '₹0',
                    style: TextStyles.amount.copyWith(
                      color: AppColors.white,
                      fontSize: 38,
                      letterSpacing: -0.8,
                    ),
                  ),
                  const SizedBox(height: 14),
                  if (hasInvestment)
                    Row(
                      children: [
                        _Pill(
                          label:
                              '${dayUp ? '▲' : '▼'} ${Formatters.currency(portfolio.oneDayChange.abs())} today',
                          fg: dayUp
                              ? const Color(0xFF9BE7B8)
                              : const Color(0xFFFFB4B4),
                          bg: Colors.white.withValues(alpha: 0.1),
                        ),
                        const SizedBox(width: 8),
                        _Pill(
                          label:
                              '${Formatters.percentage(portfolio.totalReturnsPercent)} all-time',
                          fg: AppColors.secondary,
                          bg: Colors.white.withValues(alpha: 0.1),
                        ),
                      ],
                    )
                  else
                    Text(
                      'Start a SIP today — sapne aapke, Neev hamari.',
                      style: TextStyles.caption.copyWith(
                        color: Colors.white.withValues(alpha: 0.75),
                        height: 1.4,
                      ),
                    ),
                ],
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: -40,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      blurRadius: 24,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _QuickAction(
                      icon: AppIcons.invest(),
                      label: 'Invest',
                      iconColor: const Color(0xFF0C2E24),
                      bgColor: const Color(0xFFE8F5F1),
                      onTap: () => MainTabController.instance.goExplore(),
                    ),
                    _QuickAction(
                      icon: AppIcons.sip(),
                      label: 'My SIPs',
                      iconColor: const Color(0xFF0B6E4F),
                      bgColor: const Color(0xFFD8F3E7),
                      onTap: () => MainTabController.instance.goPortfolio(),
                    ),
                    _QuickAction(
                      icon: AppIcons.goals(),
                      label: 'Goals',
                      iconColor: const Color(0xFFC47D0A),
                      bgColor: const Color(0xFFFFF4DF),
                      onTap: () => NavigateTo.goals(context),
                    ),
                    _QuickAction(
                      icon: AppIcons.withdraw(),
                      label: 'Withdraw',
                      iconColor: const Color(0xFF5C6B7A),
                      bgColor: const Color(0xFFEEF1F4),
                      onTap: () {
                        ToastUtils.showToast(
                          context,
                          message:
                              'Withdraw opens after your next SIP settles.',
                          type: ToastType.info,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 56),
      ],
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill({
    required this.label,
    required this.fg,
    required this.bg,
  });

  final String label;
  final Color fg;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyles.caption.copyWith(
          color: fg,
          fontWeight: FontWeight.w700,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _PortfolioStats extends StatelessWidget {
  const _PortfolioStats({required this.portfolio});

  final PortfolioSummary portfolio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          _StatCell(
            label: 'Invested',
            value: Formatters.currency(portfolio.investedAmount),
          ),
          Container(width: 1, height: 44, color: AppColors.divider),
          _StatCell(
            label: 'Returns',
            value: Formatters.currency(portfolio.totalReturns),
            valueColor: AppColors.positive,
          ),
          Container(width: 1, height: 44, color: AppColors.divider),
          _StatCell(
            label: '1D change',
            value: Formatters.percentage(portfolio.oneDayChangePercent),
            valueColor: portfolio.oneDayChangePercent >= 0
                ? AppColors.positive
                : AppColors.negative,
          ),
        ],
      ),
    );
  }
}

class _StatCell extends StatelessWidget {
  const _StatCell({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
        child: Column(
          children: [
            Text(label, style: TextStyles.caption.copyWith(fontSize: 11)),
            const SizedBox(height: 4),
            Text(
              value,
              style: TextStyles.amountSm.copyWith(
                fontSize: 13,
                color: valueColor ?? AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.iconColor,
    required this.bgColor,
  });

  final AppIconSpec icon;
  final String label;
  final VoidCallback onTap;
  final Color iconColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: AppIcon(
                icon,
                color: iconColor,
                size: AppIconSizes.lg,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyles.caption.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _SipReminder extends StatelessWidget {
  const _SipReminder();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.alertBanner,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: () => MainTabController.instance.goPortfolio(),
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.secondary.withValues(alpha: 0.28),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.secondarySoft,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AppIcon(
                  AppIcons.sip(),
                  color: AppColors.secondaryDark,
                  size: AppIconSizes.sm,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SIP renews in 3 days',
                      style: TextStyles.bodyBold.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '₹5,000 on 5 Aug · keep balance ready',
                      style: TextStyles.caption,
                    ),
                  ],
                ),
              ),
              AppIcon(
                AppIcons.chevronRight(),
                color: AppColors.secondaryDark,
                size: AppIconSizes.sm,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HoldingsCard extends StatelessWidget {
  const _HoldingsCard({required this.holdings});

  final List<PortfolioHolding> holdings;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          for (var i = 0; i < holdings.length; i++) ...[
            if (i > 0)
              const Divider(height: 1, indent: 16, endIndent: 16),
            _HoldingRow(holding: holdings[i]),
          ],
        ],
      ),
    );
  }
}

class _HoldingRow extends StatelessWidget {
  const _HoldingRow({required this.holding});

  final PortfolioHolding holding;

  @override
  Widget build(BuildContext context) {
    final up = holding.dailyChangePercent >= 0;
    final initials = holding.fundName
        .split(' ')
        .where((w) => w.isNotEmpty)
        .take(2)
        .map((w) => w[0].toUpperCase())
        .join();

    return InkWell(
      onTap: () => NavigateTo.fundDetail(context, holding.fundId),
      borderRadius: BorderRadius.circular(18),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.surfaceMuted,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                initials,
                style: TextStyles.bodyBold.copyWith(
                  color: AppColors.primary,
                  fontSize: 13,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    holding.fundName,
                    style: TextStyles.bodyBold.copyWith(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    Formatters.currency(holding.currentValue),
                    style: TextStyles.amountSm.copyWith(
                      fontSize: 12,
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '${up ? '+' : ''}${Formatters.percentage(holding.dailyChangePercent)}',
              style: TextStyles.bodyBold.copyWith(
                fontSize: 13,
                color: up ? AppColors.positive : AppColors.negative,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InsightBanner extends StatelessWidget {
  const _InsightBanner({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Need a steadier step?',
                      style: TextStyles.bodyBold.copyWith(
                        color: AppColors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Explore funds matched to your goals and risk band.',
                      style: TextStyles.caption.copyWith(
                        color: Colors.white.withValues(alpha: 0.72),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AppIcon(
                  AppIcons.chevronRight(),
                  color: AppColors.primary,
                  size: AppIconSizes.sm,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyInvestCard extends StatelessWidget {
  const _EmptyInvestCard({required this.onInvest});

  final VoidCallback onInvest;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.surfaceMuted,
              borderRadius: BorderRadius.circular(16),
            ),
            child: AppIcon(
              AppIcons.invest(),
              color: AppColors.primary,
              size: AppIconSizes.lg,
            ),
          ),
          const SizedBox(height: 16),
          Text('Make your first investment', style: TextStyles.heading3),
          const SizedBox(height: 8),
          Text(
            'Start a SIP from as little as ₹500 and build toward your goals.',
            style: TextStyles.body,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: onInvest,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Explore funds',
                style: TextStyles.button.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String _timeGreeting() {
  final hour = DateTime.now().hour;
  if (hour < 12) return 'Good morning';
  if (hour < 17) return 'Good afternoon';
  return 'Good evening';
}

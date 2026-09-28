import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/domain/entities/fund_model.dart';
import 'package:new_app/presentation/blocs/fund_detail/fund_detail_bloc.dart';
import 'package:new_app/presentation/blocs/fund_detail/fund_detail_event_state.dart';
import 'package:new_app/presentation/widgets/app_back_button.dart';
import 'package:new_app/presentation/widgets/app_button.dart';
import 'package:new_app/presentation/widgets/charts/fund_line_chart.dart';
import 'package:new_app/presentation/widgets/fund_list_tile.dart';
import 'package:new_app/presentation/widgets/watchlist_toggle_button.dart';
import 'package:new_app/app/router/app_router.dart';

class FundDetailScreen extends StatelessWidget {
  const FundDetailScreen({super.key, required this.fundId});
  final String fundId;

  static const _periods = ['1Y', '3Y', '5Y', 'Max'];

  double _returns5Y(FundModel fund) {
    if (fund.id == '1') return 19.4;
    return (fund.returns3Y * 1.15).clamp(1, 40);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FundDetailBloc, FundDetailState>(
      builder: (context, state) {
        if (state.isLoading || state.fund == null) {
          return Scaffold(
            backgroundColor: AppColors.background,
            body: SafeArea(
              child: Column(
                children: [
                  _DetailTopBar(fundId: fundId, fundName: 'Fund'),
                  const Expanded(
                    child: Center(
                      child: AppProgress(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        final fund = state.fund!;
        final period = state.selectedPeriod;
        final annualised = period == '5Y' || period == 'Max'
            ? _returns5Y(fund)
            : period == '3Y'
                ? fund.returns3Y
                : fund.returns3Y * 0.85;
        final cagrLabel = period == 'Max' ? 'Max CAGR' : '$period CAGR';
        final ratingLabel = fund.rating == fund.rating.roundToDouble()
            ? fund.rating.toStringAsFixed(0)
            : fund.rating.toStringAsFixed(1);

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              children: [
                _DetailTopBar(fundId: fund.id, fundName: fund.name),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FundAvatar(
                              fund: fund,
                              size: 64,
                              roundedSquare: true,
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    fund.name,
                                    style: TextStyles.heading2,
                                  ),
                                  const SizedBox(height: 10),
                                  Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: [
                                      _InfoChip(
                                        label: fund.category,
                                        background: AppColors.surfaceMuted,
                                        foreground: AppColors.textPrimary,
                                      ),
                                      _InfoChip(
                                        label: '★ $ratingLabel rated',
                                        background: AppColors.secondarySoft,
                                        foreground: AppColors.secondaryDark,
                                      ),
                                      _InfoChip(
                                        label: fund.riskLevel,
                                        background: const Color(0xFFFFECEC),
                                        foreground: AppColors.error,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NAV · Regular Growth',
                                    style: TextStyles.caption.copyWith(
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    Formatters.currencyDec(fund.nav),
                                    style: TextStyles.heading2,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  cagrLabel,
                                  style: TextStyles.caption.copyWith(
                                    color: AppColors.textMuted,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  Formatters.percentage(annualised),
                                  style: TextStyles.heading2.copyWith(
                                    color: AppColors.positive,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        FundLineChart(
                          baseNav: fund.nav,
                          period: period,
                          height: 180,
                          showGrid: false,
                          lineColor: AppColors.positive,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: _periods.map((p) {
                            final selected = period == p;
                            return Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: p == _periods.last ? 0 : 8,
                                ),
                                child: GestureDetector(
                                  onTap: () =>
                                      context.read<FundDetailBloc>().add(
                                            FundDetailEvent.chartPeriodChanged(
                                              p,
                                            ),
                                          ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 180),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: selected
                                          ? const Color(0xFFE8ECEA)
                                          : AppColors.surfaceMuted,
                                      borderRadius: BorderRadius.circular(20),
                                      border: selected
                                          ? Border.all(
                                              color: AppColors.primary
                                                  .withValues(alpha: 0.2),
                                            )
                                          : null,
                                    ),
                                    child: Text(
                                      p,
                                      textAlign: TextAlign.center,
                                      style: TextStyles.caption.copyWith(
                                        color: AppColors.textPrimary,
                                        fontWeight: selected
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: _StatTile(
                                label: 'Expense',
                                value: '${fund.expenseRatio}%',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _StatTile(
                                label: 'Fund size',
                                value: '₹${_formatCr(fund.fundSize)} Cr',
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _StatTile(
                                label: 'Min SIP',
                                value: Formatters.currency(fund.minSip),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 28),
                        Text(
                          'Where your money goes',
                          style: TextStyles.heading3.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ...fund.holdings.map(
                          (h) => _HoldingRow(holding: h),
                        ),
                        const SizedBox(height: 16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border(top: BorderSide(color: AppColors.divider)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _OutlineActionButton(
                      title: 'One-time',
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: LoadingActionButton(
                      title: 'Start SIP',
                      minLoadMs: 350,
                      onPressed: () async {
                        await Future<void>.delayed(
                          const Duration(milliseconds: 250),
                        );
                        if (context.mounted) {
                          NavigateTo.startSip(context, fundId);
                        }
                      },
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

  String _formatCr(double cr) {
    final f = cr >= 1000
        ? cr.toStringAsFixed(0).replaceAllMapped(
              RegExp(r'\B(?=(\d{3})+(?!\d))'),
              (m) => ',',
            )
        : cr.toStringAsFixed(0);
    return f;
  }
}

class _DetailTopBar extends StatelessWidget {
  const _DetailTopBar({required this.fundId, required this.fundName});

  final String fundId;
  final String fundName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      child: Row(
        children: [
          const AppBackButton(),
          const Spacer(),
          WatchlistToggleButton(
            fundId: fundId,
            fundName: fundName,
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.label,
    required this.background,
    required this.foreground,
  });

  final String label;
  final Color background;
  final Color foreground;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyles.caption.copyWith(
          color: foreground,
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
        boxShadow: AppColors.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.caption.copyWith(
              fontSize: 11,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyles.bodyBold.copyWith(fontSize: 14),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _HoldingRow extends StatelessWidget {
  const _HoldingRow({required this.holding});
  final HoldingModel holding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              holding.name,
              style: TextStyles.bodyBold,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            '${holding.percentage.toStringAsFixed(1)}%',
            style: TextStyles.bodyBold.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

class _OutlineActionButton extends StatelessWidget {
  const _OutlineActionButton({required this.title, this.onTap});
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(28),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppColors.primary, width: 1.5),
          ),
          child: Text(
            title,
            style: TextStyles.button.copyWith(color: AppColors.primary),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

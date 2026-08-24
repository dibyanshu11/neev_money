import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/mock_data.dart';
import 'package:new_app/domain/models/fund_model.dart';
import 'package:new_app/presentation/blocs/explore/explore_bloc.dart';
import 'package:new_app/presentation/blocs/explore/explore_event_state.dart';
import 'package:new_app/presentation/widgets/common_cards.dart';
import 'package:new_app/presentation/widgets/custom_bottom_nav.dart';
import 'package:new_app/presentation/widgets/fund_list_tile.dart';
import 'package:new_app/presentation/widgets/notifications_bell.dart';
import 'package:new_app/presentation/widgets/watchlist_toggle_button.dart';
import 'package:new_app/router/route_manager.dart';

const _filterChips = [
  'For you',
  'Equity',
  'Debt',
  'Hybrid',
  'ELSS',
];

/// Soft canvas behind fund cards — matches design board Explore tab.
const _exploreCanvas = Color(0xFFF7F9F8);

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        final funds = _filteredFunds(state);

        return ColoredBox(
          color: _exploreCanvas,
          child: SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ColoredBox(
                  color: AppColors.white,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Explore funds',
                                style: TextStyles.heading1.copyWith(fontSize: 24),
                              ),
                            ),
                            const NotificationsBell(),
                          ],
                        ),
                        const SizedBox(height: 14),
                        TextField(
                          onChanged: (query) => context
                              .read<ExploreBloc>()
                              .add(ExploreEvent.searchChanged(query)),
                          style: TextStyles.inputBold.copyWith(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Search funds',
                            hintStyle: TextStyles.body.copyWith(
                              color: AppColors.textMuted,
                            ),
                            prefixIcon: IconButton(
                              onPressed: null,
                              icon: AppIcon(
                                AppIcons.search(),
                                color: AppColors.textMuted,
                                size: AppIconSizes.md,
                              ),
                            ),
                            filled: true,
                            fillColor: AppColors.inputFill,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: AppColors.border,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: AppColors.border,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(
                                color: AppColors.primary,
                                width: 1.4,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 38,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: _filterChips.length,
                    itemBuilder: (context, index) {
                      final tag = _filterChips[index];
                      return FilterPill(
                        label: tag,
                        isSelected: state.selectedFilter == tag,
                        onTap: () => context.read<ExploreBloc>().add(
                              ExploreEvent.filterChanged(tag),
                            ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Picked for you',
                    style: TextStyles.sectionTitle.copyWith(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: state.isLoading && funds.isEmpty
                      ? const Center(
                          child: AppProgress(color: AppColors.primary),
                        )
                      : funds.isEmpty
                          ? Center(
                              child: Text(
                                'No funds match your search',
                                style: TextStyles.body.copyWith(
                                  color: AppColors.textMuted,
                                ),
                              ),
                            )
                          : ListView.builder(
                              padding: EdgeInsets.fromLTRB(
                                20,
                                0,
                                20,
                                CustomBottomNav.scrollBottomInset(context),
                              ),
                              physics: const BouncingScrollPhysics(),
                              itemCount: funds.length,
                              itemBuilder: (context, index) {
                                final fund = funds[index];
                                return _ExploreFundCard(
                                  fund: fund,
                                  onTap: () =>
                                      NavigateTo.fundDetail(context, fund.id),
                                  onInvest: () =>
                                      NavigateTo.fundDetail(context, fund.id),
                                );
                              },
                            ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  List<FundModel> _filteredFunds(ExploreState state) {
    final source = state.funds.isNotEmpty ? state.funds : MockData.funds;
    var funds = List<FundModel>.from(MockData.funds);

    if (state.selectedFilter != 'For you') {
      funds = funds
          .where((f) => _matchesCategory(f, state.selectedFilter))
          .toList();
    }

    if (state.searchQuery.isNotEmpty) {
      final query = state.searchQuery.toLowerCase();
      funds = funds.where((f) => f.name.toLowerCase().contains(query)).toList();
    }

    if (state.selectedFilter == 'For you' &&
        state.searchQuery.isEmpty &&
        source.length == funds.length) {
      return source;
    }

    return funds;
  }

  bool _matchesCategory(FundModel fund, String filter) {
    return switch (filter) {
      'Equity' =>
        fund.category == 'Flexi Cap' ||
            fund.category == 'Small Cap' ||
            fund.category == 'Index',
      'Debt' => fund.category == 'Debt',
      'Hybrid' => fund.category == 'Hybrid' || fund.category == 'Flexi Cap',
      'ELSS' => fund.category == 'ELSS',
      _ => fund.category == filter,
    };
  }
}

class _ExploreFundCard extends StatelessWidget {
  const _ExploreFundCard({
    required this.fund,
    required this.onTap,
    required this.onInvest,
  });

  final FundModel fund;
  final VoidCallback onTap;
  final VoidCallback onInvest;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              children: [
                Row(
                  children: [
                    FundAvatar(fund: fund, size: 44, roundedSquare: true),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            fund.name,
                            style: TextStyles.bodyBold,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            '${fund.category} · ${fund.riskLevel}',
                            style: TextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                    WatchlistToggleButton(
                      fundId: fund.id,
                      fundName: fund.name,
                      size: 36,
                      iconSize: AppIconSizes.sm,
                      filledBackground: false,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _Stat(
                        label: '3Y returns',
                        value: Formatters.percentage(fund.returns3Y),
                        valueColor: AppColors.positive,
                      ),
                    ),
                    Expanded(
                      child: _Stat(
                        label: 'Min SIP',
                        value: Formatters.currency(fund.minSip),
                      ),
                    ),
                    Material(
                      color: AppColors.investOrange,
                      borderRadius: BorderRadius.circular(24),
                      child: InkWell(
                        onTap: onInvest,
                        borderRadius: BorderRadius.circular(24),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 10,
                          ),
                          child: Text(
                            'Invest',
                            style: TextStyles.chip.copyWith(
                              color: AppColors.investButtonFg,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.label,
    required this.value,
    this.valueColor,
  });

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.caption.copyWith(fontSize: 11),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: TextStyles.amountSm.copyWith(
            color: valueColor ?? AppColors.textPrimary,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

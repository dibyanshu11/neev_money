import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/mock_data.dart';
import 'package:new_app/data/local/watchlist_storage.dart';
import 'package:new_app/presentation/widgets/app_back_button.dart';
import 'package:new_app/presentation/widgets/app_button.dart';
import 'package:new_app/presentation/widgets/fund_list_tile.dart';
import 'package:new_app/router/route_manager.dart';

class WatchlistScreen extends StatefulWidget {
  const WatchlistScreen({super.key});

  @override
  State<WatchlistScreen> createState() => _WatchlistScreenState();
}

class _WatchlistScreenState extends State<WatchlistScreen> {
  @override
  void initState() {
    super.initState();
    WatchlistStorage.instance.ensureLoaded().then((_) {
      if (mounted) setState(() {});
    });
    WatchlistStorage.instance.addListener(_onChange);
  }

  void _onChange() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    WatchlistStorage.instance.removeListener(_onChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ids = WatchlistStorage.instance.ids;
    final funds =
        MockData.funds.where((f) => ids.contains(f.id)).toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text('Wishlist', style: appBarTitleStyle),
        leading: appBarLeading(context),
      ),
      body: funds.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AppIcon(
                      AppIcons.favorite(),
                      size: 40,
                      color: AppColors.textMuted,
                    ),
                    const SizedBox(height: 16),
                    Text('No funds saved yet', style: TextStyles.heading3),
                    const SizedBox(height: 8),
                    Text(
                      'Tap the heart on any fund to add it to your wishlist.',
                      style: TextStyles.body,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              itemCount: funds.length,
              itemBuilder: (context, i) {
                final fund = funds[i];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.cardBorder),
                    boxShadow: AppColors.cardShadow,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () =>
                              NavigateTo.fundDetail(context, fund.id),
                          child: Row(
                            children: [
                              FundAvatar(fund: fund, size: 44),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      fund.name,
                                      style: TextStyles.bodyBold.copyWith(
                                        fontSize: 14,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      '${fund.riskLevel} · ${Formatters.percentage(fund.returns3Y)} 3Y',
                                      style: TextStyles.caption.copyWith(
                                        color: AppColors.textSecondary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await WatchlistStorage.instance.toggle(fund.id);
                        },
                        icon: AppIcon(
                          AppIcons.favorite(filled: true),
                          color: AppColors.error,
                        ),
                      ),
                      const SizedBox(width: 4),
                      SizedBox(
                        width: 88,
                        child: LoadingActionButton(
                          title: 'Invest',
                          bgColor: AppColors.investOrange,
                          textColor: AppColors.investButtonFg,
                          minLoadMs: 400,
                          onPressed: () async {
                            await Future<void>.delayed(
                              const Duration(milliseconds: 350),
                            );
                            if (context.mounted) {
                              NavigateTo.kycDetails(context, fund.id);
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

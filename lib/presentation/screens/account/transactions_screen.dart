import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/app_icon_sizes.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/datasources/local/transaction_mock.dart';
import 'package:new_app/presentation/widgets/app_back_button.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  Map<String, List<TransactionItem>> _grouped(List<TransactionItem> items) {
    final map = <String, List<TransactionItem>>{};
    final monthFmt = DateFormat('MMMM yyyy');
    final sorted = [...items]..sort((a, b) => b.date.compareTo(a.date));
    for (final tx in sorted) {
      final key = monthFmt.format(tx.date).toUpperCase();
      map.putIfAbsent(key, () => []).add(tx);
    }
    return map;
  }

  @override
  Widget build(BuildContext context) {
    final groups = _grouped(TransactionMock.items);
    final keys = groups.keys.toList();

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text('Activity', style: appBarTitleStyle),
        leading: appBarLeading(context),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
        physics: const BouncingScrollPhysics(),
        itemCount: keys.length,
        itemBuilder: (context, index) {
          final month = keys[index];
          final items = groups[month]!;
          return Padding(
            padding: EdgeInsets.only(bottom: index == keys.length - 1 ? 0 : 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 10),
                  child: Text(
                    month,
                    style: TextStyles.caption.copyWith(
                      color: AppColors.textMuted,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.4,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.cardBorder),
                  ),
                  child: Column(
                    children: [
                      for (var i = 0; i < items.length; i++) ...[
                        _ActivityRow(item: items[i]),
                        if (i < items.length - 1)
                          const Divider(
                            height: 1,
                            indent: 70,
                            endIndent: 16,
                            color: AppColors.divider,
                          ),
                      ],
                    ],
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

class _ActivityRow extends StatelessWidget {
  const _ActivityRow({required this.item});
  final TransactionItem item;

  ({AppIconSpec icon, Color bg, Color fg}) get _visual => switch (item.type) {
        TxnType.redeem => (
            icon: AppIcons.withdraw(),
            bg: const Color(0xFFFFF0F0),
            fg: AppColors.error,
          ),
        TxnType.processing => (
            icon: AppIcons.history(),
            bg: AppColors.secondarySoft,
            fg: AppColors.secondaryDark,
          ),
        TxnType.sip => (
            icon: AppIcons.sip(),
            bg: AppColors.chipSelectedBg,
            fg: AppColors.primary,
          ),
        TxnType.oneTime => (
            icon: AppIcons.trendingUp(),
            bg: AppColors.chipSelectedBg,
            fg: AppColors.primary,
          ),
      };

  Color get _statusColor => switch (item.status) {
        TxnStatus.allotted => AppColors.positive,
        TxnStatus.processing => AppColors.secondaryDark,
        TxnStatus.credited => AppColors.textMuted,
      };

  @override
  Widget build(BuildContext context) {
    final v = _visual;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: v.bg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: AppIcon(v.icon, size: AppIconSizes.md, color: v.fg),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyles.bodyBold.copyWith(fontSize: 14),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 3),
                Text(
                  item.subtitle,
                  style: TextStyles.caption.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(item.amountLabel, style: TextStyles.amountSm),
              const SizedBox(height: 3),
              Text(
                item.statusLabel,
                style: TextStyles.caption.copyWith(
                  color: _statusColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

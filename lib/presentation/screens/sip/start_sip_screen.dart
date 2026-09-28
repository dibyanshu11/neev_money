import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/constants/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/blocs/sip/sip_bloc.dart';
import 'package:new_app/presentation/blocs/sip/sip_event_state.dart';
import 'package:new_app/presentation/screens/sip/confirm_pay_screen.dart';
import 'package:new_app/presentation/widgets/app_back_button.dart';
import 'package:new_app/presentation/widgets/app_button.dart';
import 'package:new_app/presentation/widgets/common_cards.dart';
import 'package:new_app/presentation/widgets/fund_list_tile.dart';

class StartSipScreen extends StatefulWidget {
  const StartSipScreen({super.key, required this.fundId});
  final String fundId;

  @override
  State<StartSipScreen> createState() => _StartSipScreenState();
}

class _StartSipScreenState extends State<StartSipScreen> {
  static const _quickAmounts = [500.0, 1000.0, 5000.0];
  static const _debitDays = [1, 5, 10, 15, 20, 25];
  double? _lastQuickAdd;

  String _daySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    return switch (day % 10) {
      1 => 'st',
      2 => 'nd',
      3 => 'rd',
      _ => 'th',
    };
  }

  String _projectedLabel(double value) => '≈ ${Formatters.currency(value)}';

  Future<void> _pickDebitDay(BuildContext context, int current) async {
    final selected = await showModalBottomSheet<int>(
      context: context,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(22)),
      ),
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Deduct on', style: TextStyles.heading3),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _debitDays.map((day) {
                    final selectedDay = day == current;
                    return FilterPill(
                      label: '$day${_daySuffix(day)}',
                      isSelected: selectedDay,
                      compact: true,
                      onTap: () => Navigator.pop(ctx, day),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        );
      },
    );
    if (selected != null && context.mounted) {
      context.read<SipBloc>().add(SipEvent.debitDayChanged(selected));
    }
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
      title: Text('Start a SIP', style: appBarTitleStyle),
      leading: appBarLeading(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SipBloc, SipState>(
      builder: (context, state) {
        if (state.isLoading && state.fund == null) {
          return Scaffold(
            backgroundColor: AppColors.background,
            appBar: _appBar(context),
            body: const Center(
              child: AppProgress(color: AppColors.primary),
            ),
          );
        }

        final fund = state.fund;
        final projected = context.read<SipBloc>().projectedValue;

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: _appBar(context),
          body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (fund != null) ...[
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.chipSelectedBg,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        FundAvatar(
                          fund: fund,
                          size: 44,
                          roundedSquare: true,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                fund.name,
                                style: TextStyles.bodyBold.copyWith(fontSize: 15),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Regular · Growth',
                                style: TextStyles.caption.copyWith(
                                  color: AppColors.textSecondary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 28),
                ],
                Text(
                  'EVERY MONTH',
                  style: TextStyles.label.copyWith(
                    color: AppColors.textMuted,
                    letterSpacing: 1.1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  Formatters.currency(state.amount),
                  style: TextStyles.amount,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _quickAmounts.map((amt) {
                    final selected = _lastQuickAdd == amt;
                    return FilterPill(
                      label: '+${Formatters.currency(amt)}',
                      isSelected: selected,
                      compact: true,
                      onTap: () {
                        final next =
                            (state.amount + amt).clamp(500.0, 100000.0);
                        setState(() => _lastQuickAdd = amt);
                        context
                            .read<SipBloc>()
                            .add(SipEvent.amountChanged(next));
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 10),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: AppColors.lightGrey,
                    thumbColor: AppColors.white,
                    overlayColor: AppColors.primary.withValues(alpha: 0.12),
                    trackHeight: 6,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 12,
                      elevation: 2,
                    ),
                    trackShape: const RoundedRectSliderTrackShape(),
                  ),
                  child: Slider(
                    value: state.amount.clamp(500, 100000),
                    min: 500,
                    max: 100000,
                    divisions: 199,
                    onChanged: (v) {
                      setState(() => _lastQuickAdd = null);
                      context
                          .read<SipBloc>()
                          .add(SipEvent.amountChanged(v.roundToDouble()));
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('₹500', style: TextStyles.caption),
                    Text('₹1,00,000', style: TextStyles.caption),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'DEDUCT ON',
                  style: TextStyles.label.copyWith(
                    color: AppColors.textMuted,
                    letterSpacing: 1.1,
                  ),
                ),
                const SizedBox(height: 8),
                Material(
                  color: AppColors.surfaceMuted,
                  borderRadius: BorderRadius.circular(16),
                  child: InkWell(
                    onTap: () => _pickDebitDay(context, state.debitDay),
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${state.debitDay}${_daySuffix(state.debitDay)} of every month',
                              style: TextStyles.bodyBold.copyWith(fontSize: 15),
                            ),
                          ),
                          AppIcon(
                            AppIcons.chevronDown(),
                            size: AppIconSizes.md,
                            color: AppColors.textMuted,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 20),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Projected in 10 years · 14% p.a.',
                        style: TextStyles.caption.copyWith(
                          color: AppColors.white.withValues(alpha: 0.78),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _projectedLabel(projected),
                        style: TextStyles.display.copyWith(
                          color: AppColors.white,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
              child: LoadingActionButton(
                title: 'Set up auto-pay',
                minLoadMs: 500,
                onPressed: () async {
                  await Future<void>.delayed(const Duration(milliseconds: 400));
                  if (!context.mounted) return;
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: context.read<SipBloc>(),
                        child: const ConfirmPayScreen(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

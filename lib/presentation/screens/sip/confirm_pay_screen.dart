import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/presentation/blocs/sip/sip_bloc.dart';
import 'package:new_app/presentation/blocs/sip/sip_event_state.dart';
import 'package:new_app/presentation/widgets/app_back_button.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/widgets/app_button.dart';
import 'package:new_app/presentation/widgets/common_cards.dart';
import 'package:new_app/core/utils/toast_utils.dart';
import 'package:new_app/router/route_manager.dart';

class ConfirmPayScreen extends StatelessWidget {
  const ConfirmPayScreen({super.key});

  String _daySuffix(int day) {
    if (day >= 11 && day <= 13) return 'th';
    return switch (day % 10) {
      1 => 'st',
      2 => 'nd',
      3 => 'rd',
      _ => 'th',
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SipBloc, SipState>(
      listener: (context, state) {
        if (state.confirmation != null) {
          NavigateTo.success(context, state.confirmation);
        }
        if (state.error != null) {
          ToastUtils.showToast(
            context,
            message: state.error,
            type: ToastType.error,
          );
        }
      },
      builder: (context, state) {
        final fund = state.fund;
        final amountLabel = Formatters.currency(state.amount);

        return Scaffold(
          backgroundColor: AppColors.background,
          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            scrolledUnderElevation: 0,
            centerTitle: true,
            title: Text('Confirm & pay', style: appBarTitleStyle),
            leading: appBarLeading(context),
          ),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SummaryRow(
                        label: 'Fund',
                        value: fund?.name ?? '—',
                      ),
                      const SizedBox(height: 16),
                      _SummaryRow(
                        label: 'Schedule',
                        value:
                            'Monthly · ${state.debitDay}${_daySuffix(state.debitDay)}',
                      ),
                      const SizedBox(height: 16),
                      _SummaryRow(
                        label: 'Amount',
                        value: '$amountLabel / month',
                      ),
                      const SizedBox(height: 18),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.surfaceMuted,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Pay today',
                              style: TextStyles.body.copyWith(
                                color: AppColors.textSecondary,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              amountLabel,
                              style: TextStyles.bodyBold.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 28),
                      Text(
                        "How you'll pay",
                        style: TextStyles.heading3.copyWith(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _PaymentOption(
                        title: 'UPI Auto-pay',
                        subtitle: 'Approve once in any UPI app',
                        icon: AppIcons.wallet(),
                        iconBg: AppColors.chipSelectedBg,
                        iconColor: AppColors.primary,
                        isSelected: state.paymentMethod == 'UPI Auto-pay',
                        onTap: () => context.read<SipBloc>().add(
                              const SipEvent.paymentMethodChanged(
                                'UPI Auto-pay',
                              ),
                            ),
                      ),
                      _PaymentOption(
                        title: 'Net-banking mandate',
                        subtitle: 'HDFC •••• 4821',
                        icon: AppIcons.creditCard(),
                        iconBg: AppColors.surfaceMuted,
                        iconColor: AppColors.textMuted,
                        isSelected:
                            state.paymentMethod == 'Net-banking mandate',
                        onTap: () => context.read<SipBloc>().add(
                              const SipEvent.paymentMethodChanged(
                                'Net-banking mandate',
                              ),
                            ),
                      ),
                      const SizedBox(height: 8),
                      SecurityBanner(
                        message:
                            'Capped at $amountLabel. We can never take more without you approving it.',
                      ),
                    ],
                  ),
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                  child: Column(
                    children: [
                      AppButton(
                        title: 'Pay $amountLabel & approve',
                        isLoading: state.isSubmitting,
                        borderRadius: 28,
                        height: 54,
                        onTap: state.isSubmitting
                            ? null
                            : () => context
                                .read<SipBloc>()
                                .add(const SipEvent.submit()),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Distributed by JK Capital · ARN-XXXXXX',
                        style: TextStyles.caption.copyWith(
                          color: AppColors.textMuted,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
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

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 88,
          child: Text(
            label,
            style: TextStyles.body.copyWith(color: AppColors.textMuted),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyles.bodyBold.copyWith(fontSize: 15),
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }
}

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.isSelected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final AppIconSpec icon;
  final Color iconBg;
  final Color iconColor;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Material(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected ? AppColors.primary : AppColors.cardBorder,
                width: isSelected ? 1.8 : 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AppIcon(icon, color: iconColor, size: AppIconSizes.xl),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyles.bodyBold),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyles.caption.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isSelected ? AppColors.primary : Colors.transparent,
                    border: Border.all(
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textMuted.withValues(alpha: 0.45),
                      width: 1.6,
                    ),
                  ),
                  child: isSelected
                      ? AppIcon(
                          AppIcons.check(),
                          size: AppIconSizes.xs,
                          color: AppColors.white,
                        )
                      : null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

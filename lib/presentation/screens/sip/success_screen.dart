import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/domain/models/sip_model.dart';
import 'package:new_app/presentation/widgets/app_button.dart';
import 'package:new_app/router/route_manager.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, this.confirmation});
  final SipConfirmation? confirmation;

  @override
  Widget build(BuildContext context) {
    final amount = confirmation?.amount ?? 5000;
    final fundName = confirmation?.fundName ?? 'your fund';
    final amountText = Formatters.currency(amount);
    final whiteBody = TextStyles.body.copyWith(
      color: AppColors.white.withValues(alpha: 0.88),
      height: 1.5,
      fontSize: 15,
    );
    final whiteBold = TextStyles.bodyBold.copyWith(
      color: AppColors.white,
      fontSize: 15,
      height: 1.5,
    );

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                width: 88,
                height: 88,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: AppIcon(
                    AppIcons.checkPlain(),
                    size: 42,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                "You're all set! 🎉",
                style: TextStyles.display.copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 14),
              Text.rich(
                TextSpan(
                  style: whiteBody,
                  children: [
                    const TextSpan(text: 'Your '),
                    TextSpan(text: amountText, style: whiteBold),
                    const TextSpan(text: ' monthly SIP in '),
                    TextSpan(text: fundName, style: whiteBold),
                    const TextSpan(
                      text:
                          ' is live. First investment will be allotted in 2–3 working days.',
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    _row(
                      'Next auto-debit',
                      confirmation != null
                          ? Formatters.shortDate(confirmation!.nextDebitDate)
                          : '5 Aug 2026',
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Divider(color: Colors.white24, height: 1),
                    ),
                    _row('Folio number', 'Ready in 48 hrs'),
                  ],
                ),
              ),
              const Spacer(flex: 3),
              AppButton(
                title: 'See my portfolio',
                bgColor: AppColors.secondary,
                textColor: AppColors.primary,
                borderRadius: 28,
                padding: const EdgeInsets.symmetric(vertical: 18),
                onTap: () => NavigateTo.mainShell(context, tab: 2),
              ),
              const SizedBox(height: 12),
              OutlineButton(
                title: 'Go to dashboard',
                borderColor: AppColors.white.withValues(alpha: 0.45),
                textColor: AppColors.white,
                onTap: () => NavigateTo.mainShell(context),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyles.caption.copyWith(
            color: Colors.white.withValues(alpha: 0.65),
            fontSize: 13,
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyles.bodyBold.copyWith(
            color: AppColors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

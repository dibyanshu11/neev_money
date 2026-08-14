import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';
import 'package:new_app/router/route_manager.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key, required this.state, required this.bloc});

  final OnboardingState state;
  final OnboardingBloc bloc;

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  void initState() {
    super.initState();
    // After setup or login, always open the Home dashboard.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      NavigateTo.mainShell(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final band = widget.bloc.getBand();
    final goal = goalById(widget.state.selectedGoalId);
    final rm = rmById(widget.state.selectedRmId);
    final total = widget.bloc.getTotalAmount();

    return ColoredBox(
      color: AppColors.primary,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                width: 96,
                height: 96,
                decoration: const BoxDecoration(
                  color: AppColors.secondary,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: AppIcon(
                    AppIcons.check(),
                    color: AppColors.primary,
                    size: 44,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text(
                'You’re all set',
                style: TextStyles.heading1.copyWith(color: AppColors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'Opening your dashboard…',
                style: TextStyles.body.copyWith(
                  color: Colors.white.withValues(alpha: 0.75),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.10),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    _DarkSummaryRow(
                      label: 'Goal',
                      value: goal?.label ?? 'Your goal',
                    ),
                    const Divider(color: Colors.white24, height: 22),
                    _DarkSummaryRow(
                      label: 'Target',
                      value: Formatters.currency(total),
                    ),
                    const Divider(color: Colors.white24, height: 22),
                    _DarkSummaryRow(
                      label: 'RM',
                      value: rm?.name ?? 'Assigned soon',
                    ),
                    const Divider(color: Colors.white24, height: 22),
                    _DarkSummaryRow(label: 'Profile', value: band.label),
                  ],
                ),
              ),
              const Spacer(flex: 3),
              const AppProgress(color: AppColors.secondary),
              const SizedBox(height: 16),
              NeevOutlineButton(
                title: 'Go to dashboard',
                accent: true,
                onTap: () => NavigateTo.mainShell(context),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class _DarkSummaryRow extends StatelessWidget {
  const _DarkSummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyles.caption.copyWith(
            color: Colors.white.withValues(alpha: 0.65),
          ),
        ),
        const Spacer(),
        Text(
          value,
          style: TextStyles.bodyBold.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}

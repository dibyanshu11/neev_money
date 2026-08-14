import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/data/local/onboarding_data.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';

class GoalDetailPage extends StatelessWidget {
  const GoalDetailPage({super.key, required this.state});

  final OnboardingState state;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    final goal = goalById(state.selectedGoalId);
    final label = state.selectedGoalId == 'other' &&
            (bloc.customGoalLabel?.isNotEmpty ?? false)
        ? bloc.customGoalLabel!
        : (goal?.label ?? 'your goal');
    final ordinal = bloc.currentGoalOrdinal;
    final total = bloc.pendingGoalsTotal;
    final moreQueued = bloc.pendingGoalIds.length > 1;

    return OnboardingPage(
      bottom: NeevOutlineButton(
        title: moreQueued ? 'Save & next goal' : 'Save goal',
        filled: true,
        enabled: bloc.goalDetailValid,
        onTap: () => bloc.add(const OnboardingEvent.continueFromGoalDetail()),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (total > 1) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: AppColors.chipSelectedBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Goal $ordinal of $total',
                style: TextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 14),
          ],
          Text(
            label,
            style: TextStyles.heading1,
          ),
          const SizedBox(height: 8),
          Text(
            '2 questions on this screen — Tenure and Amount. We’ll suggest a monthly SIP from this.',
            style: TextStyles.body.copyWith(
              height: 1.45,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.chipSelectedBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '1 · Tenure    ·    2 · Amount',
              style: TextStyles.caption.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 18),
          _QuestionCard(
            number: '1',
            title: 'Tenure',
            subtitle: 'How long do you have to reach this goal?',
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                for (final tf in timeframeOptions)
                  NeevChip(
                    label: tf.label,
                    selected: state.timeframeId == tf.id,
                    onTap: () =>
                        bloc.add(OnboardingEvent.timeframeSelected(tf.id)),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          _QuestionCard(
            number: '2',
            title: 'Amount',
            subtitle: 'Pick a target corpus — or enter your own in lakhs',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ChipWrap(
                  options: amountOptions,
                  selectedId: state.amountId,
                  onSelected: (id) =>
                      bloc.add(OnboardingEvent.amountSelected(id)),
                ),
                if (state.amountId == 'custom') ...[
                  const SizedBox(height: 14),
                  NeevTextField(
                    value: state.customAmount,
                    hint: 'Amount in ₹ lakhs (e.g. 15)',
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                    ],
                    onChanged: (v) =>
                        bloc.add(OnboardingEvent.customAmountChanged(v)),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  const _QuestionCard({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String number;
  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 16, 18, 18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  number,
                  style: TextStyles.bodyBold.copyWith(
                    color: AppColors.white,
                    fontSize: 13,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyles.bodyBold.copyWith(
                  fontSize: 17,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyles.caption.copyWith(
              color: AppColors.textMuted,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

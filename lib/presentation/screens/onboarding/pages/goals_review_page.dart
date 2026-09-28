import 'package:flutter/material.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';

class GoalsReviewPage extends StatefulWidget {
  const GoalsReviewPage({super.key, required this.state, required this.bloc});

  final OnboardingState state;
  final OnboardingBloc bloc;

  @override
  State<GoalsReviewPage> createState() => _GoalsReviewPageState();
}

class _GoalsReviewPageState extends State<GoalsReviewPage> {
  OnboardingBloc get bloc => widget.bloc;

  double get _totalCorpus =>
      bloc.savedGoals.fold<double>(0, (sum, g) => sum + g.amountValue);

  @override
  Widget build(BuildContext context) {
    final goalsList = bloc.savedGoals;

    return OnboardingPage(
      bottom: Column(
        children: [
          NeevOutlineButton(
            title: goalsList.length > 1
                ? 'Continue with ${goalsList.length} goals'
                : 'Continue to quick check',
            filled: true,
            enabled: goalsList.isNotEmpty,
            onTap: () =>
                bloc.add(const OnboardingEvent.continueFromGoalsReview()),
          ),
          const SizedBox(height: 10),
          NeevOutlineButton(
            title: 'Add another goal',
            onTap: () => bloc.add(const OnboardingEvent.addAnotherGoal()),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            goalsList.length > 1 ? 'Your goals' : 'Your goal',
            style: TextStyles.heading1.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            goalsList.length > 1
                ? 'Here’s everything you set. Add more, or continue — we’ll build a plan around each one.'
                : 'Looks good. You can add another goal, or continue to personalise your risk profile.',
            style: TextStyles.body.copyWith(
              height: 1.45,
              color: AppColors.textSecondary,
            ),
          ),
          if (goalsList.isNotEmpty) ...[
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.primarySoft, AppColors.primary],
                ),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Combined target',
                          style: TextStyles.caption.copyWith(
                            color: Colors.white.withValues(alpha: 0.75),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          Formatters.currency(_totalCorpus),
                          style: TextStyles.heading1.copyWith(color: AppColors.white),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Text(
                      '${goalsList.length} goal${goalsList.length == 1 ? '' : 's'}',
                      style: TextStyles.bodyBold.copyWith(
                        color: AppColors.secondary,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          const SizedBox(height: 20),
          for (var i = 0; i < goalsList.length; i++)
            _GoalReviewCard(
              goal: goalsList[i],
              index: i + 1,
              canRemove: goalsList.length > 1,
              onRemove: () {
                bloc.removeSavedGoal(goalsList[i].goalId);
                setState(() {});
              },
            ),
          if (goalsList.isEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surfaceMuted,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: AppColors.border),
              ),
              child: Text(
                'No goals yet — go back and add one, or tap Add another goal.',
                style: TextStyles.body.copyWith(color: AppColors.textSecondary),
              ),
            ),
        ],
      ),
    );
  }
}

class _GoalReviewCard extends StatelessWidget {
  const _GoalReviewCard({
    required this.goal,
    required this.index,
    required this.canRemove,
    required this.onRemove,
  });

  final SavedGoalDraft goal;
  final int index;
  final bool canRemove;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 52,
            height: 52,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.chipSelectedBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              goalEmoji(goal.goalId),
              style: const TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Goal $index',
                  style: TextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  goal.label,
                  style: TextStyles.bodyBold.copyWith(
                    fontSize: 17,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _MetaPill(
                        label: 'Amount',
                        value: goal.amountLabel,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _MetaPill(
                        label: 'Tenure',
                        value: goal.tenureLabel,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (canRemove)
            IconButton(
              onPressed: onRemove,
              tooltip: 'Remove',
              visualDensity: VisualDensity.compact,
              icon: AppIcon(
                AppIcons.close(),
                size: 20,
                color: AppColors.textMuted.withValues(alpha: 0.9),
              ),
            ),
        ],
      ),
    );
  }
}

class _MetaPill extends StatelessWidget {
  const _MetaPill({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.caption.copyWith(
              fontSize: 10,
              color: AppColors.textMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: TextStyles.bodyBold.copyWith(
              fontSize: 13,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

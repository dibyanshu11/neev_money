
import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/data/local/onboarding_data.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';

class RiskResultPage extends StatefulWidget {
  const RiskResultPage({super.key, required this.bloc});

  final OnboardingBloc bloc;

  @override
  State<RiskResultPage> createState() => _RiskResultPageState();
}


class _RiskResultPageState extends State<RiskResultPage> {
  int _goalIndex = 0;

  List<SavedGoalDraft> get _goals {
    final list = widget.bloc.savedGoals;
    if (list.isNotEmpty) return list;
    final g = goalById(widget.bloc.state.selectedGoalId);
    return [
      SavedGoalDraft(
        goalId: g?.id ?? 'education',
        label: g?.label ?? "Child's education",
        amountLabel: Formatters.currency(widget.bloc.getTotalAmount()),
        tenureLabel: '15 yrs',
        amountValue: widget.bloc.getTotalAmount() > 0
            ? widget.bloc.getTotalAmount()
            : 4000000,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bloc = widget.bloc;
    final band = bloc.getBand();
    final goalsList = _goals;
    final goal = goalsList[_goalIndex.clamp(0, goalsList.length - 1)];
    final activeIdx = bands.indexWhere((b) => b.key == band.key);

    return OnboardingPage(
      bottom: NeevOutlineButton(
        title: 'See my portfolio',
        filled: true,
        onTap: () => bloc.add(const OnboardingEvent.goToRmIntro()),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 18,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'YOUR PLAN IS READY',
                style: TextStyles.label.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            goalsList.length > 1
                ? 'A plan built around your goals'
                : 'A portfolio built around your goal',
            style: TextStyles.heading1.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            goalsList.length > 1
                ? 'Switch goals below to preview each target. Risk stays the same across your plan.'
                : "Matched to what you're saving for and how much risk you're comfortable with.",
            style: TextStyles.body.copyWith(
              color: AppColors.textSecondary,
              height: 1.45,
            ),
          ),
          if (goalsList.length > 1) ...[
            const SizedBox(height: 18),
            SizedBox(
              height: 44,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: goalsList.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final selected = i == _goalIndex;
                  final g = goalsList[i];
                  return GestureDetector(
                    onTap: () => setState(() => _goalIndex = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selected ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: selected
                              ? AppColors.primary
                              : AppColors.border,
                        ),
                      ),
                      child: Row(
                        children: [
                          Text(
                            goalEmoji(g.goalId),
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            g.label,
                            style: TextStyles.bodyBold.copyWith(
                              fontSize: 13,
                              color: selected
                                  ? AppColors.white
                                  : AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: 18),
          _PlanGoalCard(goal: goal),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.cardBorder),
              boxShadow: AppColors.cardShadow,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Your risk profile', style: TextStyles.bodyBold),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.chipSelectedBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        band.label,
                        style: TextStyles.caption.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    for (var i = 0; i < bands.length; i++) ...[
                      if (i > 0) const SizedBox(width: 6),
                      Expanded(
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 220),
                          height: 8,
                          decoration: BoxDecoration(
                            color: i == activeIdx
                                ? AppColors.primary
                                : AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Conservative', style: TextStyles.caption),
                    Text(
                      'Balanced',
                      style: TextStyles.caption.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.primary,
                      ),
                    ),
                    Text('Aggressive', style: TextStyles.caption),
                  ],
                ),
                const SizedBox(height: 14),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceMuted,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppIcon(
                        AppIcons.balance(),
                        size: 20,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          band.desc,
                          style: TextStyles.caption.copyWith(
                            color: AppColors.textSecondary,
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _PlanGoalCard extends StatelessWidget {
  const _PlanGoalCard({required this.goal});

  final SavedGoalDraft goal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(22),
        boxShadow: AppColors.softShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: AppIcon(
                  goalIcon(goal.goalId),
                  color: AppColors.secondary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Your goal',
                      style: TextStyles.caption.copyWith(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    Text(
                      goal.label,
                      style: TextStyles.bodyBold.copyWith(
                        color: AppColors.white,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Target corpus',
                      style: TextStyles.caption.copyWith(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      Formatters.currency(goal.amountValue),
                      style: TextStyles.heading1.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Time horizon',
                      style: TextStyles.caption.copyWith(
                        color: Colors.white.withValues(alpha: 0.7),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      goal.tenureLabel,
                      style: TextStyles.bodyBold.copyWith(
                        color: AppColors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: 0.04,
              minHeight: 6,
              backgroundColor: Colors.white.withValues(alpha: 0.18),
              color: AppColors.secondary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "₹0 saved so far — let's begin the foundation",
            style: TextStyles.caption.copyWith(
              color: Colors.white.withValues(alpha: 0.75),
            ),
          ),
        ],
      ),
    );
  }
}


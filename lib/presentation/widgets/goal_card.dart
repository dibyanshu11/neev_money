import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/data/local/goals_data.dart';

/// Dashboard / goals list card — letter avatar, amount, status badge.
class GoalCard extends StatelessWidget {
  const GoalCard({super.key, required this.goal, this.onTap});

  final GoalItem goal;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.cardBorder),
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: goal.avatarColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  goal.initials,
                  style: TextStyles.bodyBold.copyWith(
                    color: AppColors.white,
                    fontSize: 16,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      goal.title,
                      style: TextStyles.bodyBold.copyWith(
                        color: AppColors.textPrimary,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${Formatters.currency(goal.saved)} of ${Formatters.currency(goal.target)}',
                      style: TextStyles.caption,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: goal.badgeBg,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        goal.badge,
                        style: TextStyles.caption.copyWith(
                          color: goal.badgeFg,
                          fontWeight: FontWeight.w700,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

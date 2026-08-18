
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/data/local/onboarding_data.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key, required this.state});

  final OnboardingState state;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    final question = quiz[state.quizStep];
    final selectedIndex = state.quizSelectedOption;
    final shapingLabel = selectedIndex != null
        ? question.options[selectedIndex].bandLabel
        : null;

    final isLast = state.quizStep >= quiz.length - 1;

    return OnboardingPage(
      bottom: NeevOutlineButton(
        title: isLast ? 'See my profile' : 'Next question',
        filled: true,
        enabled: selectedIndex != null,
        onTap: () => bloc.add(const OnboardingEvent.quizAdvanceAfterAnswer()),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _QuizStepIndicator(
            current: state.quizStep,
            total: quiz.length,
          ),
          const SizedBox(height: 18),
          Text(
            'Answer a few questions to help us build your customized portfolio',
            style: TextStyles.body.copyWith(
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 14),
          Text(
            question.text,
            style: TextStyles.heading2.copyWith(height: 1.25),
          ),
          if (question.subtitle.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              question.subtitle,
              style: TextStyles.body.copyWith(
                height: 1.45,
                color: AppColors.textSecondary,
              ),
            ),
          ],
          if (state.quizStep == 0) ...[
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceMuted,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Imagine markets fall about 15% in a month — pick what you’d do.',
                style: TextStyles.caption.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                  height: 1.35,
                ),
              ),
            ),
          ],
          const SizedBox(height: 20),
          for (var i = 0; i < question.options.length; i++)
            _RiskOptionCard(
              title: question.options[i].text,
              subtitle: question.options[i].subtitle,
              selected: selectedIndex == i,
              onTap: () => bloc.add(
                OnboardingEvent.quizAnswered(
                  optionIndex: i,
                  score: question.options[i].score,
                ),
              ),
            ),
          if (shapingLabel != null) ...[
            const SizedBox(height: 8),
            _ShapingUpCard(label: shapingLabel),
          ],
        ],
      ),
    );
  }
}

class _QuizStepIndicator extends StatelessWidget {
  const _QuizStepIndicator({
    required this.current,
    required this.total,
  });

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Step ${current + 1} of $total',
          style: TextStyles.caption.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            for (var i = 0; i < total; i++) ...[
              if (i > 0)
                Expanded(
                  child: Container(
                    height: 2,
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    color: i <= current
                        ? AppColors.primary
                        : AppColors.border,
                  ),
                ),
              Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: i <= current
                      ? AppColors.primary
                      : AppColors.surfaceMuted,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: i <= current
                        ? AppColors.primary
                        : AppColors.border,
                  ),
                ),
                child: Text(
                  '${i + 1}',
                  style: TextStyles.caption.copyWith(
                    color: i <= current
                        ? AppColors.white
                        : AppColors.textMuted,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}


class _RiskOptionCard extends StatelessWidget {
  const _RiskOptionCard({
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.fromLTRB(16, 16, 14, 16),
            decoration: BoxDecoration(
              color: selected ? AppColors.primary : AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: selected ? AppColors.primary : AppColors.border,
                width: 1.4,
              ),
              boxShadow: selected ? null : AppColors.cardShadow,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyles.bodyBold.copyWith(
                          fontSize: 16,
                          color: selected
                              ? AppColors.white
                              : AppColors.textPrimary,
                          height: 1.3,
                        ),
                      ),
                      if (subtitle.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          style: TextStyles.caption.copyWith(
                            color: selected
                                ? Colors.white.withValues(alpha: 0.78)
                                : AppColors.textMuted,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: selected ? AppColors.white : Colors.transparent,
                    border: Border.all(
                      color: selected
                          ? AppColors.white
                          : AppColors.textMuted.withValues(alpha: 0.55),
                      width: 2,
                    ),
                  ),
                  child: selected
                      ? Center(
                          child: Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
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


class _ShapingUpCard extends StatelessWidget {
  const _ShapingUpCard({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.chipSelectedBg,
        borderRadius: BorderRadius.circular(12),
        boxShadow: AppColors.cardShadow,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "YOU'RE SHAPING UP AS",
                  style: TextStyles.caption.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.6,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  label,
                  style: TextStyles.heading3.copyWith(
                    color: AppColors.primary,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 44,
            height: 36,
            child: CustomPaint(painter: _MiniBarsPainter(label: label)),
          ),
        ],
      ),
    );
  }
}


class _MiniBarsPainter extends CustomPainter {
  _MiniBarsPainter({required this.label});

  final String label;

  @override
  void paint(Canvas canvas, Size size) {
    final active = Paint()..color = AppColors.primary;
    final muted = Paint()..color = AppColors.primary.withValues(alpha: 0.28);
    final heights = switch (label.toLowerCase()) {
      'conservative' => [0.9, 0.45, 0.3],
      'aggressive' => [0.3, 0.55, 0.95],
      _ => [0.4, 0.95, 0.55],
    };
    final activeIndex = switch (label.toLowerCase()) {
      'conservative' => 0,
      'aggressive' => 2,
      _ => 1,
    };
    const gap = 6.0;
    final barW = (size.width - gap * 2) / 3;
    for (var i = 0; i < 3; i++) {
      final h = size.height * heights[i];
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(i * (barW + gap), size.height - h, barW, h),
        const Radius.circular(4),
      );
      canvas.drawRRect(rect, i == activeIndex ? active : muted);
    }
  }

  @override
  bool shouldRepaint(covariant _MiniBarsPainter oldDelegate) =>
      oldDelegate.label != label;
}


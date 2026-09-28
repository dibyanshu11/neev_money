import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/data/datasources/local/onboarding_data.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';

class GoalSelectPage extends StatefulWidget {
  const GoalSelectPage({super.key, required this.state});

  final OnboardingState state;

  @override
  State<GoalSelectPage> createState() => _GoalSelectPageState();
}

class _GoalSelectPageState extends State<GoalSelectPage> {
  final _otherController = TextEditingController();
  final _otherFocus = FocusNode();
  final _otherFormKey = GlobalKey();
  final Set<String> _selectedIds = {};
  bool _otherSelected = false;

  @override
  void initState() {
    super.initState();
    final id = widget.state.selectedGoalId;
    if (id != null && id != 'other') _selectedIds.add(id);
    if (id == 'other') _otherSelected = true;
  }

  @override
  void dispose() {
    _otherController.dispose();
    _otherFocus.dispose();
    super.dispose();
  }

  Set<String> get _alreadySaved {
    final bloc = context.read<OnboardingBloc>();
    return bloc.savedGoals.map((g) => g.goalId).toSet();
  }

  void _toggleGoal(String id) {
    if (_alreadySaved.contains(id)) return;
    setState(() {
      _otherSelected = false;
      _otherFocus.unfocus();
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _selectOther() {
    setState(() {
      _otherSelected = true;
      _selectedIds.clear();
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final formContext = _otherFormKey.currentContext;
      if (formContext != null) {
        Scrollable.ensureVisible(
          formContext,
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeOutCubic,
          alignment: 0.2,
        );
      }
      if (_otherFocus.canRequestFocus) {
        _otherFocus.requestFocus();
      }
    });
  }

  bool get _canContinue =>
      (_selectedIds.isNotEmpty && !_otherSelected) ||
      (_otherSelected && _otherController.text.trim().isNotEmpty);

  void _continue(OnboardingBloc bloc) {
    if (_otherSelected && _otherController.text.trim().isNotEmpty) {
      bloc.queueGoals(['other'], otherLabel: _otherController.text.trim());
      bloc.add(const OnboardingEvent.goalSelected('other'));
    } else if (_selectedIds.isNotEmpty) {
      final ids = _selectedIds.toList();
      bloc.queueGoals(ids);
      bloc.add(OnboardingEvent.goalSelected(ids.first));
    }
    bloc.add(const OnboardingEvent.continueFromGoalSelect());
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    final saved = _alreadySaved;
    final count = _otherSelected
        ? (_otherController.text.trim().isEmpty ? 0 : 1)
        : _selectedIds.length;

    return OnboardingPage(
      bottom: Column(
        children: [
          NeevLoadingButton(
            title: count > 1 ? 'Continue with $count goals' : 'Continue',
            enabled: _canContinue,
            minLoadMs: 400,
            onPressed: () async {
              _continue(bloc);
            },
          ),
          if (bloc.savedGoals.isEmpty) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: () => bloc.add(const OnboardingEvent.skipGoalSelect()),
              child: Text(
                'Skip for now',
                style: TextStyles.bodyBold.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            bloc.savedGoals.isEmpty
                ? 'What are you saving for?'
                : 'Add another goal',
            style: TextStyles.heading1,
          ),
          const SizedBox(height: 8),
          Text(
            bloc.savedGoals.isEmpty
                ? 'Pick one or more goals to get started.'
                : 'Choose goals you haven’t added yet. You already have ${bloc.savedGoals.length} saved.',
            style: TextStyles.body,
          ),
          if (count > 0) ...[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.chipSelectedBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                count > 1 ? '$count goals selected' : '1 goal selected',
                style: TextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.15,
            ),
            itemCount: goals.length + 1,
            itemBuilder: (context, i) {
              if (i == goals.length) {
                return _OtherGoalTile(
                  selected: _otherSelected,
                  onTap: _selectOther,
                );
              }

              final goal = goals[i];
              final already = saved.contains(goal.id);
              final selected =
                  !already && !_otherSelected && _selectedIds.contains(goal.id);
              return _GoalGridTile(
                emoji: goalEmoji(goal.id),
                title: goal.label,
                subtitle: goal.sub,
                selected: selected,
                alreadyAdded: already,
                onTap: already ? null : () => _toggleGoal(goal.id),
              );
            },
          ),
          _otherSelected
              ? Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Describe your goal',
                        style: TextStyles.caption.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        textInputAction: TextInputAction.done,
                        controller: _otherController,
                        focusNode: _otherFocus,
                        onChanged: (_) => setState(() {}),
                        style: TextStyles.bodyBold,
                        maxLines: 5,
                        cursorColor: AppColors.primary,
                        decoration: InputDecoration(
                          hintText: 'e.g. Dream car, sabbatical…',
                          hintStyle: TextStyles.caption.copyWith(
                            color: AppColors.textMuted,
                          ),
                          filled: true,
                          fillColor: AppColors.surfaceMuted,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: AppColors.primary,
                              width: 1.6,
                            ),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
class _GoalGridTile extends StatelessWidget {
  const _GoalGridTile({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.selected,
    required this.alreadyAdded,
    required this.onTap,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final bool selected;
  final bool alreadyAdded;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final primary = AppColors.primary;

    final goalColor = switch (title) {
      'Home' => const Color(0xFF5B8DEF),
      'Travel' => const Color(0xFF9B6BFF),
      "Child's future" => const Color(0xFF38A88A),
      'Retirement' => const Color(0xFFF29B38),
      'Wealth creation' => const Color(0xFF45A85A),
      'Emergency fund' => const Color(0xFFE76F6F),
      _ => primary,
    };

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(22),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: selected
                ? primary.withValues(alpha: 0.90)
                : goalColor.withValues(alpha: 0.06),

            borderRadius: BorderRadius.circular(22),

            border: Border.all(
              color: selected
                  ? primary
                  : goalColor.withValues(alpha: 0.30),
              width: selected ? 1.6 : 1.1,
            ),

            boxShadow: [
              BoxShadow(
                color: selected
                    ? primary.withValues(alpha: 0.18)
                    : goalColor.withValues(alpha: 0.07),
                blurRadius: selected ? 14 : 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Goal icon
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.white.withValues(alpha: 0.15)
                          : goalColor.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: selected
                            ? AppColors.white.withValues(alpha: 0.12)
                            : goalColor.withValues(alpha: 0.18),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        emoji,
                        style: const TextStyle(
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  if (selected && !alreadyAdded)
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.18),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.white.withValues(alpha: 0.30),
                          width: 1,
                        ),
                      ),
                      child: AppIcon(
                        AppIcons.check(),
                        size: 17,
                        color: AppColors.white,
                      ),
                    )
                  else if (alreadyAdded)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: goalColor.withValues(alpha: 0.10),
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(
                          color: goalColor.withValues(alpha: 0.16),
                        ),
                      ),
                      child: Text(
                        'Added',
                        style: TextStyles.caption.copyWith(
                          color: goalColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 10,
                        ),
                      ),
                    ),
                ],
              ),

              const Spacer(),

              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.bodyBold.copyWith(
                  fontSize: 15,
                  height: 1.2,
                  color: selected
                      ? AppColors.white
                      : AppColors.textPrimary,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.caption.copyWith(
                  fontSize: 11,
                  height: 1.35,
                  color: selected
                      ? AppColors.white.withValues(alpha: 0.78)
                      : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OtherGoalTile extends StatelessWidget {
  const _OtherGoalTile({required this.selected, required this.onTap});

  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _GoalGridTile(
      emoji: '🎯',
      title: 'Others',
      subtitle: 'Mention your goals',
      selected: selected,
      alreadyAdded: false,
      onTap: onTap,
    );
  }
}

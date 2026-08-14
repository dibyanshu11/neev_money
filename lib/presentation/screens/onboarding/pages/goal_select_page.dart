import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/data/local/onboarding_data.dart';
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
      if (!mounted || _otherFocus.context == null) return;
      _otherFocus.requestFocus();
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
            title: count > 1
                ? 'Continue with $count goals'
                : 'Continue',
            enabled: _canContinue,
            minLoadMs: 400,
            onPressed: () async {
              _continue(bloc);
            },
          ),
          if (bloc.savedGoals.isEmpty) ...[
            const SizedBox(height: 8),
            TextButton(
              onPressed: () =>
                  bloc.add(const OnboardingEvent.skipGoalSelect()),
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
                ? 'Pick one or more. We’ll ask for an amount and timeline for each next.'
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
                count > 1
                    ? '$count goals selected — set targets one by one'
                    : '1 goal selected',
                style: TextStyles.caption.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.05,
            ),
            itemCount: goals.length,
            itemBuilder: (context, i) {
              final goal = goals[i];
              final already = saved.contains(goal.id);
              final selected =
                  !already && !_otherSelected && _selectedIds.contains(goal.id);
              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: already ? null : () => _toggleGoal(goal.id),
                  borderRadius: BorderRadius.circular(18),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 220),
                    curve: Curves.easeOutCubic,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: already
                          ? AppColors.surfaceMuted
                          : selected
                              ? AppColors.primary
                              : AppColors.surface,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        color: selected
                            ? AppColors.primary
                            : already
                                ? AppColors.chipSelectedBg
                                : AppColors.border,
                        width: selected ? 1.6 : 1.2,
                      ),
                      boxShadow:
                          selected || already ? null : AppColors.cardShadow,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              goalEmoji(goal.id),
                              style: const TextStyle(fontSize: 26),
                            ),
                            const Spacer(),
                            if (already)
                              Text(
                                'Added',
                                style: TextStyles.caption.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                ),
                              )
                            else if (selected)
                              AppIcon(
                                AppIcons.check(),
                                size: 20,
                                color: AppColors.white.withValues(alpha: 0.95),
                              ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          goal.label,
                          style: TextStyles.bodyBold.copyWith(
                            fontSize: 15,
                            color: selected
                                ? AppColors.white
                                : AppColors.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          goal.sub,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.caption.copyWith(
                            fontSize: 11,
                            height: 1.3,
                            color: selected
                                ? Colors.white.withValues(alpha: 0.78)
                                : AppColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: _selectOther,
              borderRadius: BorderRadius.circular(18),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _otherSelected ? AppColors.primary : AppColors.surface,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: _otherSelected
                        ? AppColors.primary
                        : AppColors.border,
                    width: 1.4,
                  ),
                  boxShadow: _otherSelected ? null : AppColors.cardShadow,
                ),
                child: Row(
                  children: [
                    const Text('✏️', style: TextStyle(fontSize: 26)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Something else',
                            style: TextStyles.bodyBold.copyWith(
                              fontSize: 15,
                              color: _otherSelected
                                  ? AppColors.white
                                  : AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            'Name a custom goal in your own words',
                            style: TextStyles.caption.copyWith(
                              fontSize: 11,
                              color: _otherSelected
                                  ? Colors.white.withValues(alpha: 0.75)
                                  : AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 220),
            curve: Curves.easeOutCubic,
            child: _otherSelected
                ? Padding(
                    padding: const EdgeInsets.only(top: 14),
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
                          controller: _otherController,
                          focusNode: _otherFocus,
                          onChanged: (_) => setState(() {}),
                          style: TextStyles.bodyBold,
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
          ),
        ],
      ),
    );
  }
}

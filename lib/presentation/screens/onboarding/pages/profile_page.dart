import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/app_dialogs.dart';
import 'package:new_app/router/route_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.state, required this.bloc});

  final OnboardingState state;
  final OnboardingBloc bloc;

  @override
  Widget build(BuildContext context) {
    final band = bloc.getBand();
    final goal = goalById(state.selectedGoalId);
    final rm = rmById(state.selectedRmId) ?? bloc.getRecommendedRm();

    return OnboardingPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Profile', style: TextStyles.heading2),
          const SizedBox(height: 18),
          AppCard(
            child: Row(
              children: [
                AvatarCircle(initials: nameInitials(state.name), size: 64),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.name.isNotEmpty ? state.name : 'Investor',
                        style: TextStyles.heading3,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        state.phone.isNotEmpty ? '+91 ${state.phone}' : '',
                        style: TextStyles.body,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _Tag(label: band.label, primary: true),
              if (goal != null) _Tag(label: goal.label, primary: false),
            ],
          ),
          const SizedBox(height: 20),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your relationship manager',
                  style: TextStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    AvatarCircle(initials: rm.initials, size: 48),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(rm.name, style: TextStyles.bodyBold),
                          Text(rm.creds, style: TextStyles.caption),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _ActionBtn(
                        icon: AppIcons.phone(),
                        label: 'Call',
                        filled: true,
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _ActionBtn(
                        icon: AppIcons.message(),
                        label: 'Message',
                        filled: false,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _MenuRow(icon: AppIcons.bank(), label: 'Bank accounts & KYC'),
                _MenuRow(
                  icon: AppIcons.notifications(),
                  label: 'Notifications',
                  onTap: () => NavigateTo.notifications(context),
                ),
                _MenuRow(icon: AppIcons.help(), label: 'Help & support'),
                _MenuRow(
                  icon: AppIcons.logout(),
                  label: 'Log out / Start over',
                  danger: true,
                  onTap: () async {
                    final confirmed = await showLogoutConfirmDialog(context);
                    if (!confirmed || !context.mounted) return;
                  },
                  showDivider: false,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label, required this.primary});

  final String label;
  final bool primary;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: primary ? AppColors.chipSelectedBg : AppColors.secondarySoft,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyles.caption.copyWith(
          color: primary ? AppColors.primary : AppColors.secondaryDark,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _ActionBtn extends StatelessWidget {
  const _ActionBtn({
    required this.icon,
    required this.label,
    required this.filled,
    required this.onTap,
  });

  final AppIconSpec icon;
  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: filled ? AppColors.primary : AppColors.surface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          height: 44,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: filled ? null : Border.all(color: AppColors.primary),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppIcon(
                icon,
                size: 16,
                color: filled ? AppColors.white : AppColors.primary,
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyles.bodyBold.copyWith(
                  color: filled ? AppColors.white : AppColors.primary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow({
    required this.icon,
    required this.label,
    this.onTap,
    this.danger = false,
    this.showDivider = true,
  });

  final AppIconSpec icon;
  final String label;
  final VoidCallback? onTap;
  final bool danger;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              children: [
                AppIcon(
                  icon,
                  size: 20,
                  color: danger ? AppColors.error : AppColors.primary,
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyles.bodyBold.copyWith(
                      color: danger ? AppColors.error : AppColors.textPrimary,
                    ),
                  ),
                ),
                AppIcon(
                  AppIcons.chevronRight(),
                  color: AppColors.textMuted.withValues(alpha: 0.8),
                ),
              ],
            ),
          ),
        ),
        if (showDivider)
          const Divider(height: 1, indent: 50, color: AppColors.divider),
      ],
    );
  }
}

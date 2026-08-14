
import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/onboarding_data.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';

class RmConfirmedPage extends StatelessWidget {
  const RmConfirmedPage({super.key, required this.state, required this.bloc});

  final OnboardingState state;
  final OnboardingBloc bloc;

  @override
  Widget build(BuildContext context) {
    final rm = rmById(state.selectedRmId) ?? rms.first;

    return OnboardingPage(
      bottom: NeevOutlineButton(
        title: 'See recommended funds',
        filled: true,
        onTap: () => bloc.add(const OnboardingEvent.continueFromRmConfirmed()),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          AvatarCircle(initials: rm.initials, size: 84),
          const SizedBox(height: 18),
          Text('Your relationship manager', style: TextStyles.caption),
          const SizedBox(height: 6),
          Text(rm.name, style: TextStyles.heading2),
          const SizedBox(height: 4),
          Text('${rm.creds} · ${rm.base}', style: TextStyles.body),
          const SizedBox(height: 24),
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.secondarySoft,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: AppIcon(
                        AppIcons.phoneInTalk(),
                        color: AppColors.secondaryDark,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text('Next step', style: TextStyles.bodyBold),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  '${rm.name} will call you within 24 hours to introduce themselves and walk through your plan.',
                  style: TextStyles.body,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


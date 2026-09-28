
import 'package:flutter/material.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/data/datasources/local/onboarding_data.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';

class RmSelectPage extends StatelessWidget {
  const RmSelectPage({super.key, required this.state, required this.bloc});

  final OnboardingState state;
  final OnboardingBloc bloc;

  @override
  Widget build(BuildContext context) {
    final recommended = bloc.getRecommendedRm();

    return OnboardingPage(
      bottom: NeevOutlineButton(
        title: 'Confirm relationship manager',
        filled: true,
        enabled: state.selectedRmId != null,
        onTap: () => bloc.add(const OnboardingEvent.continueFromRmSelect()),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageIntro(
            eyebrow: 'Human support',
            title: 'Choose your RM',
            subtitle:
                'All three are a strong fit — pick the person you’d like to work with.',
          ),
          const SizedBox(height: 18),
          for (final rm in rms)
            AppCard(
              margin: const EdgeInsets.only(bottom: 12),
              selected: state.selectedRmId == rm.id,
              onTap: () => bloc.add(OnboardingEvent.rmSelected(rm.id)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AvatarCircle(initials: rm.initials, size: 52),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Text(
                                rm.name,
                                style: TextStyles.bodyBold.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            if (rm.id == recommended.id) ...[
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.secondarySoft,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'Best match',
                                  style: TextStyles.caption.copyWith(
                                    color: AppColors.secondaryDark,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${rm.creds} · ${rm.base}',
                          style: TextStyles.caption,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          rm.focus,
                          style: TextStyles.body.copyWith(fontSize: 13),
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


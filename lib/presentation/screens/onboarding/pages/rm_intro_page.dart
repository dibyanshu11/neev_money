import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';

class RmIntroPage extends StatefulWidget {
  const RmIntroPage({super.key});

  @override
  State<RmIntroPage> createState() => _RmIntroPageState();
}

class _RmIntroPageState extends State<RmIntroPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(milliseconds: 1600), () {
      if (!mounted) return;
      context
          .read<OnboardingBloc>()
          .add(const OnboardingEvent.rmIntroAutoAdvance());
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 64,
              height: 64,
              child: AppProgress(size: 36, color: AppColors.secondary),
            ),
            const SizedBox(height: 28),
            Text(
              'Matching your relationship manager',
              style: TextStyles.heading3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'We’re pairing you with an advisor who fits your goals and risk profile.',
              style: TextStyles.body,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

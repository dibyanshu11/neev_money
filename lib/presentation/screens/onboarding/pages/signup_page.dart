import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/google_logo.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';
import 'package:new_app/core/utils/toast_utils.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key, required this.state});

  final OnboardingState state;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    final isSignIn = state.isReturningUser;

    return OnboardingPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          Text(
            isSignIn ? 'Welcome back' : 'Create your account',
            style: TextStyles.heading1.copyWith(fontSize: 28),
          ),
          const SizedBox(height: 10),
          Text(
            isSignIn
                ? 'Enter your mobile number — we’ll send a 6-digit code.'
                : 'Tell us your name and number. We’ll text a code to verify.',
            style: TextStyles.body.copyWith(
              color: AppColors.textSecondary,
              fontSize: 15,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 28),
          if (!isSignIn) ...[
            Text('YOUR NAME', style: TextStyles.label),
            const SizedBox(height: 8),
            NeevTextField(
              value: state.name,
              hint: 'How should we call you?',
              onChanged: (v) => bloc.add(OnboardingEvent.nameChanged(v)),
            ),
            const SizedBox(height: 20),
          ],
          Text('MOBILE NUMBER', style: TextStyles.label),
          const SizedBox(height: 8),
          Row(
            children: [
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.surfaceMuted,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '+91',
                  style: TextStyles.bodyBold.copyWith(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: NeevTextField(
                  value: state.phone,
                  hint: '98765 43210',
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  onChanged: (v) => bloc.add(OnboardingEvent.phoneChanged(v)),
                ),
              ),
            ],
          ),
          if (state.phone.isNotEmpty && state.phone.length < 10) ...[
            const SizedBox(height: 8),
            Text(
              'Enter all 10 digits',
              style: TextStyles.caption.copyWith(color: AppColors.error),
            ),
          ],
          const SizedBox(height: 28),
          NeevOutlineButton(
            title: 'Send code',
            filled: true,
            enabled: bloc.signupValid,
            isLoading: state.isBusy,
            onTap: () => bloc.add(const OnboardingEvent.submitSignup()),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              const Expanded(child: Divider(color: AppColors.divider)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  'or',
                  style: TextStyles.caption.copyWith(
                    color: AppColors.textMuted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Expanded(child: Divider(color: AppColors.divider)),
            ],
          ),
          const SizedBox(height: 24),
          const _GoogleContinueButton(),
          const SizedBox(height: 20),
          Text(
            'By continuing you agree to our Terms & Privacy Policy',
            style: TextStyles.caption.copyWith(
              color: AppColors.textMuted,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _GoogleContinueButton extends StatelessWidget {
  const _GoogleContinueButton();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(28),
      child: InkWell(
        onTap: () {
          ToastUtils.showToast(
            context,
            message: 'Google sign-in will be available soon.',
            type: ToastType.info,
          );
        },
        borderRadius: BorderRadius.circular(28),
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppColors.border),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const GoogleLogo(size: 22),
              const SizedBox(width: 10),
              Text(
                'Continue with Google',
                style: TextStyles.bodyBold.copyWith(
                  fontSize: 15,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

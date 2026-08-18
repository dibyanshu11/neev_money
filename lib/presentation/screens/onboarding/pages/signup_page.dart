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
          const SizedBox(height: 16),
          // const Align(
          //   alignment: Alignment.centerLeft,
          //   child: NeevLogoMark(size: 40),
          // ),
          // const SizedBox(height: 26),
          Text(
            isSignIn
                ? 'Welcome 👋\nEnter your number'
                : 'Welcome 👋\nCreate your account',
            style: TextStyles.heading1,
          ),
          const SizedBox(height: 24),
          if (!isSignIn) ...[
            Text(
              'Tell us your name and number. We’ll text a code to verify.',
              style: TextStyles.subtitle,
            ),
            const SizedBox(height: 26),
          ],
          if (!isSignIn) ...[
            Text('YOUR NAME', style: TextStyles.label),
            const SizedBox(height: 8),
            NeevTextField(
              value: state.name,
              hint: 'How should we call you?',
              bordered: false,
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
                child: Text('+91', style: TextStyles.inputBold),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: NeevTextField(
                  value: state.phone,
                  hint: '98765 43210',
                  bordered: false,
                  keyboardType: TextInputType.phone,
                  style: TextStyles.bodyBold.copyWith(
                    fontSize: 17,
                    letterSpacing: 0.5,
                  ),
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
          const SizedBox(height: 22),
          Row(
            children: [
              const Expanded(child: Divider(color: AppColors.divider)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Text(
                  'or',
                  style: TextStyles.caption.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 13,
                  ),
                ),
              ),
              const Expanded(child: Divider(color: AppColors.divider)),
            ],
          ),
          const SizedBox(height: 22),
          const _GoogleContinueButton(),
          const SizedBox(height: 22),
          Text.rich(
            TextSpan(
              text: 'By continuing you agree to our ',
              children: [
                TextSpan(text: 'Terms', style: _linkStyle),
                const TextSpan(text: ' & '),
                TextSpan(text: 'Privacy Policy', style: _linkStyle),
              ],
            ),
            style: TextStyles.caption.copyWith(
              color: AppColors.textSecondary,
              fontSize: 12,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

final _linkStyle = TextStyles.caption.copyWith(
  color: AppColors.primary,
  fontSize: 12,
  fontWeight: FontWeight.w700,
  height: 1.5,
);

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

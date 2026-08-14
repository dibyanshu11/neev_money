import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';
import 'package:new_app/core/utils/toast_utils.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.state});

  final OnboardingState state;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  static const _resendSeconds = 30;
  int _secondsLeft = _resendSeconds;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer?.cancel();
    setState(() => _secondsLeft = _resendSeconds);
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (!mounted) return;
      if (_secondsLeft <= 1) {
        t.cancel();
        setState(() => _secondsLeft = 0);
        return;
      }
      setState(() => _secondsLeft -= 1);
    });
  }

  String _formatPhone(String digits) {
    if (digits.length <= 5) return digits;
    return '${digits.substring(0, 5)} ${digits.substring(5)}';
  }

  String get _timerLabel {
    final m = (_secondsLeft ~/ 60).toString();
    final s = (_secondsLeft % 60).toString().padLeft(2, '0');
    return '$m:$s';
  }

  void _onOtpChanged(OnboardingBloc bloc, String value) {
    bloc.add(OnboardingEvent.otpChanged(value));
    if (value.length == 6 && !widget.state.isBusy) {
      bloc.add(const OnboardingEvent.verifyOtp());
    }
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    final state = widget.state;

    return OnboardingPage(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          Text('Verify OTP', style: TextStyles.heading1),
          const SizedBox(height: 8),
          Text(
            'Enter the 6-digit code sent to +91 ${_formatPhone(state.phone)}',
            style: TextStyles.body.copyWith(
              color: AppColors.textSecondary,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 6),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => bloc.add(const OnboardingEvent.goBack()),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Change number',
                style: TextStyles.bodyBold.copyWith(
                  color: AppColors.linkBlue,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 28),
          OtpInput(
            value: state.otp,
            onChanged: (v) => _onOtpChanged(bloc, v),
          ),
          const SizedBox(height: 16),
          Text.rich(
            TextSpan(
              text: "Didn't get it? ",
              style: TextStyles.caption.copyWith(fontSize: 13),
              children: [
                if (_secondsLeft > 0)
                  TextSpan(
                    text: 'Resend in $_timerLabel',
                    style: TextStyles.bodyBold.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                    ),
                  )
                else
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: GestureDetector(
                      onTap: () {
                        bloc.add(const OnboardingEvent.resendOtp());
                        _startTimer();
                        ToastUtils.showToast(
                          context,
                          message: 'Code resent',
                          type: ToastType.success,
                        );
                      },
                      child: Text(
                        'Resend code',
                        style: TextStyles.bodyBold.copyWith(
                          color: AppColors.primary,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          NeevOutlineButton(
            title: 'Verify & continue',
            filled: true,
            enabled: bloc.otpValid,
            isLoading: state.isBusy,
            onTap: () => bloc.add(const OnboardingEvent.verifyOtp()),
          ),
        ],
      ),
    );
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_event_state.freezed.dart';

enum OnboardingScreen {
  splash,
  signup,
  otp,
  goalSelect,
  goalDetail,
  goalsReview,
  quiz,
  riskResult,
  rmIntro,
  rmSelect,
  rmConfirmed,
  fundRecs,
  success,
  enterApp,
  dashboard,
  investMore,
  startSip,
  profile,
}

class SavedGoalDraft {
  const SavedGoalDraft({
    required this.goalId,
    required this.label,
    required this.amountLabel,
    required this.tenureLabel,
    required this.amountValue,
  });

  final String goalId;
  final String label;
  final String amountLabel;
  final String tenureLabel;
  final double amountValue;

  SavedGoalDraft copyWith({
    String? amountLabel,
    double? amountValue,
  }) =>
      SavedGoalDraft(
        goalId: goalId,
        label: label,
        amountLabel: amountLabel ?? this.amountLabel,
        tenureLabel: tenureLabel,
        amountValue: amountValue ?? this.amountValue,
      );
}

@freezed
sealed class OnboardingEvent with _$OnboardingEvent {
  const factory OnboardingEvent.startFlow() = StartFlow;
  const factory OnboardingEvent.startSignIn() = StartSignIn;

  const factory OnboardingEvent.nameChanged(String name) = NameChanged;
  const factory OnboardingEvent.phoneChanged(String phone) = PhoneChanged;
  const factory OnboardingEvent.otpChanged(String otp) = OtpChanged;
  const factory OnboardingEvent.submitSignup() = SubmitSignup;
  const factory OnboardingEvent.resendOtp() = ResendOtp;
  const factory OnboardingEvent.verifyOtp() = VerifyOtp;

  const factory OnboardingEvent.goalSelected(String goalId) = GoalSelected;
  const factory OnboardingEvent.continueFromGoalSelect() = ContinueFromGoalSelect;
  const factory OnboardingEvent.skipGoalSelect() = SkipGoalSelect;
  const factory OnboardingEvent.amountSelected(String amountId) = AmountSelected;
  const factory OnboardingEvent.customAmountChanged(String amount) =
      CustomAmountChanged;
  const factory OnboardingEvent.timeframeSelected(String timeframeId) =
      TimeframeSelected;
  const factory OnboardingEvent.continueFromGoalDetail() =
      ContinueFromGoalDetail;
  const factory OnboardingEvent.addAnotherGoal() = AddAnotherGoal;
  const factory OnboardingEvent.continueFromGoalsReview() =
      ContinueFromGoalsReview;

  const factory OnboardingEvent.quizAnswered({
    required int optionIndex,
    required int score,
  }) = QuizAnswered;
  const factory OnboardingEvent.quizAdvanceAfterAnswer() =
      QuizAdvanceAfterAnswer;

  const factory OnboardingEvent.goToRmIntro() = GoToRmIntro;
  const factory OnboardingEvent.rmIntroAutoAdvance() = RmIntroAutoAdvance;
  const factory OnboardingEvent.rmSelected(String rmId) = RmSelected;
  const factory OnboardingEvent.continueFromRmSelect() = ContinueFromRmSelect;
  const factory OnboardingEvent.continueFromRmConfirmed() =
      ContinueFromRmConfirmed;
  const factory OnboardingEvent.confirmInvest() = ConfirmInvest;

  const factory OnboardingEvent.goToDashboard() = GoToDashboard;
  const factory OnboardingEvent.switchTab(OnboardingScreen tab) = SwitchTab;

  const factory OnboardingEvent.investAmountSelected(String amountId) =
      InvestAmountSelected;
  const factory OnboardingEvent.investCustomAmountChanged(String amount) =
      InvestCustomAmountChanged;
  const factory OnboardingEvent.investFundSelected(String fundKey) =
      InvestFundSelected;
  const factory OnboardingEvent.confirmInvestMore() = ConfirmInvestMore;
  const factory OnboardingEvent.investAgain() = InvestAgain;

  const factory OnboardingEvent.sipAmountSelected(String amountId) =
      SipAmountSelected;
  const factory OnboardingEvent.sipCustomAmountChanged(String amount) =
      SipCustomAmountChanged;
  const factory OnboardingEvent.sipFundSelected(String fundKey) =
      SipFundSelected;
  const factory OnboardingEvent.sipDateSelected(String date) = SipDateSelected;
  const factory OnboardingEvent.confirmSip() = ConfirmSip;
  const factory OnboardingEvent.editSip() = EditSip;

  const factory OnboardingEvent.restart() = Restart;
  const factory OnboardingEvent.goBack() = GoBack;
}

@freezed
abstract class SipConfig with _$SipConfig {
  const factory SipConfig({
    required double amount,
    required String fundKey,
    required String date,
  }) = _SipConfig;
}

@freezed
abstract class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    @Default(OnboardingScreen.splash) OnboardingScreen screen,
    @Default(false) bool isReturningUser,
    @Default(false) bool isBusy,
    @Default('') String name,
    @Default('') String phone,
    @Default('') String otp,
    String? selectedGoalId,
    String? amountId,
    @Default('') String customAmount,
    String? timeframeId,
    @Default(0) int quizStep,
    @Default({}) Map<int, int> quizAnswers,
    int? quizSelectedOption,
    String? selectedRmId,
    @Default({'equity': 0.0, 'hybrid': 0.0, 'debt': 0.0})
    Map<String, double> extraInvestments,
    String? investAmountId,
    @Default('') String investCustomAmount,
    String? investFundKey,
    @Default(false) bool investConfirmed,
    double? lastInvestAmount,
    String? lastInvestFundKey,
    SipConfig? sip,
    String? sipAmountId,
    @Default('') String sipCustomAmount,
    String? sipFundKey,
    String? sipDate,
    @Default(false) bool sipJustConfirmed,
    @Default(OnboardingScreen.dashboard) OnboardingScreen activeTab,
  }) = _OnboardingState;

  factory OnboardingState.initial() => const OnboardingState();
}

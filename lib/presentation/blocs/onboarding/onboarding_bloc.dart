import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/data/local/onboarding_data.dart';
import 'package:new_app/data/local/user_prefs.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState.initial()) {
    on<StartFlow>(_onStartFlow);
    on<StartSignIn>(_onStartSignIn);
    on<NameChanged>(_onNameChanged);
    on<PhoneChanged>(_onPhoneChanged);
    on<OtpChanged>(_onOtpChanged);
    on<SubmitSignup>(_onSubmitSignup);
    on<ResendOtp>(_onResendOtp);
    on<VerifyOtp>(_onVerifyOtp);
    on<GoalSelected>(_onGoalSelected);
    on<ContinueFromGoalSelect>(_onContinueFromGoalSelect);
    on<SkipGoalSelect>(_onSkipGoalSelect);
    on<AmountSelected>(_onAmountSelected);
    on<CustomAmountChanged>(_onCustomAmountChanged);
    on<TimeframeSelected>(_onTimeframeSelected);
    on<ContinueFromGoalDetail>(_onContinueFromGoalDetail);
    on<AddAnotherGoal>(_onAddAnotherGoal);
    on<ContinueFromGoalsReview>(_onContinueFromGoalsReview);
    on<QuizAnswered>(_onQuizAnswered);
    on<QuizAdvanceAfterAnswer>(_onQuizAdvanceAfterAnswer);
    on<GoToRmIntro>(_onGoToRmIntro);
    on<RmIntroAutoAdvance>(_onRmIntroAutoAdvance);
    on<RmSelected>(_onRmSelected);
    on<ContinueFromRmSelect>(_onContinueFromRmSelect);
    on<ContinueFromRmConfirmed>(_onContinueFromRmConfirmed);
    on<ConfirmInvest>(_onConfirmInvest);
    on<GoToDashboard>(_onGoToDashboard);
    on<SwitchTab>(_onSwitchTab);
    on<InvestAmountSelected>(_onInvestAmountSelected);
    on<InvestCustomAmountChanged>(_onInvestCustomAmountChanged);
    on<InvestFundSelected>(_onInvestFundSelected);
    on<ConfirmInvestMore>(_onConfirmInvestMore);
    on<InvestAgain>(_onInvestAgain);
    on<SipAmountSelected>(_onSipAmountSelected);
    on<SipCustomAmountChanged>(_onSipCustomAmountChanged);
    on<SipFundSelected>(_onSipFundSelected);
    on<SipDateSelected>(_onSipDateSelected);
    on<ConfirmSip>(_onConfirmSip);
    on<EditSip>(_onEditSip);
    on<Restart>(_onRestart);
    on<GoBack>(_onGoBack);
  }

  static const _onboardingOrder = <OnboardingScreen>[
    OnboardingScreen.splash,
    OnboardingScreen.signup,
    OnboardingScreen.otp,
    OnboardingScreen.goalSelect,
    OnboardingScreen.goalDetail,
    OnboardingScreen.goalsReview,
    OnboardingScreen.quiz,
    OnboardingScreen.riskResult,
    OnboardingScreen.fundRecs,
    OnboardingScreen.rmIntro,
    OnboardingScreen.rmSelect,
    OnboardingScreen.rmConfirmed,
    OnboardingScreen.success,
  ];

  static const _stepMap = <OnboardingScreen, int>{
    OnboardingScreen.signup: 1,
    OnboardingScreen.otp: 2,
    OnboardingScreen.goalSelect: 3,
    OnboardingScreen.goalDetail: 4,
    OnboardingScreen.goalsReview: 5,
    OnboardingScreen.quiz: 6,
    OnboardingScreen.riskResult: 7,
    OnboardingScreen.fundRecs: 8,
    OnboardingScreen.rmSelect: 9,
    OnboardingScreen.rmConfirmed: 10,
  };

  /// Accumulated goals (Screen 5 — multiple goals with amount + tenure).
  final List<SavedGoalDraft> savedGoals = [];

  /// Goals chosen on the multi-select screen, configured one-by-one.
  final List<String> pendingGoalIds = [];

  /// Label for a custom “Any other” goal.
  String? customGoalLabel;

  static const _tabScreens = <OnboardingScreen>[
    OnboardingScreen.dashboard,
    OnboardingScreen.investMore,
    OnboardingScreen.startSip,
    OnboardingScreen.profile,
  ];

  Timer? _quizTimer;
  Timer? _rmIntroTimer;

  int getRiskScore() {
    var sum = 0;
    for (var i = 0; i < quiz.length; i++) {
      sum += state.quizAnswers[i] ?? 0;
    }
    return sum;
  }

  RiskBand getBand() {
    final score = getRiskScore();
    return bands.firstWhere(
      (b) => score >= b.min && score <= b.max,
      orElse: () => bands[2],
    );
  }

  double getTotalAmount() {
    if (state.amountId == 'custom') {
      return (double.tryParse(state.customAmount) ?? 0) * 100000;
    }
    final opt = amountOptions.firstWhere(
      (o) => o.id == state.amountId,
      orElse: () => const AmountOption(id: '', label: '', value: null),
    );
    return (opt.value ?? 0).toDouble();
  }

  RelationshipManager getRecommendedRm() {
    final band = getBand();
    return rms.firstWhere(
      (r) => r.matches.contains(band.key),
      orElse: () => rms.first,
    );
  }

  bool get signupValid => state.isReturningUser
      ? state.phone.length == 10
      : state.name.trim().length > 1 && state.phone.length == 10;

  bool get otpValid => state.otp.length == 6;

  bool get goalDetailValid {
    final amtOk = state.amountId != null &&
        (state.amountId != 'custom' ||
            (double.tryParse(state.customAmount) ?? 0) > 0);
    return state.selectedGoalId != null && amtOk && state.timeframeId != null;
  }

  bool get investValid {
    final amtOk = state.investAmountId != null &&
        (state.investAmountId != 'custom' ||
            (double.tryParse(state.investCustomAmount) ?? 0) > 0);
    return amtOk && state.investFundKey != null;
  }

  bool get sipValid {
    final amtOk = state.sipAmountId != null &&
        (state.sipAmountId != 'custom' ||
            (double.tryParse(state.sipCustomAmount) ?? 0) > 0);
    return amtOk && state.sipFundKey != null && state.sipDate != null;
  }

  double get progressPct {
    final screen = state.screen;
    final totalSteps = 9;
    var stepFloat = (_stepMap[screen] ?? 1).toDouble();
    if (screen == OnboardingScreen.quiz) {
      stepFloat = 4 + (state.quizStep + 1) / quiz.length;
    }
    return ((stepFloat - 1) / (totalSteps - 1) * 100).clamp(0, 100);
  }

  /// Legacy % header — unused; step header covers the full flow.
  bool get showHeader => false;

  bool get showStepHeader {
    switch (state.screen) {
      case OnboardingScreen.otp:
      case OnboardingScreen.goalSelect:
      case OnboardingScreen.goalDetail:
      case OnboardingScreen.goalsReview:
      case OnboardingScreen.quiz:
      case OnboardingScreen.riskResult:
      case OnboardingScreen.rmSelect:
      case OnboardingScreen.rmConfirmed:
      case OnboardingScreen.fundRecs:
        return true;
      default:
        return false;
    }
  }

  /// High-level onboarding phases shown in the top step bar.
  int get stepNumber {
    switch (state.screen) {
      case OnboardingScreen.signup:
      case OnboardingScreen.otp:
        return 1;
      case OnboardingScreen.goalSelect:
      case OnboardingScreen.goalDetail:
      case OnboardingScreen.goalsReview:
        return 2;
      case OnboardingScreen.quiz:
      case OnboardingScreen.riskResult:
        return 3;
      case OnboardingScreen.fundRecs:
      case OnboardingScreen.rmIntro:
      case OnboardingScreen.rmSelect:
      case OnboardingScreen.rmConfirmed:
        return 4;
      default:
        return 1;
    }
  }

  int get stepTotal => 4;

  String get stepTitle {
    switch (state.screen) {
      case OnboardingScreen.signup:
        return 'Account';
      case OnboardingScreen.otp:
        return 'Verify';
      case OnboardingScreen.goalSelect:
        return 'Goals';
      case OnboardingScreen.goalDetail:
        return 'Tenure & Amount';
      case OnboardingScreen.goalsReview:
        return 'Review';
      case OnboardingScreen.quiz:
        return 'Step ${state.quizStep + 1} of ${quiz.length}';
      case OnboardingScreen.riskResult:
        return 'Your profile';
      case OnboardingScreen.rmIntro:
      case OnboardingScreen.rmSelect:
      case OnboardingScreen.rmConfirmed:
        return 'Your advisor';
      case OnboardingScreen.fundRecs:
        return 'Your plan';
      default:
        return '';
    }
  }

  /// Used for forward/back page transitions.
  int get navigationIndex {
    final base = _stepMap[state.screen];
    if (base != null) {
      if (state.screen == OnboardingScreen.quiz) {
        return base * 10 + state.quizStep;
      }
      return base * 10;
    }
    return _tabScreens.indexOf(state.screen) + 200;
  }

  bool get showTabBar => _tabScreens.contains(state.screen);

  void _onStartFlow(StartFlow event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(
      screen: OnboardingScreen.signup,
      isReturningUser: false,
      isBusy: false,
    ));
  }

  Future<void> _onStartSignIn(
    StartSignIn event,
    Emitter<OnboardingState> emit,
  ) async {
    final prefs = UserPrefs.instance;
    final savedName = await prefs.getName();
    final savedPhone = await prefs.getPhone();
    emit(state.copyWith(
      screen: OnboardingScreen.signup,
      isReturningUser: true,
      isBusy: false,
      name: savedName.isNotEmpty
          ? savedName
          : (state.name.isEmpty ? '' : state.name),
      phone: savedPhone.isNotEmpty ? savedPhone : state.phone,
    ));
  }

  void _onNameChanged(NameChanged event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(name: event.name));
  }

  void _onPhoneChanged(PhoneChanged event, Emitter<OnboardingState> emit) {
    final digits = event.phone.replaceAll(RegExp(r'\D'), '');
    emit(state.copyWith(phone: digits.length > 10 ? digits.substring(0, 10) : digits));
  }

  void _onOtpChanged(OtpChanged event, Emitter<OnboardingState> emit) {
    final digits = event.otp.replaceAll(RegExp(r'\D'), '');
    emit(state.copyWith(otp: digits.length > 6 ? digits.substring(0, 6) : digits));
  }

  Future<void> _onSubmitSignup(
    SubmitSignup event,
    Emitter<OnboardingState> emit,
  ) async {
    if (!signupValid) return;
    emit(state.copyWith(isBusy: true));
    await Future<void>.delayed(const Duration(milliseconds: 700));
    final name = state.name.trim().isEmpty ? '' : state.name;
    emit(state.copyWith(
      screen: OnboardingScreen.otp,
      isBusy: false,
      otp: '',
      name: name,
    ));
  }

  void _onResendOtp(ResendOtp event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(otp: ''));
  }

  Future<void> _onVerifyOtp(
    VerifyOtp event,
    Emitter<OnboardingState> emit,
  ) async {
    if (!otpValid) return;
    emit(state.copyWith(isBusy: true));
    await Future<void>.delayed(const Duration(milliseconds: 700));
    final name =
        state.name.trim().isEmpty ? '' : state.name.trim();
    await UserPrefs.instance.saveAuthIdentity(name: name, phone: state.phone);
    if (state.isReturningUser) {
      emit(state.copyWith(
        isBusy: false,
        name: name,
        screen: OnboardingScreen.enterApp,
      ));
      return;
    }
    emit(state.copyWith(
      name: name,
      screen: OnboardingScreen.goalSelect,
      isBusy: false,
    ));
  }

  void _onGoalSelected(GoalSelected event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(selectedGoalId: event.goalId));
  }

  /// Queue goals from multi-select, then open amount/tenure for the first.
  void queueGoals(List<String> ids, {String? otherLabel}) {
    final unique = <String>[];
    for (final id in ids) {
      if (!unique.contains(id) &&
          !savedGoals.any((g) => g.goalId == id)) {
        unique.add(id);
      }
    }
    pendingGoalIds
      ..clear()
      ..addAll(unique);
    if (otherLabel != null && otherLabel.trim().isNotEmpty) {
      customGoalLabel = otherLabel.trim();
    }
  }

  int get pendingGoalsTotal =>
      savedGoals.length + pendingGoalIds.length;

  int get currentGoalOrdinal {
    final done = savedGoals.length;
    return done + 1;
  }

  void _onContinueFromGoalSelect(
    ContinueFromGoalSelect event,
    Emitter<OnboardingState> emit,
  ) {
    if (pendingGoalIds.isEmpty && state.selectedGoalId != null) {
      pendingGoalIds.add(state.selectedGoalId!);
    }
    if (pendingGoalIds.isEmpty) return;

    // Tenure, amount, and the next screen (goal detail / review) are hidden
    // for now. Save selected goals without targets and continue to the quiz.
    for (final id in List<String>.from(pendingGoalIds)) {
      GoalOption? goal;
      for (final g in goals) {
        if (g.id == id) goal = g;
      }
      if (id == 'other') {
        goal = GoalOption(
          id: 'other',
          label: (customGoalLabel?.isNotEmpty ?? false)
              ? customGoalLabel!
              : 'Custom goal',
          sub: 'Your own target',
          letter: 'O',
        );
      }
      if (goal != null) {
        savedGoals.removeWhere((g) => g.goalId == goal!.id);
        savedGoals.add(
          SavedGoalDraft(
            goalId: goal.id,
            label: goal.label,
            amountLabel: 'TBD',
            tenureLabel: 'TBD',
            amountValue: 0,
          ),
        );
      }
    }
    pendingGoalIds.clear();
    emit(state.copyWith(
      screen: OnboardingScreen.quiz,
      quizStep: 0,
      quizAnswers: {},
      quizSelectedOption: null,
    ));

    // Original: open tenure & amount (goal detail).
    // emit(state.copyWith(
    //   selectedGoalId: pendingGoalIds.first,
    //   amountId: null,
    //   customAmount: '',
    //   timeframeId: null,
    //   screen: OnboardingScreen.goalDetail,
    // ));
  }

  void _onSkipGoalSelect(
    SkipGoalSelect event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(
      screen: OnboardingScreen.quiz,
      selectedGoalId: null,
      quizStep: 0,
      quizAnswers: {},
      quizSelectedOption: null,
    ));
  }

  void _onAmountSelected(AmountSelected event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(amountId: event.amountId));
  }

  void _onCustomAmountChanged(
    CustomAmountChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(customAmount: event.amount));
  }

  void _onTimeframeSelected(
    TimeframeSelected event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(timeframeId: event.timeframeId));
  }

  void _onContinueFromGoalDetail(
    ContinueFromGoalDetail event,
    Emitter<OnboardingState> emit,
  ) {
    if (!goalDetailValid) return;
    GoalOption? goal;
    for (final g in goals) {
      if (g.id == state.selectedGoalId) goal = g;
    }
    if (state.selectedGoalId == 'other') {
      goal = GoalOption(
        id: 'other',
        label: (customGoalLabel?.isNotEmpty ?? false)
            ? customGoalLabel!
            : 'Custom goal',
        sub: 'Your own target',
        letter: 'O',
      );
    }
    final tenure = timeframeOptions
        .where((t) => t.id == state.timeframeId)
        .map((t) => t.label)
        .firstOrNull;
    final amountLabel = state.amountId == 'custom'
        ? '₹${state.customAmount}L'
        : amountOptions
            .where((o) => o.id == state.amountId)
            .map((o) => o.label)
            .firstOrNull;
    if (goal != null && amountLabel != null && tenure != null) {
      savedGoals.removeWhere((g) => g.goalId == goal!.id);
      savedGoals.add(
        SavedGoalDraft(
          goalId: goal.id,
          label: goal.label,
          amountLabel: amountLabel,
          tenureLabel: tenure,
          amountValue: getTotalAmount(),
        ),
      );
    }

    pendingGoalIds.removeWhere((id) => id == state.selectedGoalId);

    if (pendingGoalIds.isNotEmpty) {
      emit(state.copyWith(
        selectedGoalId: pendingGoalIds.first,
        amountId: null,
        customAmount: '',
        timeframeId: null,
        screen: OnboardingScreen.goalDetail,
      ));
      return;
    }

    emit(state.copyWith(screen: OnboardingScreen.goalsReview));
  }

  void removeSavedGoal(String goalId) {
    savedGoals.removeWhere((g) => g.goalId == goalId);
  }

  void updateSavedGoalAmount(String goalId, double amount) {
    final i = savedGoals.indexWhere((g) => g.goalId == goalId);
    if (i < 0) return;
    savedGoals[i] = savedGoals[i].copyWith(
      amountValue: amount,
      amountLabel: Formatters.currency(amount),
    );
  }

  void _onAddAnotherGoal(
    AddAnotherGoal event,
    Emitter<OnboardingState> emit,
  ) {
    pendingGoalIds.clear();
    emit(state.copyWith(
      screen: OnboardingScreen.goalSelect,
      selectedGoalId: null,
      amountId: null,
      customAmount: '',
      timeframeId: null,
    ));
  }

  void _onContinueFromGoalsReview(
    ContinueFromGoalsReview event,
    Emitter<OnboardingState> emit,
  ) {
    if (savedGoals.isEmpty) return;
    emit(state.copyWith(
      screen: OnboardingScreen.quiz,
      quizStep: 0,
      quizAnswers: {},
      quizSelectedOption: null,
    ));
  }

  void _onQuizAnswered(QuizAnswered event, Emitter<OnboardingState> emit) {
    final step = state.quizStep;
    final answers = Map<int, int>.from(state.quizAnswers)
      ..[step] = event.score;
    // Stay on the question so the user can see the green selection +
    // “You’re shaping up as” card, then tap Continue.
    _quizTimer?.cancel();
    emit(state.copyWith(
      quizAnswers: answers,
      quizSelectedOption: event.optionIndex,
    ));
  }

  void _onQuizAdvanceAfterAnswer(
    QuizAdvanceAfterAnswer event,
    Emitter<OnboardingState> emit,
  ) {
    final step = state.quizStep;
    if (step == quiz.length - 1) {
      emit(state.copyWith(
        screen: OnboardingScreen.riskResult,
        quizSelectedOption: null,
      ));
    } else {
      emit(state.copyWith(
        quizStep: step + 1,
        quizSelectedOption: null,
      ));
    }
  }

  void _onGoToRmIntro(GoToRmIntro event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(screen: OnboardingScreen.fundRecs));
  }

  void _onRmIntroAutoAdvance(
    RmIntroAutoAdvance event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.screen == OnboardingScreen.rmIntro) {
      emit(state.copyWith(screen: OnboardingScreen.rmSelect));
    }
  }

  void _onRmSelected(RmSelected event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(selectedRmId: event.rmId));
  }

  void _onContinueFromRmSelect(
    ContinueFromRmSelect event,
    Emitter<OnboardingState> emit,
  ) {
    if (state.selectedRmId == null) return;
    emit(state.copyWith(screen: OnboardingScreen.rmConfirmed));
  }

  void _onContinueFromRmConfirmed(
    ContinueFromRmConfirmed event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(screen: OnboardingScreen.success));
  }

  void _onConfirmInvest(ConfirmInvest event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(screen: OnboardingScreen.rmIntro));
  }

  void _onGoToDashboard(GoToDashboard event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(screen: OnboardingScreen.dashboard));
  }

  void _onSwitchTab(SwitchTab event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(
      screen: event.tab,
      investConfirmed: false,
      sipJustConfirmed: false,
    ));
  }

  void _onInvestAmountSelected(
    InvestAmountSelected event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(investAmountId: event.amountId));
  }

  void _onInvestCustomAmountChanged(
    InvestCustomAmountChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(investCustomAmount: event.amount));
  }

  void _onInvestFundSelected(
    InvestFundSelected event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(investFundKey: event.fundKey));
  }

  void _onConfirmInvestMore(
    ConfirmInvestMore event,
    Emitter<OnboardingState> emit,
  ) {
    if (!investValid) return;
    final amount = _resolveAmount(
      amountId: state.investAmountId!,
      customAmount: state.investCustomAmount,
      options: extraAmountOptions,
    );
    if (amount == null || state.investFundKey == null) return;

    final extra = Map<String, double>.from(state.extraInvestments);
    final key = state.investFundKey!;
    extra[key] = (extra[key] ?? 0) + amount;

    emit(state.copyWith(
      extraInvestments: extra,
      investConfirmed: true,
      lastInvestAmount: amount,
      lastInvestFundKey: key,
    ));
  }

  void _onInvestAgain(InvestAgain event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(
      investConfirmed: false,
      investAmountId: null,
      investCustomAmount: '',
      investFundKey: null,
    ));
  }

  void _onSipAmountSelected(
    SipAmountSelected event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(sipAmountId: event.amountId));
  }

  void _onSipCustomAmountChanged(
    SipCustomAmountChanged event,
    Emitter<OnboardingState> emit,
  ) {
    emit(state.copyWith(sipCustomAmount: event.amount));
  }

  void _onSipFundSelected(SipFundSelected event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(sipFundKey: event.fundKey));
  }

  void _onSipDateSelected(SipDateSelected event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(sipDate: event.date));
  }

  void _onConfirmSip(ConfirmSip event, Emitter<OnboardingState> emit) {
    if (!sipValid) return;
    final amount = _resolveAmount(
      amountId: state.sipAmountId!,
      customAmount: state.sipCustomAmount,
      options: sipAmountOptions,
    );
    if (amount == null || state.sipFundKey == null || state.sipDate == null) {
      return;
    }

    emit(state.copyWith(
      sip: SipConfig(
        amount: amount,
        fundKey: state.sipFundKey!,
        date: state.sipDate!,
      ),
      sipJustConfirmed: true,
    ));
  }

  void _onEditSip(EditSip event, Emitter<OnboardingState> emit) {
    emit(state.copyWith(
      sipJustConfirmed: false,
      sipAmountId: null,
      sipCustomAmount: '',
      sipFundKey: null,
      sipDate: null,
    ));
  }

  void _onRestart(Restart event, Emitter<OnboardingState> emit) {
    savedGoals.clear();
    pendingGoalIds.clear();
    customGoalLabel = null;
    emit(state.copyWith(
      screen: OnboardingScreen.splash,
      name: '',
      phone: '',
      otp: '',
      selectedGoalId: null,
      amountId: null,
      customAmount: '',
      timeframeId: null,
      quizStep: 0,
      quizAnswers: {},
      quizSelectedOption: null,
      selectedRmId: null,
      extraInvestments: const {'equity': 0.0, 'hybrid': 0.0, 'debt': 0.0},
      investAmountId: null,
      investCustomAmount: '',
      investFundKey: null,
      investConfirmed: false,
      sip: null,
      sipAmountId: null,
      sipCustomAmount: '',
      sipFundKey: null,
      sipDate: null,
      sipJustConfirmed: false,
    ));
  }

  void _onGoBack(GoBack event, Emitter<OnboardingState> emit) {
    final screen = state.screen;

    if (screen == OnboardingScreen.goalDetail) {
      pendingGoalIds.clear();
      if (savedGoals.isNotEmpty) {
        emit(state.copyWith(
          screen: OnboardingScreen.goalsReview,
          amountId: null,
          customAmount: '',
          timeframeId: null,
        ));
      } else {
        emit(state.copyWith(
          screen: OnboardingScreen.goalSelect,
          selectedGoalId: null,
          amountId: null,
          customAmount: '',
          timeframeId: null,
        ));
      }
      return;
    }

    if (screen == OnboardingScreen.goalsReview) {
      emit(state.copyWith(
        screen: OnboardingScreen.goalSelect,
        selectedGoalId: null,
        amountId: null,
        customAmount: '',
        timeframeId: null,
      ));
      return;
    }

    if (screen == OnboardingScreen.quiz) {
      if (state.quizStep > 0) {
        final answers = Map<int, int>.from(state.quizAnswers)
          ..remove(state.quizStep - 1);
        emit(state.copyWith(
          quizStep: state.quizStep - 1,
          quizAnswers: answers,
          quizSelectedOption: null,
        ));
      } else if (savedGoals.isNotEmpty) {
        // Goals review (tenure & amount) is hidden for now.
        // emit(state.copyWith(screen: OnboardingScreen.goalsReview));
        emit(state.copyWith(screen: OnboardingScreen.goalSelect));
      } else {
        emit(state.copyWith(screen: OnboardingScreen.goalSelect));
      }
      return;
    }

    if (screen == OnboardingScreen.riskResult) {
      emit(state.copyWith(
        screen: OnboardingScreen.quiz,
        quizStep: quiz.length - 1,
        quizSelectedOption: null,
      ));
      return;
    }

    if (screen == OnboardingScreen.fundRecs) {
      emit(state.copyWith(screen: OnboardingScreen.riskResult));
      return;
    }

    if (screen == OnboardingScreen.rmSelect) {
      emit(state.copyWith(screen: OnboardingScreen.fundRecs));
      return;
    }

    final idx = _onboardingOrder.indexOf(screen);
    if (idx > 0) {
      emit(state.copyWith(screen: _onboardingOrder[idx - 1]));
    }
  }

  double? _resolveAmount({
    required String amountId,
    required String customAmount,
    required List<AmountOption> options,
  }) {
    if (amountId == 'custom') {
      return double.tryParse(customAmount);
    }
    final opt = options.firstWhere(
      (o) => o.id == amountId,
      orElse: () => const AmountOption(id: '', label: '', value: null),
    );
    return opt.value?.toDouble();
  }

  @override
  Future<void> close() {
    _quizTimer?.cancel();
    _rmIntroTimer?.cancel();
    return super.close();
  }
}

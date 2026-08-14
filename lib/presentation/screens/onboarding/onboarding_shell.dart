import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/pages/pages.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';
import 'package:new_app/router/route_manager.dart';

class OnboardingShell extends StatefulWidget {
  const OnboardingShell({super.key});

  @override
  State<OnboardingShell> createState() => _OnboardingShellState();
}

class _OnboardingShellState extends State<OnboardingShell> {
  int _lastNavIndex = 0;
  bool _goingForward = true;

  void _syncDirection(OnboardingBloc bloc) {
    final next = bloc.navigationIndex;
    if (next != _lastNavIndex) {
      _goingForward = next >= _lastNavIndex;
      _lastNavIndex = next;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        final bloc = context.read<OnboardingBloc>();
        _syncDirection(bloc);

        final isSplash = state.screen == OnboardingScreen.splash;
        final bottomSafe = MediaQuery.paddingOf(context).bottom;
        final floatingPad = bloc.showTabBar ? 88.0 + bottomSafe : 0.0;
        final hideBack = state.screen == OnboardingScreen.signup;

        return Scaffold(
          backgroundColor: isSplash ? AppColors.primary : AppColors.background,
          body: isSplash
              ? const SplashPage()
              : Stack(
                  children: [
                    SafeArea(
                      bottom: false,
                      child: Column(
                        children: [
                          if (bloc.showStepHeader)
                            OnboardingStepHeader(
                              title: bloc.stepTitle,
                              showBack: !hideBack,
                              onBack: () =>
                                  bloc.add(const OnboardingEvent.goBack()),
                            ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: floatingPad),
                              child: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 260),
                                reverseDuration:
                                    const Duration(milliseconds: 220),
                                switchInCurve: Curves.easeOutCubic,
                                switchOutCurve: Curves.easeInCubic,
                                transitionBuilder: (child, animation) {
                                  final beginX =
                                      _goingForward ? 0.05 : -0.05;
                                  return FadeTransition(
                                    opacity: animation,
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: Offset(beginX, 0),
                                        end: Offset.zero,
                                      ).animate(animation),
                                      child: child,
                                    ),
                                  );
                                },
                                child: KeyedSubtree(
                                  key: ValueKey(
                                    '${state.screen}_${state.quizStep}_'
                                    '${state.selectedGoalId}_'
                                    '${state.investConfirmed}_'
                                    '${state.sipJustConfirmed}',
                                  ),
                                  child: _buildScreen(state, bloc),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (bloc.showTabBar)
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: _BottomNav(state: state),
                      ),
                  ],
                ),
        );
      },
    );
  }

  Widget _buildScreen(OnboardingState state, OnboardingBloc bloc) {
    switch (state.screen) {
      case OnboardingScreen.splash:
        return const SplashPage();
      case OnboardingScreen.signup:
        return SignupPage(state: state);
      case OnboardingScreen.otp:
        return OtpPage(state: state);
      case OnboardingScreen.goalSelect:
        return GoalSelectPage(state: state);
      case OnboardingScreen.goalDetail:
        return GoalDetailPage(state: state);
      case OnboardingScreen.goalsReview:
        return GoalsReviewPage(state: state, bloc: bloc);
      case OnboardingScreen.quiz:
        return QuizPage(state: state);
      case OnboardingScreen.riskResult:
        return RiskResultPage(bloc: bloc);
      case OnboardingScreen.rmIntro:
        return const RmIntroPage();
      case OnboardingScreen.rmSelect:
        return RmSelectPage(state: state, bloc: bloc);
      case OnboardingScreen.rmConfirmed:
        return RmConfirmedPage(state: state, bloc: bloc);
      case OnboardingScreen.fundRecs:
        return FundRecsPage(bloc: bloc);
      case OnboardingScreen.success:
        return SuccessPage(state: state, bloc: bloc);
      case OnboardingScreen.enterApp:
        return const _EnterAppGate();
      case OnboardingScreen.dashboard:
        return DashboardPage(state: state, bloc: bloc);
      case OnboardingScreen.investMore:
        return InvestMorePage(state: state, bloc: bloc);
      case OnboardingScreen.startSip:
        return StartSipPage(state: state, bloc: bloc);
      case OnboardingScreen.profile:
        return ProfilePage(state: state, bloc: bloc);
    }
  }
}

/// Returning users (login) skip onboarding and land on Home dashboard.
class _EnterAppGate extends StatefulWidget {
  const _EnterAppGate();

  @override
  State<_EnterAppGate> createState() => _EnterAppGateState();
}

class _EnterAppGateState extends State<_EnterAppGate> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      NavigateTo.mainShell(context); // Home tab
    });
  }

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.background,
      child: Center(child: AppProgress(color: AppColors.primary)),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.state});

  final OnboardingState state;

  static List<({
    String label,
    AppIconSpec icon,
    OnboardingScreen screen,
  })> get _tabs => [
        (
          label: 'Portfolio',
          icon: AppIcons.portfolio(),
          screen: OnboardingScreen.dashboard,
        ),
        (
          label: 'Invest',
          icon: AppIcons.invest(),
          screen: OnboardingScreen.investMore,
        ),
        (
          label: 'SIP',
          icon: AppIcons.sip(),
          screen: OnboardingScreen.startSip,
        ),
        (
          label: 'Profile',
          icon: AppIcons.account(),
          screen: OnboardingScreen.profile,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    final bottom = MediaQuery.paddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(18, 0, 18, 12 + bottom.clamp(0, 20)),
      child: Container(
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.10),
              blurRadius: 24,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          children: [
            for (final tab in _tabs)
              Expanded(
                child: _NavItem(
                  label: tab.label,
                  icon: tab.icon,
                  active: state.screen == tab.screen,
                  onTap: () =>
                      bloc.add(OnboardingEvent.switchTab(tab.screen)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.icon,
    required this.active,
    required this.onTap,
  });

  final String label;
  final AppIconSpec icon;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: active ? AppColors.chipSelectedBg : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppIcon(
              icon,
              size: AppIconSizes.nav,
              color: active ? AppColors.primary : AppColors.textMuted,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyles.caption.copyWith(
                color: active ? AppColors.primary : AppColors.textMuted,
                fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

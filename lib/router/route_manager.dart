import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/domain/models/sip_model.dart';
import 'package:new_app/data/local/goals_data.dart';
import 'package:new_app/presentation/blocs/explore/explore_bloc.dart';
import 'package:new_app/presentation/blocs/explore/explore_event_state.dart';
import 'package:new_app/presentation/blocs/fund_detail/fund_detail_bloc.dart';
import 'package:new_app/presentation/blocs/fund_detail/fund_detail_event_state.dart';
import 'package:new_app/presentation/blocs/home/home_bloc.dart';
import 'package:new_app/presentation/blocs/home/home_event_state.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/portfolio/portfolio_bloc.dart';
import 'package:new_app/presentation/blocs/portfolio/portfolio_event_state.dart';
import 'package:new_app/presentation/blocs/sip/sip_bloc.dart';
import 'package:new_app/presentation/blocs/sip/sip_event_state.dart';
import 'package:new_app/presentation/screens/account/notifications_screen.dart';
import 'package:new_app/presentation/screens/fund/fund_detail_screen.dart';
import 'package:new_app/presentation/screens/goals/goal_tenure_amount_sheet.dart';
import 'package:new_app/presentation/screens/goals/goals_screen.dart';
import 'package:new_app/presentation/screens/main/main_shell.dart';
import 'package:new_app/presentation/screens/main/main_tab_controller.dart';
import 'package:new_app/presentation/screens/onboarding/onboarding_shell.dart';
import 'package:new_app/presentation/screens/sip/confirm_pay_screen.dart';
import 'package:new_app/presentation/screens/sip/kyc_details_screen.dart';
import 'package:new_app/presentation/screens/sip/start_sip_screen.dart';
import 'package:new_app/presentation/screens/sip/success_screen.dart';
import 'package:new_app/router/route_name.dart';

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class RouteManager {
  RouteManager._();
  static final RouteManager _instance = RouteManager._();
  factory RouteManager() => _instance;

  Route<dynamic> generate(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return slideRoute(
          BlocProvider(
            create: (_) => OnboardingBloc(),
            child: OnboardingShell(
              skipSplashIntro: settings.arguments == true,
            ),
          ),
        );
      case RouteName.mainShell:
        return slideRoute(
          MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => HomeBloc()..add(const HomeEvent.load()),
              ),
              BlocProvider(
                create: (_) => ExploreBloc()..add(const ExploreEvent.load()),
              ),
              BlocProvider(
                create: (_) =>
                    PortfolioBloc()..add(const PortfolioEvent.load()),
              ),
            ],
            child: const MainShell(),
          ),
        );
      case RouteName.goals:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => GoalsScreen(),
        );
      case RouteName.notifications:
        return slideRoute(const NotificationsScreen());
      case RouteName.fundDetail:
        final fundId = settings.arguments as String? ?? '1';
        return slideRoute(
          BlocProvider(
            create: (_) =>
                FundDetailBloc()..add(FundDetailEvent.load(fundId)),
            child: FundDetailScreen(fundId: fundId),
          ),
        );
      case RouteName.kycDetails:
        final kycFundId = settings.arguments as String? ?? '1';
        return slideRoute(KycDetailsScreen(fundId: kycFundId));
      case RouteName.startSip:
        final sipFundId = settings.arguments as String? ?? '1';
        return slideRoute(
          BlocProvider(
            create: (_) => SipBloc()..add(SipEvent.init(sipFundId)),
            child: StartSipScreen(fundId: sipFundId),
          ),
        );
      case RouteName.confirmPay:
        return slideRoute(const ConfirmPayScreen());
      case RouteName.success:
        return slideRoute(
          SuccessScreen(
            confirmation: settings.arguments as SipConfirmation?,
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Route not found')),
          ),
        );
    }
  }

  static Route<void> goalsRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: RouteName.goals),
      builder: (_) => GoalsScreen(),
    );
  }

  static Route<T> slideRoute<T extends Object?>(Widget child) {
    return PageRouteBuilder<T>(
      pageBuilder: (_, __, ___) => child,
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 260),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final primary = animation.drive(CurveTween(curve: Curves.easeOutCubic));
        final secondary =
            secondaryAnimation.drive(CurveTween(curve: Curves.easeOutCubic));

        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(-0.12, 0),
          ).animate(secondary),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(primary),
            child: child,
          ),
        );
      },
    );
  }
}

class NavigateTo {
  /// Clears the stack and returns to splash (logged-out).
  static void splash(BuildContext context, {bool showGetStarted = false}) {
    MainTabController.instance.goHome();
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteName.splash,
      (_) => false,
      arguments: showGetStarted,
    );
  }

  static void phoneEntry(BuildContext context) => splash(context);

  static void otpVerify(BuildContext context, String phone) => splash(context);

  static void goalSelection(BuildContext context) => splash(context);

  /// Opens the main app shell. Defaults to Home (dashboard).
  /// Used after account setup and after login.
  static void mainShell(BuildContext context, {int tab = 0}) {
    MainTabController.instance.index.value = tab;
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteName.mainShell,
      (_) => false,
    );
  }

  static void goals(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: RouteName.goals),
        builder: (_) => GoalsScreen(),
      ),
    );
  }

  /// Opens tenure & amount bottom sheet — only from Edit button.
  static Future<GoalItem?> editGoal(BuildContext context, GoalItem goal) {
    return showGoalTenureAmountSheet(context, goal);
  }

  /// From SIP success → Goals (keeps main shell under so back works).
  static void linkSipToGoal(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      RouteManager.goalsRoute(),
      (route) => route.settings.name == RouteName.mainShell,
    );
  }

  static void notifications(BuildContext context) =>
      Navigator.pushNamed(context, RouteName.notifications);

  static void fundDetail(BuildContext context, String fundId) =>
      Navigator.pushNamed(context, RouteName.fundDetail, arguments: fundId);

  static void kycDetails(BuildContext context, String fundId) =>
      Navigator.pushNamed(context, RouteName.kycDetails, arguments: fundId);

  static void startSip(BuildContext context, String fundId) =>
      Navigator.pushNamed(context, RouteName.startSip, arguments: fundId);

  static void confirmPay(BuildContext context) =>
      Navigator.pushNamed(context, RouteName.confirmPay);

  static void success(BuildContext context, SipConfirmation? confirmation) =>
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteName.success,
        (route) => route.settings.name == RouteName.mainShell,
        arguments: confirmation,
      );

  static void back(BuildContext context) => Navigator.pop(context);
}

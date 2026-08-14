import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/domain/models/sip_model.dart';
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
import 'package:new_app/presentation/screens/goals/goals_screen.dart';
import 'package:new_app/presentation/screens/main/main_shell.dart';
import 'package:new_app/presentation/screens/main/main_tab_controller.dart';
import 'package:new_app/presentation/screens/onboarding/onboarding_shell.dart';
import 'package:new_app/presentation/screens/sip/confirm_pay_screen.dart';
import 'package:new_app/presentation/screens/sip/kyc_details_screen.dart';
import 'package:new_app/presentation/screens/sip/start_sip_screen.dart';
import 'package:new_app/presentation/screens/sip/success_screen.dart';
import 'package:new_app/router/route_name.dart';

typedef RouteBuilder = Route<dynamic> Function(RouteSettings settings);

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class RouteManager {
  RouteManager._();
  static final RouteManager _instance = RouteManager._();
  factory RouteManager() => _instance;

  Route<dynamic> generate(RouteSettings settings) {
    final builder = _routes[settings.name];
    if (builder == null) {
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Route not found')),
        ),
      );
    }
    return builder(settings);
  }

  late final Map<String, RouteBuilder> _routes = {
    RouteName.splash: (_) => _route(
          BlocProvider(
            create: (_) => OnboardingBloc(),
            child: const OnboardingShell(),
          ),
        ),
    RouteName.mainShell: (_) => _route(
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
        ),
    RouteName.goals: (_) => _route(const GoalsScreen()),
    RouteName.notifications: (_) => _route(const NotificationsScreen()),
    RouteName.fundDetail: (settings) {
      final fundId = settings.arguments as String? ?? '1';
      return _route(
        BlocProvider(
          create: (_) =>
              FundDetailBloc()..add(FundDetailEvent.load(fundId)),
          child: FundDetailScreen(fundId: fundId),
        ),
      );
    },
    RouteName.kycDetails: (settings) {
      final fundId = settings.arguments as String? ?? '1';
      return _route(KycDetailsScreen(fundId: fundId));
    },
    RouteName.startSip: (settings) {
      final fundId = settings.arguments as String? ?? '1';
      return _route(
        BlocProvider(
          create: (_) => SipBloc()..add(SipEvent.init(fundId)),
          child: StartSipScreen(fundId: fundId),
        ),
      );
    },
    RouteName.confirmPay: (_) => _route(const ConfirmPayScreen()),
    RouteName.success: (settings) => _route(
          SuccessScreen(
            confirmation: settings.arguments as SipConfirmation?,
          ),
        ),
  };

  Route<dynamic> _route(Widget child) {
    return PageRouteBuilder(
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
  static void splash(BuildContext context) {
    MainTabController.instance.goHome();
    Navigator.pushNamedAndRemoveUntil(context, RouteName.splash, (_) => false);
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

  static void goals(BuildContext context) =>
      Navigator.pushNamed(context, RouteName.goals);

  /// From SIP success → Goals (keeps main shell under so back works).
  static void linkSipToGoal(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RouteName.goals,
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

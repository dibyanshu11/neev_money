import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/data/local/user_prefs.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/widgets/app_dialogs.dart';
import 'package:new_app/router/route_manager.dart';

/// Splash palette sampled from the brand board: the canvas fades from the deep
/// brand green at the top to a darker green behind the CTAs.
const _splashGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xFF0C4941), Color(0xFF0A3732)],
);
const _splashLogoTile = Color(0xFF22554E);

/// 1) Brand splash (2s) → 2) Get started (logged-out only).
///
/// Logo is drawn with Flutter widgets (not SVG) so it appears on the first frame.
class SplashPage extends StatefulWidget {
  const SplashPage({super.key, this.skipIntro = false});

  /// When true, skip the 2s brand splash and open Get started (logout).
  final bool skipIntro;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  static const _introDuration = Duration(seconds: 2);

  bool _showWelcome = false;
  Timer? _introTimer;

  @override
  void initState() {
    super.initState();
    if (widget.skipIntro) {
      _showWelcome = true;
      return;
    }
    // Show brand splash immediately — don't wait on prefs / SVG decode.
    _introTimer = Timer(_introDuration, () {
      if (mounted) setState(() => _showWelcome = true);
    });
    _redirectIfLoggedIn();
  }

  Future<void> _redirectIfLoggedIn() async {
    final phone = await UserPrefs.instance.getPhone();
    if (!mounted || phone.isEmpty) return;
    _introTimer?.cancel();
    NavigateTo.mainShell(context);
  }

  @override
  void dispose() {
    _introTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(gradient: _splashGradient),
      child: SizedBox.expand(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          transitionBuilder: (child, animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _showWelcome
              ? const _GetStartedView(key: ValueKey('get_started'))
              : const _IntroSplash(key: ValueKey('intro')),
        ),
      ),
    );
  }
}

class _IntroSplash extends StatelessWidget {
  const _IntroSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 36),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _NeevMark(size: 108),
            const SizedBox(height: 36),
            _Tagline(style: TextStyles.taglineSm),
          ],
        ),
      ),
    );
  }
}

class _GetStartedView extends StatelessWidget {
  const _GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          children: [
            const Spacer(flex: 2),
            const _NeevMark(size: 84),
            const SizedBox(height: 28),
            _Tagline(style: TextStyles.tagline),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Build real wealth, one steady step at a time.',
                textAlign: TextAlign.center,
                style: TextStyles.subtitle.copyWith(
                  color: Colors.white.withValues(alpha: 0.78),
                  fontSize: 15,
                  height: 1.5,
                ),
              ),
            ),
            const Spacer(flex: 3),
            LoadingNeevButton(
              title: 'Get started',
              accent: true,
              
              onPressed: () async {
                context.read<OnboardingBloc>().add(
                  const OnboardingEvent.startFlow(),
                );
              },
            ),
            const SizedBox(height: 12),
            LoadingNeevButton(
              title: 'I already have an account',
              filled: false,
              onDark: true,
              onPressed: () async {
                context.read<OnboardingBloc>().add(
                  const OnboardingEvent.startSignIn(),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              'From the house of JK Capital · ARN-XXXXXX',
              style: TextStyles.caption.copyWith(
                color: Colors.white.withValues(alpha: 0.42),
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}

class _Tagline extends StatelessWidget {
  const _Tagline({required this.style});

  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    const taglineText = 'Sapne Aapke, Neev Hamari.';
    final base = style.copyWith(
      color: Colors.white.withValues(alpha: 0.96),
      height: 1.32,
      fontSize: style.fontSize ?? 32,
      fontWeight: FontWeight.w700,
    );
    final accent = base.copyWith(color: AppColors.secondary);

    return Semantics(
      label: taglineText,
      child: Text.rich(
        TextSpan(
          style: base,
          children: [
            TextSpan(text: 'Sapne ', style: accent),
            const TextSpan(text: 'Aapke\n'),
            const TextSpan(text: 'Neev '),
            TextSpan(text: 'Hamari', style: accent),
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Instant brand mark — same look as logo-neev.svg, no asset I/O.
class _NeevMark extends StatelessWidget {
  const _NeevMark({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    final radius = size * 0.28;
    final barH = size * 0.115;
    final gap = size * 0.055;

    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: _splashLogoTile,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _bar(width: size * 0.30, height: barH, color: AppColors.secondary),
            SizedBox(height: gap),
            _bar(
              width: size * 0.40,
              height: barH,
              color: Colors.white.withValues(alpha: 0.5),
            ),
            SizedBox(height: gap),
            _bar(width: size * 0.60, height: barH, color: AppColors.white),
          ],
        ),
      ),
    );
  }

  Widget _bar({
    required double width,
    required double height,
    required Color color,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(height / 2),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/user_prefs.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';
import 'package:new_app/router/route_manager.dart';

/// Neev button that shows an in-button loader while [onPressed] runs.
class LoadingNeevButton extends StatefulWidget {
  const LoadingNeevButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.filled = true,
    this.enabled = true,
    this.accent = false,
    this.onDark = false,
    this.minLoadMs = 650,
  });

  final String title;
  final Future<void> Function() onPressed;
  final bool filled;
  final bool enabled;
  final bool accent;
  final bool onDark;
  final int minLoadMs;

  @override
  State<LoadingNeevButton> createState() => _LoadingNeevButtonState();
}

class _LoadingNeevButtonState extends State<LoadingNeevButton> {
  bool _loading = false;
  bool _active = true;
  int _runId = 0;

  @override
  void deactivate() {
    _active = false;
    super.deactivate();
  }

  @override
  void activate() {
    super.activate();
    _active = true;
  }

  Future<void> _run() async {
    if (_loading || !widget.enabled) return;
    final runId = ++_runId;
    setState(() => _loading = true);
    final started = DateTime.now();
    try {
      await widget.onPressed();
    } finally {
      final wait =
          widget.minLoadMs - DateTime.now().difference(started).inMilliseconds;
      if (wait > 0) await Future<void>.delayed(Duration(milliseconds: wait));
      if (_active && mounted && runId == _runId) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return NeevOutlineButton(
      title: widget.title,
      filled: widget.filled,
      enabled: widget.enabled,
      accent: widget.accent,
      onDark: widget.onDark,
      isLoading: _loading,
      onTap: _run,
    );
  }
}

/// Platform confirm dialog — Cupertino on iOS, Material on Android.
Future<bool> showAppConfirmDialog(
  BuildContext context, {
  required String title,
  required String message,
  String confirmLabel = 'OK',
  String cancelLabel = 'Cancel',
  bool isDestructive = false,
}) async {
  if (isCupertinoPlatform) {
    final result = await showCupertinoDialog<bool>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(cancelLabel),
          ),
          CupertinoDialogAction(
            isDestructiveAction: isDestructive,
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      title: Text(title, style: TextStyles.heading3),
      content: Text(message, style: TextStyles.body),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: Text(
            cancelLabel,
            style: TextStyles.bodyBold.copyWith(color: AppColors.textSecondary),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(
            confirmLabel,
            style: TextStyles.bodyBold.copyWith(
              color: isDestructive ? AppColors.error : AppColors.primary,
            ),
          ),
        ),
      ],
    ),
  );
  return result ?? false;
}

/// Platform alert (single action) — Cupertino on iOS, Material on Android.
Future<void> showAppAlertDialog(
  BuildContext context, {
  required String title,
  required String message,
  String actionLabel = 'OK',
}) async {
  if (isCupertinoPlatform) {
    await showCupertinoDialog<void>(
      context: context,
      builder: (ctx) => CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(ctx),
            child: Text(actionLabel),
          ),
        ],
      ),
    );
    return;
  }

  await showDialog<void>(
    context: context,
    builder: (ctx) => AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      title: Text(title, style: TextStyles.heading3),
      content: Text(message, style: TextStyles.body),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx),
          child: Text(
            actionLabel,
            style: TextStyles.bodyBold.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    ),
  );
}

Future<bool> showLogoutConfirmDialog(BuildContext context) async {
  final confirmed = await showAppConfirmDialog(
    context,
    title: 'Log out?',
    message: 'You’ll need to sign in again to see your portfolio and SIPs.',
    confirmLabel: 'Log out',
    cancelLabel: 'Cancel',
    isDestructive: true,
  );

  if (confirmed && context.mounted) {
    await UserPrefs.instance.clearProfile();

    if (!context.mounted) return false;

    // Use the named login route — RouteManager wraps OnboardingShell
    // with BlocProvider<OnboardingBloc> pre-seeded to the login
    // (signup in returning-user mode). Pushing OnboardingShell directly
    // via MaterialPageRoute crashes with ProviderNotFoundException.
    NavigateTo.login(context);
  }

  return confirmed;
}

Future<bool> showDeleteAccountConfirmDialog(BuildContext context) {
  return showAppConfirmDialog(
    context,
    title: 'Delete account?',
    message:
        'This removes your profile from this device. You’ll need to sign up again to use Neev.',
    confirmLabel: 'Delete',
    cancelLabel: 'Cancel',
    isDestructive: true,
  );
}

Future<bool> showBiometricConfirmDialog(
  BuildContext context, {
  required bool enabling,
}) {
  final label = isCupertinoPlatform
      ? 'Face ID / Touch ID'
      : 'Fingerprint / Face unlock';
  return showAppConfirmDialog(
    context,
    title: enabling ? 'Turn on $label?' : 'Turn off $label?',
    message: enabling
        ? 'Next time you open Neev Money, we’ll ask for $label to keep your money safer.'
        : 'You can still sign in with your phone number.',
    confirmLabel: enabling ? 'Enable' : 'Disable',
    cancelLabel: 'Cancel',
  );
}

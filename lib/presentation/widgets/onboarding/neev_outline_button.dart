import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/widgets/app_back_button.dart';

class NeevOutlineButton extends StatelessWidget {
  const NeevOutlineButton({
    super.key,
    required this.title,
    this.onTap,
    this.enabled = true,
    this.filled = false,
    this.isLoading = false,
    this.accent = false,
    this.onDark = false,
  });

  final String title;
  final VoidCallback? onTap;
  final bool enabled;
  final bool filled;
  final bool isLoading;
  /// Orange CTA (Get started / See my portfolio).
  final bool accent;
  /// Secondary button sitting on a dark green background.
  final bool onDark;

  bool get _canTap => enabled && !isLoading && onTap != null;

  @override
  Widget build(BuildContext context) {
    final isAccent = accent && enabled;
    final isFilled = (filled || isAccent) && enabled && !onDark;
    final isDarkSecondary = onDark && !accent;
    /// A solid CTA that is currently disabled — greyed green, not washed out.
    final isDisabledFill = !enabled && (filled || accent);

    final Color fg;
    if (isDisabledFill) {
      fg = AppColors.white;
    } else if (!enabled) {
      fg = AppColors.textMuted;
    } else if (isAccent) {
      fg = AppColors.textPrimary;
    } else if (isFilled) {
      fg = AppColors.white;
    } else if (isDarkSecondary) {
      fg = AppColors.white;
    } else {
      fg = AppColors.primary;
    }

    const height = 56.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.sizeOf(context).width;
        final targetW = isLoading ? height : maxW;
        // Stadium shape at every size — loading only collapses the width.
        const radius = height / 2;

        return AnimatedOpacity(
          duration: const Duration(milliseconds: 160),
          opacity: enabled || isLoading || isDisabledFill ? 1 : 0.5,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 320),
            curve: Curves.easeInOutCubic,
            width: targetW.isFinite ? targetW : null,
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              boxShadow: (isFilled || isAccent) && !isLoading
                  ? AppColors.softShadow
                  : null,
              color: isDisabledFill
                  ? AppColors.buttonDisabled
                  : isAccent
                      ? AppColors.secondary
                      : isDarkSecondary
                          ? AppColors.splashButton
                          : isFilled
                              ? AppColors.primary
                              : AppColors.surface,
              border: Border.all(
                color: enabled || isLoading
                    ? (isFilled || isAccent || isDarkSecondary
                        ? Colors.transparent
                        : AppColors.primary)
                    : (isDisabledFill ? Colors.transparent : AppColors.border),
                width: 1.5,
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: _canTap
                    ? () {
                        HapticFeedback.lightImpact();
                        onTap!();
                      }
                    : null,
                borderRadius: BorderRadius.circular(radius),
                child: Center(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    switchInCurve: Curves.easeOut,
                    switchOutCurve: Curves.easeIn,
                    transitionBuilder: (child, anim) {
                      return FadeTransition(
                        opacity: anim,
                        child: ScaleTransition(
                          scale: Tween<double>(begin: 0.85, end: 1)
                              .animate(anim),
                          child: child,
                        ),
                      );
                    },
                    child: isLoading
                        ? AppProgress.button(key: const ValueKey('loader'), color: fg)
                        : Text(
                            key: const ValueKey('label'),
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.button.copyWith(color: fg),
                          ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Primary CTA that runs an async action and morphs into a loader circle.
class NeevLoadingButton extends StatefulWidget {
  const NeevLoadingButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.enabled = true,
    this.filled = true,
    this.accent = false,
    this.minLoadMs = 700,
  });

  final String title;
  final Future<void> Function() onPressed;
  final bool enabled;
  final bool filled;
  final bool accent;
  final int minLoadMs;

  @override
  State<NeevLoadingButton> createState() => _NeevLoadingButtonState();
}

class _NeevLoadingButtonState extends State<NeevLoadingButton> {
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

  Future<void> _handle() async {
    if (_loading || !widget.enabled) return;
    final runId = ++_runId;
    setState(() => _loading = true);
    final started = DateTime.now();
    try {
      await widget.onPressed();
    } finally {
      final elapsed = DateTime.now().difference(started).inMilliseconds;
      final wait = widget.minLoadMs - elapsed;
      if (wait > 0) {
        await Future<void>.delayed(Duration(milliseconds: wait));
      }
      // Avoid setState / Theme.of on a deactivated AnimatedSwitcher child.
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
      accent: widget.accent,
      enabled: widget.enabled,
      isLoading: _loading,
      onTap: _handle,
    );
  }
}

class NeevChip extends StatelessWidget {
  const NeevChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
          ),
          boxShadow: selected ? null : AppColors.cardShadow,
        ),
        child: Text(
          label,
          style: TextStyles.chip.copyWith(
            color: selected ? AppColors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }
}

/// Simple top bar: back + page title (no step timeline).
class OnboardingStepHeader extends StatelessWidget {
  const OnboardingStepHeader({
    super.key,
    required this.title,
    required this.onBack,
    this.showBack = true,
  });

  final String title;
  final VoidCallback onBack;
  final bool showBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 16, 12),
      child: Row(
        children: [
          if (showBack)
            _HeaderBackButton(onTap: onBack)
          else
            const SizedBox(width: 40),
          const SizedBox(width: 12),
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              child: Text(
                title,
                key: ValueKey(title),
                style: appBarTitleStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderBackButton extends StatelessWidget {
  const _HeaderBackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppBackButton(onPressed: onTap);
  }
}

/// Kept for legacy call sites — maps progress to a simple title header.
class OnboardingProgressHeader extends StatelessWidget {
  const OnboardingProgressHeader({
    super.key,
    required this.label,
    required this.progress,
    required this.onBack,
  });

  final String label;
  final double progress;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return OnboardingStepHeader(
      title: label,
      onBack: onBack,
    );
  }
}

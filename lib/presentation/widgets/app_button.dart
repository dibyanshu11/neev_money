import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';

/// Primary CTA with in-button platform loader that morphs into a circle.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.title,
    this.onTap,
    this.width,
    this.isLoading = false,
    this.enabled = true,
    this.bgColor = AppColors.primary,
    this.textColor = AppColors.white,
    this.borderRadius = 14,
    this.height = 56,
    this.padding,
    this.prefixWidget,
    this.outlined = false,
  });

  final String title;
  final VoidCallback? onTap;
  final double? width;
  final bool isLoading;
  final bool enabled;
  final Color bgColor;
  final Color textColor;
  final double borderRadius;
  final double height;
  final EdgeInsetsGeometry? padding;
  final Widget? prefixWidget;
  final bool outlined;

  bool get _canTap => enabled && !isLoading && onTap != null;

  @override
  Widget build(BuildContext context) {
    final fg = outlined ? bgColor : textColor;

    return LayoutBuilder(
      builder: (context, constraints) {
        final maxW = width ??
            (constraints.maxWidth.isFinite
                ? constraints.maxWidth
                : MediaQuery.sizeOf(context).width);
        final targetW = isLoading ? height : maxW;
        final radius = isLoading ? height / 2 : borderRadius;

        // Avoid Align/Center wrappers — they expand to max height and overflow
        // Columns inside scroll-controlled modal bottom sheets.
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 160),
          opacity: enabled || isLoading ? 1 : 0.5,
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 320),
              curve: Curves.easeInOutCubic,
              width: targetW.isFinite ? targetW : null,
              height: padding == null ? height : null,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: outlined
                    ? Colors.transparent
                    : (bgColor == AppColors.primary ? null : bgColor),
                gradient: !outlined && bgColor == AppColors.primary
                    ? const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [AppColors.primarySoft, AppColors.primary],
                      )
                    : null,
                borderRadius: BorderRadius.circular(radius),
                border: outlined
                    ? Border.all(color: bgColor, width: 1.5)
                    : null,
                boxShadow:
                    !outlined && _canTap && !isLoading ? AppColors.softShadow : null,
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
                  child: Padding(
                    padding: padding ?? EdgeInsets.zero,
                    child: Center(
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
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
                            ? AppProgress.button(
                                key: const ValueKey('loader'),
                                color: fg,
                              )
                            : Row(
                                key: const ValueKey('label'),
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (prefixWidget != null) ...[
                                    prefixWidget!,
                                    const SizedBox(width: 8),
                                  ],
                                  Flexible(
                                    child: Text(
                                      title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyles.button.copyWith(color: fg),
                                    ),
                                  ),
                                ],
                              ),
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

/// Tap helper: shows loading inside [AppButton] until [action] completes.
class LoadingActionButton extends StatefulWidget {
  const LoadingActionButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.bgColor = AppColors.primary,
    this.textColor = AppColors.white,
    this.outlined = false,
    this.enabled = true,
    this.minLoadMs = 600,
  });

  final String title;
  final Future<void> Function() onPressed;
  final Color bgColor;
  final Color textColor;
  final bool outlined;
  final bool enabled;
  final int minLoadMs;

  @override
  State<LoadingActionButton> createState() => _LoadingActionButtonState();
}

class _LoadingActionButtonState extends State<LoadingActionButton> {
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
    if (_loading) return;
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
      if (_active && mounted && runId == _runId) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: widget.title,
      bgColor: widget.bgColor,
      textColor: widget.textColor,
      outlined: widget.outlined,
      enabled: widget.enabled,
      isLoading: _loading,
      onTap: _handle,
    );
  }
}

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    super.key,
    required this.title,
    this.onTap,
    this.borderColor = AppColors.white,
    this.textColor = AppColors.white,
    this.isLoading = false,
  });

  final String title;
  final VoidCallback? onTap;
  final Color borderColor;
  final Color textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      title: title,
      onTap: onTap,
      outlined: true,
      bgColor: borderColor,
      textColor: textColor,
      isLoading: isLoading,
    );
  }
}

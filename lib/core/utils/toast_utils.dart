import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/core/constants/toast_type.dart';
import 'package:new_app/core/constants/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/presentation/widgets/app_svg_icon.dart';
import 'package:new_app/app/router/app_router.dart';

export 'package:new_app/core/constants/toast_type.dart';

/// Overlay toast matching DAHN (`ToastUtils` / `AnimatedToast`).
class ToastUtils {
  static OverlayEntry? _currentToast;

  static void showToast(
    BuildContext context, {
    String? message,
    ToastType type = ToastType.error,
  }) {
    // Prefer the app navigator overlay so toasts work after sheets/routes pop.
    OverlayState? overlay = appNavigatorKey.currentState?.overlay;
    if (overlay == null && context.mounted) {
      overlay = Overlay.maybeOf(context);
    }
    if (overlay == null) {
      debugPrint('ToastUtils: no Overlay available for toast');
      return;
    }

    _currentToast?.remove();
    _currentToast = null;

    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) {
        return AnimatedToast(
          message: message ?? 'Something went wrong. Please try again.',
          type: type,
          onDismiss: () {
            entry.remove();
            if (_currentToast == entry) _currentToast = null;
          },
        );
      },
    );

    _currentToast = entry;
    overlay.insert(entry);
  }
}

class AnimatedToast extends StatefulWidget {
  const AnimatedToast({
    super.key,
    required this.message,
    required this.type,
    required this.onDismiss,
  });

  final String message;
  final ToastType type;
  final VoidCallback onDismiss;

  @override
  State<AnimatedToast> createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<AnimatedToast>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnim;
  late final Animation<Offset> _slideAnim;
  Timer? _dismissTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _scaleAnim = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    _dismissTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        _controller.reverse().then((_) {
          if (mounted) widget.onDismiss();
        });
      }
    });
  }

  @override
  void dispose() {
    _dismissTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.viewPaddingOf(context).bottom + 20,
      left: 30,
      right: 30,
      child: SlideTransition(
        position: _slideAnim,
        child: ScaleTransition(
          scale: _scaleAnim,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: widget.type.bgColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: widget.type.borderColor),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.25),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 4,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  AppSvgIcon(
                    widget.type.iconAsset,
                    size: AppIconSizes.md,
                    color: widget.type.borderColor,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      widget.message,
                      style: TextStyles.bodyBold.copyWith(
                        color: Colors.black87,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (mounted) {
                        _controller.reverse().then((_) => widget.onDismiss());
                      }
                    },
                    child: AppIcon(
                      AppIcons.close(),
                      size: AppIconSizes.sm,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

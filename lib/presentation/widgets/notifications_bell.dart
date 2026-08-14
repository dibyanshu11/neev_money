import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/notification_mock.dart';
import 'package:new_app/router/route_manager.dart';

/// Bell control for app bars / screen headers (not used on Home dashboard).
class NotificationsBell extends StatelessWidget {
  const NotificationsBell({
    super.key,
    this.onDark = false,
    this.size = 40,
  });

  /// White icon on dark/green headers.
  final bool onDark;
  final double size;

  @override
  Widget build(BuildContext context) {
    final hasUnread = NotificationMock.items.any((n) => n.unread);
    final iconColor = onDark ? AppColors.white : AppColors.textPrimary;
    final bg = onDark
        ? Colors.white.withValues(alpha: 0.12)
        : AppColors.surface;

    return Material(
      color: bg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: onDark
            ? BorderSide.none
            : const BorderSide(color: AppColors.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => NavigateTo.notifications(context),
        child: SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AppIcon(
                AppIcons.notifications(),
                color: iconColor,
                size: AppIconSizes.sm,
              ),
              if (hasUnread)
                Positioned(
                  top: 9,
                  right: 9,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Convenience for Material [AppBar.actions].
List<Widget> notificationsAppBarActions(BuildContext context) {
  return [
    Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Center(child: NotificationsBell(size: 38)),
    ),
  ];
}

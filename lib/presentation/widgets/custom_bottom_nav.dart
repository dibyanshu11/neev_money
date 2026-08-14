import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/platform_icons.dart';

/// Floating pill-shaped bottom navigation matching the Neev Money designs.
/// Tabs: Home · Explore · Portfolio · Account.
class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const double height = 64;
  static const double horizontalMargin = 18;
  static const double bottomMargin = 12;

  /// Total vertical space the floating nav occupies from the screen bottom.
  static double occupiedHeight(BuildContext context) {
    final safe = MediaQuery.viewPaddingOf(context).bottom;
    return height + bottomMargin + safe;
  }

  /// Bottom padding for scroll views inside the tab area (small gap above nav).
  static double scrollBottomInset(BuildContext context) => 24;

  @override
  Widget build(BuildContext context) {
    final items = <({AppIconSpec icon, String label})>[
      (icon: AppIcons.home(), label: 'Home'),
      (icon: AppIcons.explore(), label: 'Explore'),
      (icon: AppIcons.portfolio(), label: 'Portfolio'),
      (icon: AppIcons.account(), label: 'Account'),
    ];

    final bottomSafe = MediaQuery.viewPaddingOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        horizontalMargin,
        0,
        horizontalMargin,
        bottomMargin + bottomSafe,
      ),
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: AppColors.border,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.10),
                blurRadius: 18,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              for (var i = 0; i < items.length; i++)
                Expanded(
                  child: _NavTab(
                    label: items[i].label,
                    icon: items[i].icon,
                    active: currentIndex == i,
                    onTap: () {
                      HapticFeedback.selectionClick();
                      onTap(i);
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavTab extends StatelessWidget {
  const _NavTab({
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
    final activeColor = AppColors.navSelected;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      splashColor: activeColor.withValues(alpha: 0.10),
      highlightColor: activeColor.withValues(alpha: 0.05),
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOutCubic,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: active ? AppColors.chipSelectedBg : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppIcon(
                icon,
                size: AppIconSizes.nav,
                color: active ? activeColor : AppColors.textMuted,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.caption.copyWith(
                  fontSize: 10,
                  height: 1.1,
                  fontWeight: active ? FontWeight.w700 : FontWeight.w500,
                  color: active ? activeColor : AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

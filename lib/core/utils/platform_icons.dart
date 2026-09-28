import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/app_icon_sizes.dart';
import 'package:new_app/core/constants/app_svg_assets.dart';
import 'package:new_app/presentation/widgets/app_svg_icon.dart';

/// Icon reference — prefers bundled SVG, falls back to platform glyph when needed.
class AppIconSpec {
  const AppIconSpec({this.svg, this.fallback})
      : assert(svg != null || fallback != null);

  final String? svg;
  final IconData? fallback;

  bool get hasSvg => svg != null && svg!.isNotEmpty;
}

/// App icon catalog — SVG-first across the product.
class AppIcons {
  AppIcons._();

  static bool get isIOS =>
      !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS;

  // ── Navigation / tabs ──────────────────────────────────────────────────
  static AppIconSpec home({bool filled = false}) =>
      const AppIconSpec(svg: AppSvgAssets.home);

  static AppIconSpec portfolio({bool filled = false}) =>
      const AppIconSpec(svg: AppSvgAssets.chartBars);

  static AppIconSpec invest({bool filled = false}) =>
      const AppIconSpec(svg: AppSvgAssets.plus);

  static AppIconSpec sip({bool filled = false}) =>
      const AppIconSpec(svg: AppSvgAssets.refresh);

  static AppIconSpec account({bool filled = false}) =>
      const AppIconSpec(svg: AppSvgAssets.user);

  static AppIconSpec explore({bool filled = false}) =>
      const AppIconSpec(svg: AppSvgAssets.navExplore);

  static AppIconSpec back() => const AppIconSpec(svg: AppSvgAssets.chevronLeft);

  static AppIconSpec chevronRight() =>
      const AppIconSpec(svg: AppSvgAssets.chevronRight);

  static AppIconSpec chevronDown() =>
      const AppIconSpec(svg: AppSvgAssets.chevronDown);

  static AppIconSpec chevronUp() =>
      const AppIconSpec(svg: AppSvgAssets.chevronUp);

  // ── Actions ────────────────────────────────────────────────────────────
  static AppIconSpec add() => const AppIconSpec(svg: AppSvgAssets.plus);

  static AppIconSpec check() => const AppIconSpec(svg: AppSvgAssets.check);

  static AppIconSpec checkPlain() => const AppIconSpec(svg: AppSvgAssets.check);

  static IconData radioOff() =>
      isIOS ? CupertinoIcons.circle : Icons.circle_outlined;

  static IconData radioOn() => isIOS
      ? CupertinoIcons.check_mark_circled_solid
      : Icons.check_circle_rounded;

  static AppIconSpec notifications() =>
      const AppIconSpec(svg: AppSvgAssets.bell);

  static AppIconSpec phone() => AppIconSpec(
        fallback: isIOS ? CupertinoIcons.phone_fill : Icons.phone_rounded,
      );

  static AppIconSpec phoneInTalk() => AppIconSpec(
        fallback:
            isIOS ? CupertinoIcons.phone_circle_fill : Icons.phone_in_talk_rounded,
      );

  static AppIconSpec message() => AppIconSpec(
        fallback: isIOS
            ? CupertinoIcons.chat_bubble_fill
            : Icons.chat_bubble_rounded,
      );

  static AppIconSpec help() => const AppIconSpec(svg: AppSvgAssets.info);

  static AppIconSpec logout() => const AppIconSpec(svg: AppSvgAssets.logout);

  static AppIconSpec bank() => const AppIconSpec(svg: AppSvgAssets.bank);

  static AppIconSpec balance() => const AppIconSpec(svg: AppSvgAssets.sliders);

  static AppIconSpec verified() =>
      const AppIconSpec(svg: AppSvgAssets.shieldCheck);

  static AppIconSpec share() =>
      const AppIconSpec(svg: AppSvgAssets.arrowUpRight);

  static AppIconSpec search() => const AppIconSpec(svg: AppSvgAssets.search);

  static AppIconSpec info() => const AppIconSpec(svg: AppSvgAssets.info);

  static AppIconSpec lock() => const AppIconSpec(svg: AppSvgAssets.lock);

  static AppIconSpec lockFill() => const AppIconSpec(svg: AppSvgAssets.lock);

  static AppIconSpec biometric() =>
      const AppIconSpec(svg: AppSvgAssets.userCheck);

  static AppIconSpec edit() => const AppIconSpec(svg: AppSvgAssets.settings);

  static AppIconSpec receipt() => const AppIconSpec(svg: AppSvgAssets.receipt);

  static AppIconSpec download() =>
      const AppIconSpec(svg: AppSvgAssets.download);

  static AppIconSpec people() => const AppIconSpec(svg: AppSvgAssets.userCheck);

  static AppIconSpec chart() => const AppIconSpec(svg: AppSvgAssets.chartBars);

  static AppIconSpec goals({bool filled = false}) =>
      const AppIconSpec(svg: AppSvgAssets.compass);

  static AppIconSpec withdraw() =>
      const AppIconSpec(svg: AppSvgAssets.arrowUpRight);

  static AppIconSpec brain() => const AppIconSpec(svg: AppSvgAssets.lightbulb);

  static AppIconSpec support() =>
      const AppIconSpec(svg: AppSvgAssets.userCheck);

  static AppIconSpec close() => const AppIconSpec(svg: AppSvgAssets.x);

  static AppIconSpec sort() => const AppIconSpec(svg: AppSvgAssets.sort);

  static AppIconSpec trendingUp() =>
      const AppIconSpec(svg: AppSvgAssets.trendingUp);

  static AppIconSpec creditCard() =>
      const AppIconSpec(svg: AppSvgAssets.creditCard);

  static AppIconSpec wallet() => const AppIconSpec(svg: AppSvgAssets.wallet);

  static AppIconSpec star({bool filled = false}) =>
      const AppIconSpec(svg: AppSvgAssets.star);

  // ── Goal types ─────────────────────────────────────────────────────────
  static AppIconSpec goalMarriage() =>
      const AppIconSpec(svg: AppSvgAssets.star);

  static AppIconSpec goalHome() => const AppIconSpec(svg: AppSvgAssets.home);

  static AppIconSpec goalEducation() =>
      const AppIconSpec(svg: AppSvgAssets.fileText);

  static AppIconSpec goalRetirement() =>
      const AppIconSpec(svg: AppSvgAssets.calendar);

  static AppIconSpec goalWealth() =>
      const AppIconSpec(svg: AppSvgAssets.trendingUp);

  static AppIconSpec goalEmergency() =>
      const AppIconSpec(svg: AppSvgAssets.shield);

  static AppIconSpec bookmark({bool filled = false}) =>
      const AppIconSpec(svg: AppSvgAssets.bookmark);

  static AppIconSpec favorite({bool filled = false}) => filled
      ? const AppIconSpec(svg: AppSvgAssets.heartFilled)
      : const AppIconSpec(svg: AppSvgAssets.heart);

  static AppIconSpec history() => const AppIconSpec(svg: AppSvgAssets.clock);

  static AppIconSpec privacy() => const AppIconSpec(svg: AppSvgAssets.shield);

  static AppIconSpec policy() => const AppIconSpec(svg: AppSvgAssets.fileText);

  static AppIconSpec delete() => AppIconSpec(
        fallback: isIOS ? CupertinoIcons.delete : Icons.delete_outline_rounded,
      );

  static AppIconSpec calculator() => AppIconSpec(
        fallback: isIOS ? CupertinoIcons.gauge : Icons.calculate_outlined,
      );

  static AppIconSpec goalFor(String id) {
    switch (id) {
      case 'marriage':
        return goalMarriage();
      case 'home':
        return goalHome();
      case 'travel':
        return const AppIconSpec(svg: AppSvgAssets.compass);
      case 'education':
        return goalEducation();
      case 'retirement':
        return goalRetirement();
      case 'big_buy':
        return creditCard();
      case 'wealth':
        return goalWealth();
      case 'emergency':
        return goalEmergency();
      default:
        return goals();
    }
  }
}

/// Unified icon widget — SVG when available, platform glyph otherwise.
class AppIcon extends StatelessWidget {
  const AppIcon(
    this.spec, {
    super.key,
    this.size = 24,
    this.color,
  });

  final AppIconSpec spec;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (spec.hasSvg) {
      return AppSvgIcon(
        spec.svg!,
        size: AppIconSizes.svg(size),
        color: color,
      );
    }
    final resolved = AppIcons.isIOS ? size + 1 : size;
    return Icon(spec.fallback, size: resolved, color: color);
  }
}

/// Platform progress indicator (CupertinoActivityIndicator / CircularProgressIndicator).
class AppProgress extends StatelessWidget {
  const AppProgress({
    super.key,
    this.size = 28,
    this.color,
    this.strokeWidth = 3.2,
  });

  final double size;
  final Color? color;
  final double strokeWidth;

  /// Compact loader for buttons (~22px).
  const AppProgress.button({super.key, this.color})
      : size = 22,
        strokeWidth = 2.4;

  @override
  Widget build(BuildContext context) {
    if (isCupertinoPlatform) {
      return CupertinoActivityIndicator(
        radius: size / 2,
        color: color,
      );
    }
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        color: color ?? AppColors.primary,
      ),
    );
  }
}

/// Platform switch (CupertinoSwitch / Switch).
class AppSwitch extends StatelessWidget {
  const AppSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    if (AppIcons.isIOS) {
      return CupertinoSwitch(
        value: value,
        onChanged: onChanged,
        activeTrackColor: activeColor,
      );
    }
    return Switch(
      value: value,
      onChanged: onChanged,
      activeThumbColor: activeColor,
    );
  }
}

/// True when running on Apple platforms (iOS / macOS).
bool get isCupertinoPlatform {
  if (kIsWeb) return false;
  return defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.macOS;
}

import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';

class GoalItem {
  const GoalItem({
    required this.id,
    required this.title,
    required this.saved,
    required this.target,
    required this.progress,
    required this.badge,
    required this.badgeBg,
    required this.badgeFg,
    required this.avatarColor,
    this.shortCode = '',
    this.tenure = '',
  });

  final String id;
  final String title;
  final double saved;
  final double target;
  final double progress;
  final String badge;
  final Color badgeBg;
  final Color badgeFg;
  final Color avatarColor;
  final String shortCode;
  final String tenure;

  GoalItem copyWith({
    String? id,
    String? title,
    double? saved,
    double? target,
    double? progress,
    String? badge,
    Color? badgeBg,
    Color? badgeFg,
    Color? avatarColor,
    String? shortCode,
    String? tenure,
  }) {
    return GoalItem(
      id: id ?? this.id,
      title: title ?? this.title,
      saved: saved ?? this.saved,
      target: target ?? this.target,
      progress: progress ?? this.progress,
      badge: badge ?? this.badge,
      badgeBg: badgeBg ?? this.badgeBg,
      badgeFg: badgeFg ?? this.badgeFg,
      avatarColor: avatarColor ?? this.avatarColor,
      shortCode: shortCode ?? this.shortCode,
      tenure: tenure ?? this.tenure,
    );
  }

  /// Replace a goal in [userGoals] or [demoGoals] by id.
  static void updateInStores(GoalItem updated) {
    final ui = userGoals.indexWhere((g) => g.id == updated.id);
    if (ui >= 0) {
      userGoals[ui] = updated;
      return;
    }
    final di = demoGoals.indexWhere((g) => g.id == updated.id);
    if (di >= 0) demoGoals[di] = updated;
  }

  /// Two-letter code like HD, JT (for avatar).
  String get initials {
    if (shortCode.trim().isNotEmpty) {
      return shortCode.trim().toUpperCase();
    }
    final parts = title
        .trim()
        .split(RegExp(r'\s+'))
        .where((p) => p.isNotEmpty)
        .toList();
    if (parts.isEmpty) return 'GL';
    if (parts.length == 1) {
      final s = parts[0].replaceAll(RegExp(r"[^A-Za-z0-9]"), '');
      if (s.isEmpty) return 'GL';
      return (s.length >= 2 ? s.substring(0, 2) : '${s[0]}${s[0]}')
          .toUpperCase();
    }
    final a = parts[0].replaceAll(RegExp(r"[^A-Za-z0-9]"), '');
    final b = parts[1].replaceAll(RegExp(r"[^A-Za-z0-9]"), '');
    if (a.isEmpty && b.isEmpty) return 'GL';
    if (a.isEmpty) {
      return (b.length >= 2 ? b.substring(0, 2) : '${b[0]}${b[0]}')
          .toUpperCase();
    }
    if (b.isEmpty) {
      return (a.length >= 2 ? a.substring(0, 2) : '${a[0]}${a[0]}')
          .toUpperCase();
    }
    return '${a[0]}${b[0]}'.toUpperCase();
  }
}

/// Seed goals for Dashboard + Goals screen.
final demoGoals = <GoalItem>[
  GoalItem(
    id: 'home',
    shortCode: 'HD',
    title: 'Home down payment',
    saved: 850000,
    target: 2500000,
    progress: 0.34,
    badge: 'On track · 2032',
    badgeBg: const Color(0xFFE8F5F1),
    badgeFg: AppColors.primary,
    avatarColor: const Color(0xFF0C2E24),
    tenure: '2032',
  ),
  GoalItem(
    id: 'travel',
    shortCode: 'JT',
    title: 'Japan trip',
    saved: 248000,
    target: 400000,
    progress: 0.62,
    badge: 'Ahead · 2027',
    badgeBg: const Color(0xFFFFF4DF),
    badgeFg: AppColors.secondaryDark,
    avatarColor: const Color(0xFFE07A2F),
    tenure: '2027',
  ),
  GoalItem(
    id: 'education',
    shortCode: 'CE',
    title: "Child's education",
    saved: 480000,
    target: 4000000,
    progress: 0.12,
    badge: 'Just started · 2040',
    badgeBg: const Color(0xFFEEEAFE),
    badgeFg: const Color(0xFF6B4EFF),
    avatarColor: const Color(0xFF6B4EFF),
    tenure: '2040',
  ),
];

/// Extra goals added by the user on the Goals screen (session).
final userGoals = <GoalItem>[];

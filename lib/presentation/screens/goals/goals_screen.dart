import 'package:flutter/material.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/goals_data.dart';
import 'package:new_app/presentation/widgets/goal_card.dart';
import 'package:new_app/presentation/widgets/app_back_button.dart';
import 'package:new_app/core/utils/toast_utils.dart';
import 'package:new_app/router/route_manager.dart';

/// Goals screen — stable header, scrollable list, add goals live.
class GoalsScreen extends StatefulWidget {
  const GoalsScreen({super.key});

  @override
  State<GoalsScreen> createState() => _GoalsScreenState();
}

class _GoalsScreenState extends State<GoalsScreen> {
  late List<GoalItem> _goals;

  static const _avatarPalette = <Color>[
    AppColors.primary,
    AppColors.secondaryDark,
    AppColors.primaryLight,
    Color(0xFF5C6B7A),
    Color(0xFF6B4EFF),
    Color(0xFF1B7A4E),
  ];

  @override
  void initState() {
    super.initState();
    _goals = [...userGoals, ...demoGoals];
  }

  Future<void> _openAddGoal() async {
    final created = await showModalBottomSheet<GoalItem>(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => _AddGoalSheet(
        avatarColor: _avatarPalette[_goals.length % _avatarPalette.length],
      ),
    );
    if (created == null || !mounted) return;
    setState(() {
      userGoals.insert(0, created);
      _goals = [...userGoals, ...demoGoals];
    });
    ToastUtils.showToast(
      context,
      message: '${created.title} added',
      type: ToastType.success,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        leading: appBarLeading(
          context,
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              NavigateTo.mainShell(context);
            }
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Goals', style: appBarTitleStyle),
            Text(
              '${_goals.length} goal${_goals.length == 1 ? '' : 's'}',
              style: TextStyles.caption.copyWith(
                color: AppColors.textMuted,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Material(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(12),
              child: InkWell(
                onTap: _openAddGoal,
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Center(
                    child: AppIcon(
                      AppIcons.add(),
                      color: Colors.white,
                      size: AppIconSizes.sm,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 14),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Text(
              'Set a target and tenure — we’ll help you stay on track with SIPs.',
              style: TextStyles.body.copyWith(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          for (final g in _goals)
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: GoalCard(goal: g),
            ),
          const SizedBox(height: 4),
          _NewGoalPlaceholder(onTap: _openAddGoal),
        ],
      ),
    );
  }
}

class _NewGoalPlaceholder extends StatelessWidget {
  const _NewGoalPlaceholder({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: CustomPaint(
          painter: _DashedBorderPainter(
            color: AppColors.border,
            radius: 18,
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 20),
            child: Column(
              children: [
                Text(
                  '+ New goal',
                  style: TextStyles.bodyBold.copyWith(
                    color: AppColors.primary,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  "We'll suggest a monthly amount to reach it",
                  style: TextStyles.caption.copyWith(
                    color: AppColors.textMuted,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DashedBorderPainter extends CustomPainter {
  _DashedBorderPainter({required this.color, required this.radius});

  final Color color;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.6
      ..style = PaintingStyle.stroke;
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(radius),
    );
    final path = Path()..addRRect(rrect);
    const dashWidth = 7.0;
    const dashSpace = 5.0;
    for (final metric in path.computeMetrics()) {
      var distance = 0.0;
      while (distance < metric.length) {
        final next = distance + dashWidth;
        canvas.drawPath(
          metric.extractPath(distance, next.clamp(0, metric.length)),
          paint,
        );
        distance = next + dashSpace;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _AddGoalSheet extends StatefulWidget {
  const _AddGoalSheet({required this.avatarColor});

  final Color avatarColor;

  @override
  State<_AddGoalSheet> createState() => _AddGoalSheetState();
}

class _AddGoalSheetState extends State<_AddGoalSheet> {
  final _name = TextEditingController();
  final _amount = TextEditingController();
  String? _tenure;

  @override
  void dispose() {
    _name.dispose();
    _amount.dispose();
    super.dispose();
  }

  void _save() {
    final name = _name.text.trim();
    if (name.isEmpty) {
      ToastUtils.showToast(
        context,
        message: 'Enter a goal name',
        type: ToastType.warning,
      );
      return;
    }
    final target = double.tryParse(_amount.text.trim()) ?? 0;
    final tenure = _tenure ?? '3–5 yrs';
    final goal = GoalItem(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      title: name,
      saved: 0,
      target: target > 0 ? target : 100000,
      progress: 0,
      badge: target > 0 ? 'Just started · $tenure' : 'Amount pending · $tenure',
      badgeBg: AppColors.chipSelectedBg,
      badgeFg: AppColors.primary,
      avatarColor: widget.avatarColor,
      tenure: tenure,
    );
    Navigator.pop(context, goal);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    final preview = _name.text.trim().isEmpty
        ? 'GL'
        : GoalItem(
            id: 'preview',
            title: _name.text.trim(),
            saved: 0,
            target: 0,
            progress: 0,
            badge: '',
            badgeBg: AppColors.chipSelectedBg,
            badgeFg: AppColors.primary,
            avatarColor: widget.avatarColor,
          ).initials;

    return Padding(
      padding: EdgeInsets.fromLTRB(22, 18, 22, 22 + bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: widget.avatarColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  preview,
                  style: TextStyles.bodyBold.copyWith(
                    color: AppColors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('New goal', style: TextStyles.heading3),
                    Text(
                      'Letters update from the goal name',
                      style: TextStyles.caption,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            'Goal',
            style: TextStyles.caption.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _name,
            onChanged: (_) => setState(() {}),
            textCapitalization: TextCapitalization.words,
            decoration: _fieldDecoration('e.g. Dream car'),
          ),
          const SizedBox(height: 14),
          Text(
            'Amount',
            style: TextStyles.caption.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _amount,
            keyboardType: TextInputType.number,
            decoration: _fieldDecoration('Target amount in ₹'),
          ),
          const SizedBox(height: 14),
          Text(
            'Tenure',
            style: TextStyles.caption.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final t in const [
                '1–3 yrs',
                '3–5 yrs',
                '5–10 yrs',
                '10+ yrs',
              ])
                ChoiceChip(
                  label: Text(t),
                  selected: _tenure == t,
                  selectedColor: AppColors.primary,
                  backgroundColor: AppColors.surfaceMuted,
                  side: BorderSide(
                    color: _tenure == t
                        ? AppColors.primary
                        : AppColors.border,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  showCheckmark: false,
                  labelStyle: TextStyles.caption.copyWith(
                    color:
                        _tenure == t ? AppColors.white : AppColors.textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                  onSelected: (_) => setState(() => _tenure = t),
                ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: _save,
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Save goal',
                style: TextStyles.button.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _fieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: AppColors.surfaceMuted,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    );
  }
}

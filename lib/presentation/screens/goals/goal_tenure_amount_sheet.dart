import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/data/local/goals_data.dart';
import 'package:new_app/data/local/onboarding_data.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';
import 'package:new_app/core/utils/toast_utils.dart';

/// Opens a bottom sheet to set tenure & amount for an existing goal.
Future<GoalItem?> showGoalTenureAmountSheet(
  BuildContext context,
  GoalItem goal,
) {
  return showModalBottomSheet<GoalItem>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: AppColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (ctx) => _GoalTenureAmountSheet(goal: goal),
  );
}

class _GoalTenureAmountSheet extends StatefulWidget {
  const _GoalTenureAmountSheet({required this.goal});

  final GoalItem goal;

  @override
  State<_GoalTenureAmountSheet> createState() => _GoalTenureAmountSheetState();
}

class _GoalTenureAmountSheetState extends State<_GoalTenureAmountSheet> {
  String? _timeframeId;
  String? _amountId;
  late final TextEditingController _customAmount;

  @override
  void initState() {
    super.initState();
    _customAmount = TextEditingController();
    _timeframeId = _matchTimeframeId(widget.goal.tenure);
    _amountId = _matchAmountId(widget.goal.target);
    if (_amountId == 'custom' && widget.goal.target > 0) {
      final lakhs = widget.goal.target / 100000;
      _customAmount.text = lakhs == lakhs.roundToDouble()
          ? lakhs.toStringAsFixed(0)
          : lakhs.toStringAsFixed(1);
    }
  }

  @override
  void dispose() {
    _customAmount.dispose();
    super.dispose();
  }

  String? _matchTimeframeId(String tenure) {
    final t = tenure.trim().toLowerCase();
    if (t.isEmpty) return null;
    for (final opt in timeframeOptions) {
      if (opt.label.toLowerCase() == t || opt.id == t) return opt.id;
    }
    if (t.contains('10+') || t.contains('15') || t.contains('20')) {
      return '10+';
    }
    if (t.contains('5–10') ||
        t.contains('5-10') ||
        RegExp(r'203[0-9]').hasMatch(t)) {
      return '5-10';
    }
    if (t.contains('3–5') ||
        t.contains('3-5') ||
        RegExp(r'202[7-9]').hasMatch(t)) {
      return '3-5';
    }
    if (t.contains('1–3') || t.contains('1-3')) return '1-3';
    return null;
  }

  String? _matchAmountId(double value) {
    if (value <= 0) return null;
    for (final o in amountOptions) {
      if (o.value != null && (o.value! - value).abs() < 1) return o.id;
    }
    return 'custom';
  }

  bool get _valid {
    final amtOk = _amountId != null &&
        (_amountId != 'custom' ||
            (double.tryParse(_customAmount.text.trim()) ?? 0) > 0);
    return amtOk && _timeframeId != null;
  }

  double get _resolvedAmount {
    if (_amountId == 'custom') {
      final lakhs = double.tryParse(_customAmount.text.trim()) ?? 0;
      return lakhs * 100000;
    }
    return amountOptions
            .where((o) => o.id == _amountId)
            .map((o) => o.value)
            .firstOrNull
            ?.toDouble() ??
        widget.goal.target;
  }

  String get _tenureLabel =>
      timeframeOptions
          .where((t) => t.id == _timeframeId)
          .map((t) => t.label)
          .firstOrNull ??
      widget.goal.tenure;

  void _save() {
    if (!_valid) return;
    final target = _resolvedAmount;
    final tenure = _tenureLabel;
    final saved = widget.goal.saved.clamp(0, target);
    final progress = target > 0 ? (saved / target).clamp(0.0, 1.0) : 0.0;
    final updated = widget.goal.copyWith(
      target: target,
      saved: saved.toDouble(),
      progress: progress,
      tenure: tenure,
      badge: progress <= 0.05
          ? 'Just started · $tenure'
          : progress >= 0.6
              ? 'Ahead · $tenure'
              : 'On track · $tenure',
    );
    GoalItem.updateInStores(updated);
    ToastUtils.showToast(
      context,
      message: 'Goal updated · ${Formatters.currency(target)}',
      type: ToastType.success,
    );
    Navigator.pop(context, updated);
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    final goal = widget.goal;

    return Padding(
      padding: EdgeInsets.fromLTRB(22, 12, 22, 22 + bottom),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: AppColors.border,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: goal.avatarColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    goal.initials,
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
                      Text(goal.title, style: TextStyles.heading3),
                      Text(
                        'Set target amount & tenure',
                        style: TextStyles.caption.copyWith(
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _Section(
              number: '1',
              title: 'Tenure',
              subtitle: 'How long do you have to reach this goal?',
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (final tf in timeframeOptions)
                    NeevChip(
                      label: tf.label,
                      selected: _timeframeId == tf.id,
                      onTap: () => setState(() => _timeframeId = tf.id),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            _Section(
              number: '2',
              title: 'Amount',
              subtitle: 'Pick a target corpus — or enter your own in lakhs',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ChipWrap(
                    options: amountOptions,
                    selectedId: _amountId,
                    onSelected: (id) => setState(() => _amountId = id),
                  ),
                  if (_amountId == 'custom') ...[
                    const SizedBox(height: 14),
                    NeevTextField(
                      value: _customAmount.text,
                      hint: 'Amount in ₹ lakhs (e.g. 15)',
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                      ],
                      onChanged: (v) {
                        _customAmount.text = v;
                        _customAmount.selection =
                            TextSelection.collapsed(offset: v.length);
                        setState(() {});
                      },
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(height: 22),
            NeevOutlineButton(
              title: 'Save goal',
              filled: true,
              enabled: _valid,
              onTap: _save,
            ),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  const _Section({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String number;
  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 26,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  number,
                  style: TextStyles.bodyBold.copyWith(
                    color: AppColors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(title, style: TextStyles.bodyBold.copyWith(fontSize: 16)),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyles.caption.copyWith(
              color: AppColors.textMuted,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

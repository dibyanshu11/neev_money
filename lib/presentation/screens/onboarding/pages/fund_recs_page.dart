import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/utils/formatters.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/onboarding_data.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_bloc.dart';
import 'package:new_app/presentation/blocs/onboarding/onboarding_event_state.dart';
import 'package:new_app/presentation/screens/onboarding/shared/onboarding_widgets.dart';
import 'package:new_app/presentation/widgets/charts/fund_line_chart.dart';
import 'package:new_app/presentation/widgets/onboarding/neev_outline_button.dart';
import 'package:new_app/presentation/widgets/whatsapp_fab.dart';
import 'package:new_app/core/utils/toast_utils.dart';

class FundRecsPage extends StatefulWidget {
  const FundRecsPage({super.key, required this.bloc});

  final OnboardingBloc bloc;

  @override
  State<FundRecsPage> createState() => _FundRecsPageState();
}

class _FundRecsPageState extends State<FundRecsPage> {
  int _goalIndex = 0;

  /// Removed fund names keyed by goal id.
  final Map<String, Set<String>> _removedFunds = {};

  List<SavedGoalDraft> get _goals {
    final list = widget.bloc.savedGoals;
    if (list.isNotEmpty) return list;
    final g = goalById(widget.bloc.state.selectedGoalId);
    final total = widget.bloc.getTotalAmount() > 0
        ? widget.bloc.getTotalAmount()
        : 4000000.0;
    return [
      SavedGoalDraft(
        goalId: g?.id ?? 'education',
        label: g?.label ?? "Child's education",
        amountLabel: Formatters.currency(total),
        tenureLabel: '15 yrs',
        amountValue: total,
      ),
    ];
  }

  List<PlanFundLine> _fundsFor(String goalId) {
    final base = samplePlanFunds(goalId);
    final removed = _removedFunds[goalId] ?? {};
    final kept = base.where((f) => !removed.contains(f.name)).toList();
    if (kept.isEmpty) return renormalizePlanFunds([base.first]);
    return renormalizePlanFunds(kept);
  }

  Future<void> _openAdjustSheet(SavedGoalDraft goal) async {
    final funds = _fundsFor(goal.goalId);
    final result = await showModalBottomSheet<_AdjustResult>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: AppColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => _AdjustPlanSheet(
        goal: goal,
        funds: funds,
        allFunds: samplePlanFunds(goal.goalId),
      ),
    );
    if (result == null || !mounted) return;

    widget.bloc.updateSavedGoalAmount(goal.goalId, result.amount);
    setState(() {
      _removedFunds[goal.goalId] = result.removedFundNames;
      // Keep index valid after list refresh
      _goalIndex = _goalIndex.clamp(0, _goals.length - 1);
    });
    ToastUtils.showToast(
      context,
      message: 'Plan updated',
      type: ToastType.success,
    );
  }

  @override
  Widget build(BuildContext context) {
    final bloc = widget.bloc;
    final goalsList = _goals;
    final goal = goalsList[_goalIndex.clamp(0, goalsList.length - 1)];
    final monthlySip = suggestedMonthlySip(goal.amountValue, goal.tenureLabel);
    final funds = _fundsFor(goal.goalId);
    final invest = goal.amountValue * 0.36;
    final growth = goal.amountValue - invest;

    return OnboardingPage(
      bottom: Column(
        children: [
          NeevOutlineButton(
            title: 'Start this plan · ${Formatters.currency(monthlySip)}/mo',
            filled: true,
            onTap: () => bloc.add(const OnboardingEvent.confirmInvest()),
          ),
          const SizedBox(height: 10),
          NeevOutlineButton(
            title: 'Adjust amount or funds',
            onTap: () => _openAdjustSheet(goal),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: WhatsAppButton(
              label: 'WhatsApp · connect to your RM',
              message:
                  'Hi, I want to discuss my ${goal.label} portfolio plan on Neev Money.',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Regular plans · distributed by JK Capital · ARN-XXXXXX',
            style: TextStyles.caption.copyWith(fontSize: 10),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            goalsList.length > 1
                ? 'Plans for your goals'
                : 'Your recommended portfolio',
            style: TextStyles.heading1.copyWith(color: AppColors.textPrimary),
          ),
          const SizedBox(height: 6),
          Text(
            goalsList.length > 1
                ? 'Tap a goal to see its growth path, funds, and suggested SIP.'
                : 'Growth chart and funds tailored to what you’re saving for.',
            style: TextStyles.body.copyWith(
              color: AppColors.textSecondary,
              height: 1.45,
            ),
          ),
          if (goalsList.length > 1) ...[
            const SizedBox(height: 16),
            SizedBox(
              height: 72,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: goalsList.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, i) {
                  final g = goalsList[i];
                  final selected = i == _goalIndex;
                  return GestureDetector(
                    onTap: () => setState(() => _goalIndex = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOutCubic,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color:
                            selected ? AppColors.primary : AppColors.surface,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color:
                              selected ? AppColors.primary : AppColors.border,
                        ),
                        boxShadow: selected ? null : AppColors.cardShadow,
                      ),
                      child: Row(
                        children: [
                          Text(
                            goalEmoji(g.goalId),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                g.label,
                                style: TextStyles.bodyBold.copyWith(
                                  fontSize: 13,
                                  color: selected
                                      ? AppColors.white
                                      : AppColors.textPrimary,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '${Formatters.currency(g.amountValue)} · ${g.tenureLabel}',
                                style: TextStyles.caption.copyWith(
                                  fontSize: 11,
                                  color: selected
                                      ? Colors.white.withValues(alpha: 0.8)
                                      : AppColors.textMuted,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.primarySoft, AppColors.primary],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Suggested monthly SIP',
                            style: TextStyles.caption.copyWith(
                              color: Colors.white.withValues(alpha: 0.72),
                            ),
                          ),
                          Text(
                            Formatters.currency(monthlySip),
                            style: TextStyles.amountMd.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'On track for',
                          style: TextStyles.caption.copyWith(
                            color: Colors.white.withValues(alpha: 0.72),
                          ),
                        ),
                        Text(
                          '≈ ${Formatters.currency(goal.amountValue)}',
                          style: TextStyles.bodyBold.copyWith(
                            color: AppColors.white,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const SizedBox(
                  height: 88,
                  width: double.infinity,
                  child: GrowthLineChart(height: 92, onDark: true),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: _MiniStat(
                        label: 'You invest',
                        value: Formatters.currency(invest),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _MiniStat(
                        label: 'Est. growth',
                        value: '+${Formatters.currency(growth)}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Text(
                  "Illustrative, assuming ~12% p.a. Mutual funds are subject to market risk; returns aren't guaranteed.",
                  style: TextStyles.caption.copyWith(
                    color: Colors.white.withValues(alpha: 0.65),
                    fontSize: 10,
                    height: 1.35,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text('Funds & allocation', style: TextStyles.heading3),
              ),
              TextButton(
                onPressed: () => _openAdjustSheet(goal),
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Edit',
                  style: TextStyles.bodyBold.copyWith(
                    color: AppColors.primary,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (final fund in funds)
            _PlanFundTile(
              fund: fund,
              monthly: monthlySip * fund.pct / 100,
              onDelete: funds.length > 1
                  ? () {
                      setState(() {
                        final set =
                            _removedFunds.putIfAbsent(goal.goalId, () => {});
                        set.add(fund.name);
                      });
                    }
                  : null,
            ),
        ],
      ),
    );
  }
}

class _AdjustResult {
  const _AdjustResult({
    required this.amount,
    required this.removedFundNames,
  });

  final double amount;
  final Set<String> removedFundNames;
}

class _AdjustPlanSheet extends StatefulWidget {
  const _AdjustPlanSheet({
    required this.goal,
    required this.funds,
    required this.allFunds,
  });

  final SavedGoalDraft goal;
  final List<PlanFundLine> funds;
  final List<PlanFundLine> allFunds;

  @override
  State<_AdjustPlanSheet> createState() => _AdjustPlanSheetState();
}

class _AdjustPlanSheetState extends State<_AdjustPlanSheet> {
  late String? _amountId;
  late final TextEditingController _custom;
  late Set<String> _removed;

  @override
  void initState() {
    super.initState();
    _custom = TextEditingController();
    _removed = {
      for (final f in widget.allFunds)
        if (!widget.funds.any((k) => k.name == f.name)) f.name,
    };
    _amountId = _matchAmountId(widget.goal.amountValue);
    if (_amountId == 'custom') {
      _custom.text = (widget.goal.amountValue / 100000).toStringAsFixed(
        widget.goal.amountValue % 100000 == 0 ? 0 : 1,
      );
    }
  }

  String? _matchAmountId(double value) {
    for (final o in amountOptions) {
      if (o.value != null && (o.value! - value).abs() < 1) return o.id;
    }
    return 'custom';
  }

  double get _amount {
    if (_amountId == 'custom') {
      final lakhs = double.tryParse(_custom.text.trim()) ?? 0;
      return lakhs > 0 ? lakhs * 100000 : widget.goal.amountValue;
    }
    final matched = amountOptions
        .where((o) => o.id == _amountId)
        .map((o) => o.value)
        .firstOrNull;
    return (matched ?? widget.goal.amountValue).toDouble();
  }

  List<PlanFundLine> get _visibleFunds {
    final kept =
        widget.allFunds.where((f) => !_removed.contains(f.name)).toList();
    if (kept.isEmpty) return renormalizePlanFunds([widget.allFunds.first]);
    return renormalizePlanFunds(kept);
  }

  @override
  void dispose() {
    _custom.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    final funds = _visibleFunds;

    return Padding(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 16 + bottom),
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
            Text('Adjust amount or funds', style: TextStyles.heading3),
            const SizedBox(height: 6),
            Text(
              widget.goal.label,
              style: TextStyles.caption.copyWith(color: AppColors.textMuted),
            ),
            const SizedBox(height: 18),
            Text(
              'AMOUNT',
              style: TextStyles.caption.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 10),
            ChipWrap(
              options: amountOptions,
              selectedId: _amountId,
              onSelected: (id) => setState(() => _amountId = id),
            ),
            if (_amountId == 'custom') ...[
              const SizedBox(height: 12),
              NeevTextField(
                value: _custom.text,
                hint: 'Amount in ₹ lakhs (e.g. 15)',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
                ],
                onChanged: (v) {
                  _custom.text = v;
                  _custom.selection =
                      TextSelection.collapsed(offset: v.length);
                  setState(() {});
                },
              ),
            ],
            const SizedBox(height: 20),
            Text(
              'FUNDS',
              style: TextStyles.caption.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: 0.6,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Delete a fund to rebalance the rest. Keep at least one.',
              style: TextStyles.caption.copyWith(color: AppColors.textMuted),
            ),
            const SizedBox(height: 12),
            for (final fund in funds)
              _PlanFundTile(
                fund: fund,
                monthly: suggestedMonthlySip(_amount, widget.goal.tenureLabel) *
                    fund.pct /
                    100,
                onDelete: funds.length > 1
                    ? () => setState(() => _removed.add(fund.name))
                    : null,
              ),
            if (_removed.isNotEmpty) ...[
              TextButton(
                onPressed: () => setState(() => _removed.clear()),
                child: Text(
                  'Restore all funds',
                  style: TextStyles.bodyBold.copyWith(
                    color: AppColors.primary,
                    fontSize: 13,
                  ),
                ),
              ),
            ],
            const SizedBox(height: 8),
            NeevOutlineButton(
              title: 'Apply changes',
              filled: true,
              onTap: () => Navigator.pop(
                context,
                _AdjustResult(
                  amount: _amount,
                  removedFundNames: Set<String>.from(_removed),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanFundTile extends StatelessWidget {
  const _PlanFundTile({
    required this.fund,
    required this.monthly,
    this.onDelete,
  });

  final PlanFundLine fund;
  final double monthly;
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(fund.color),
              shape: BoxShape.circle,
            ),
            child: Text(
              fund.initials,
              style: TextStyles.caption.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fund.name,
                  style: TextStyles.bodyBold.copyWith(fontSize: 14),
                ),
                const SizedBox(height: 2),
                Text(fund.subtitle, style: TextStyles.caption),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${fund.pct}%',
                style: TextStyles.bodyBold.copyWith(fontSize: 15),
              ),
              Text(
                '${Formatters.currency(monthly)}/mo',
                style: TextStyles.caption,
              ),
            ],
          ),
          if (onDelete != null) ...[
            const SizedBox(width: 4),
            IconButton(
              onPressed: onDelete,
              tooltip: 'Remove fund',
              icon: AppIcon(
                AppIcons.delete(),
                color: AppColors.error,
                size: AppIconSizes.sm,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  const _MiniStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyles.caption.copyWith(
              color: Colors.white.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyles.bodyBold.copyWith(color: AppColors.white),
          ),
        ],
      ),
    );
  }
}

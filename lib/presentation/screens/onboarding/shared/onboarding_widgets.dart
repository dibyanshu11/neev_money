import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_app/core/constant/app_colors.dart';
import 'package:new_app/core/constant/text_styles.dart';
import 'package:new_app/core/constant/app_icon_sizes.dart';
import 'package:new_app/core/utils/platform_icons.dart';
import 'package:new_app/data/local/onboarding_data.dart';

/// Page layout with scroll body + sticky bottom CTA area.
class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.child,
    this.bottom,
  });

  final Widget child;
  final Widget? bottom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(22, 4, 22, 28),
            physics: const BouncingScrollPhysics(),
            child: child,
          ),
        ),
        if (bottom != null)
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              22,
              14,
              22,
              16 + MediaQuery.paddingOf(context).bottom.clamp(0, 8),
            ),
            decoration: BoxDecoration(
              color: AppColors.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 18,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: bottom!,
          ),
      ],
    );
  }
}

class PageIntro extends StatelessWidget {
  const PageIntro({
    super.key,
    required this.title,
    required this.subtitle,
    this.eyebrow,
  });

  final String title;
  final String subtitle;
  final String? eyebrow;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (eyebrow != null) ...[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.secondarySoft,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              eyebrow!,
              style: TextStyles.caption.copyWith(
                color: AppColors.secondaryDark,
                fontWeight: FontWeight.w700,
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(height: 14),
        ],
        Text(title, style: TextStyles.heading1),
        const SizedBox(height: 8),
        Text(subtitle, style: TextStyles.subtitle),
      ],
    );
  }
}

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(16),
    this.selected = false,
    this.onTap,
    this.color,
    this.margin,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final bool selected;
  final VoidCallback? onTap;
  final Color? color;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    final card = AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: color ??
            (selected ? AppColors.chipSelectedBg : AppColors.surface),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: selected ? AppColors.primary : AppColors.border,
          width: selected ? 1.8 : 1,
        ),
        boxShadow: selected
            ? [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 6),
                ),
              ]
            : AppColors.cardShadow,
      ),
      child: child,
    );
    if (onTap == null) return card;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: card,
      ),
    );
  }
}

class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 2),
      child: Text(
        text,
        style: TextStyles.fieldLabel,
      ),
    );
  }
}

InputDecoration neevInputDecoration({String? hint, bool bordered = true}) {
  final radius = BorderRadius.circular(16);
  final idle = OutlineInputBorder(
    borderRadius: radius,
    borderSide: bordered
        ? const BorderSide(color: AppColors.border)
        : BorderSide.none,
  );

  return InputDecoration(
    filled: true,
    fillColor: AppColors.surfaceMuted,
    hintText: hint,
    hintStyle: TextStyles.body.copyWith(color: AppColors.textMuted),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    border: idle,
    enabledBorder: idle,
    focusedBorder: bordered
        ? OutlineInputBorder(
            borderRadius: radius,
            borderSide: const BorderSide(color: AppColors.primary, width: 1.6),
          )
        : idle,
  );
}

class NeevTextField extends StatefulWidget {
  const NeevTextField({
    super.key,
    required this.value,
    required this.onChanged,
    this.hint,
    this.keyboardType,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.style,
    this.bordered = true,
  });

  final String value;
  final ValueChanged<String> onChanged;
  final String? hint;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final TextStyle? style;
  final bool bordered;

  @override
  State<NeevTextField> createState() => _NeevTextFieldState();
}

class _NeevTextFieldState extends State<NeevTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant NeevTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value && widget.value != _controller.text) {
      _controller.text = widget.value;
      _controller.selection =
          TextSelection.collapsed(offset: widget.value.length);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      textAlign: widget.textAlign,
      style: widget.style ?? TextStyles.inputBold,
      decoration: neevInputDecoration(
        hint: widget.hint,
        bordered: widget.bordered,
      ),
    );
  }
}

class OtpBoxes extends StatelessWidget {
  const OtpBoxes({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String value;
  final ValueChanged<String> onChanged;

  static const length = 6;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(length, (i) {
        final digit = i < value.length ? value[i] : '';
        final focused =
            i == value.length || (value.length == length && i == length - 1);
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: i == length - 1 ? 0 : 8),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              curve: Curves.easeOutCubic,
              height: 56,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.surfaceMuted,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: focused
                      ? AppColors.primary
                      : digit.isNotEmpty
                          ? AppColors.primary.withValues(alpha: 0.35)
                          : AppColors.border,
                  width: focused ? 2 : 1.2,
                ),
              ),
              child: Text(
                digit,
                style: TextStyles.heading2.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}

/// Hidden field that drives [OtpBoxes] visuals.
class OtpInput extends StatefulWidget {
  const OtpInput({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final String value;
  final ValueChanged<String> onChanged;

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  late final TextEditingController _c;
  late final FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _c = TextEditingController(text: widget.value);
    _focus = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _focus.context == null) return;
      _focus.requestFocus();
    });
  }

  @override
  void didUpdateWidget(covariant OtpInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _c.text) {
      _c.text = widget.value;
      _c.selection = TextSelection.collapsed(offset: widget.value.length);
    }
  }

  @override
  void dispose() {
    _c.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OtpBoxes(value: widget.value, onChanged: widget.onChanged),
        Positioned.fill(
          child: Opacity(
            opacity: 0.01,
            child: TextField(
              controller: _c,
              focusNode: _focus,
              keyboardType: TextInputType.number,
              maxLength: OtpBoxes.length,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(OtpBoxes.length),
              ],
              onChanged: widget.onChanged,
              decoration: const InputDecoration(
                counterText: '',
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChipWrap extends StatelessWidget {
  const ChipWrap({
    super.key,
    required this.options,
    required this.selectedId,
    required this.onSelected,
  });

  final List<AmountOption> options;
  final String? selectedId;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
        for (final opt in options)
          _SelectChip(
            label: opt.label,
            selected: selectedId == opt.id,
            onTap: () => onSelected(opt.id),
          ),
      ],
    );
  }
}

class _SelectChip extends StatelessWidget {
  const _SelectChip({
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
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: selected ? AppColors.primary : AppColors.border,
          ),
          boxShadow: selected ? null : AppColors.cardShadow,
        ),
        child: Text(
          label,
          style: TextStyles.bodyBold.copyWith(
            color: selected ? AppColors.white : AppColors.textPrimary,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class AllocationBar extends StatelessWidget {
  const AllocationBar({
    super.key,
    required this.equityPct,
    required this.hybridPct,
    required this.debtPct,
  });

  final int equityPct;
  final int hybridPct;
  final int debtPct;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            height: 12,
            child: Row(
              children: [
                if (equityPct > 0)
                  Expanded(
                    flex: equityPct,
                    child: const ColoredBox(color: AppColors.primary),
                  ),
                if (hybridPct > 0)
                  Expanded(
                    flex: hybridPct,
                    child: const ColoredBox(color: AppColors.secondary),
                  ),
                if (debtPct > 0)
                  Expanded(
                    flex: debtPct,
                    child: const ColoredBox(color: AppColors.allocationDebt),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            _LegendDot(color: AppColors.primary, label: 'Equity $equityPct%'),
            const SizedBox(width: 14),
            _LegendDot(color: AppColors.secondary, label: 'Hybrid $hybridPct%'),
            const SizedBox(width: 14),
            _LegendDot(
              color: AppColors.allocationDebt,
              label: 'Debt $debtPct%',
            ),
          ],
        ),
      ],
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: TextStyles.caption.copyWith(fontSize: 11)),
      ],
    );
  }
}

class FundRecCard extends StatelessWidget {
  const FundRecCard({
    super.key,
    required this.fundKey,
    required this.pct,
    this.selected,
    this.onTap,
    this.amountLabel,
  });

  final String fundKey;
  final int pct;
  final bool? selected;
  final VoidCallback? onTap;
  final String? amountLabel;

  @override
  Widget build(BuildContext context) {
    final fund = fundTemplates[fundKey]!;
    return AppCard(
      selected: selected == true,
      onTap: onTap,
      margin: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            width: 46,
            height: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.chipSelectedBg,
                  AppColors.secondarySoft,
                ],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              fund.category.isNotEmpty ? fund.category[0] : 'F',
              style: TextStyles.bodyBold.copyWith(
                color: AppColors.primary,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(fund.name, style: TextStyles.bodyBold),
                const SizedBox(height: 3),
                Text(fund.category, style: TextStyles.caption),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (pct > 0)
                Text(
                  '$pct%',
                  style: TextStyles.bodyBold.copyWith(color: AppColors.primary),
                ),
              if (amountLabel != null)
                Text(amountLabel!, style: TextStyles.caption)
              else
                Text(
                  '${fund.ret} · 3Y',
                  style: TextStyles.caption.copyWith(
                    color: AppColors.positive,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
          if (onTap != null) ...[
            const SizedBox(width: 8),
            Icon(
              selected == true ? AppIcons.radioOn() : AppIcons.radioOff(),
              color: selected == true
                  ? AppColors.primary
                  : AppColors.textMuted,
              size: AppIconSizes.md,
            ),
          ],
        ],
      ),
    );
  }
}

class SummaryRow extends StatelessWidget {
  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.bold = false,
  });

  final String label;
  final String value;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyles.body),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: bold
                  ? TextStyles.bodyBold.copyWith(fontSize: 15)
                  : TextStyles.bodyBold,
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarCircle extends StatelessWidget {
  const AvatarCircle({
    super.key,
    required this.initials,
    this.size = 56,
  });

  final String initials;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.secondary, AppColors.secondaryDark],
        ),
        shape: BoxShape.circle,
        boxShadow: AppColors.cardShadow,
      ),
      child: Text(
        initials,
        style: TextStyles.bodyBold.copyWith(
          color: AppColors.white,
          fontSize: size * 0.32,
        ),
      ),
    );
  }
}

class SuccessBadge extends StatelessWidget {
  const SuccessBadge({super.key, this.icon});

  final AppIconSpec? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const LinearGradient(
          colors: [AppColors.primarySoft, AppColors.primary],
        ),
        boxShadow: AppColors.softShadow,
      ),
      child: AppIcon(
        icon ?? AppIcons.checkPlain(),
        color: AppColors.white,
        size: AppIconSizes.hero,
      ),
    );
  }
}

AppIconSpec goalIcon(String id) => AppIcons.goalFor(id);

String goalEmoji(String id) {
  switch (id) {
    case 'home':
      return '🏠';
    case 'travel':
      return '✈️';
    case 'education':
      return '🎓';
    case 'retirement':
      return '🌴';
    case 'big_buy':
      return '🚗';
    case 'emergency':
      return '🛟';
    case 'other':
      return '✏️';
    default:
      return '🎯';
  }
}

String nameInitials(String name) {
  final parts = name.trim().split(RegExp(r'\s+'));
  if (parts.isEmpty || parts.first.isEmpty) return 'N';
  if (parts.length == 1) return parts.first[0].toUpperCase();
  return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
}

GoalOption? goalById(String? id) {
  if (id == null) return null;
  if (id == 'other') {
    return const GoalOption(
      id: 'other',
      label: 'Any other',
      sub: 'Custom goal',
      letter: 'O',
    );
  }
  for (final g in goals) {
    if (g.id == id) return g;
  }
  return null;
}

RelationshipManager? rmById(String? id) {
  if (id == null) return null;
  for (final r in rms) {
    if (r.id == id) return r;
  }
  return null;
}

// Back-compat aliases used by older pages
typedef SoftCard = AppCard;
typedef SectionLabel = FieldLabel;

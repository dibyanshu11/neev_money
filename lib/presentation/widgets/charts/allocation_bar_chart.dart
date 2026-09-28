import 'package:flutter/material.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/constants/text_styles.dart';
import 'package:new_app/domain/entities/portfolio_model.dart';

class AllocationBarChart extends StatelessWidget {
  const AllocationBarChart({
    super.key,
    required this.items,
    this.height = 14,
  });

  final List<AllocationItem> items;
  final double height;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(height / 2),
          child: SizedBox(
            height: height,
            child: Row(
              children: items.asMap().entries.map((entry) {
                final index = entry.key;
                final item = entry.value;
                final isFirst = index == 0;
                final isLast = index == items.length - 1;
                return Expanded(
                  flex: item.percentage.round().clamp(1, 100),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _colorFor(item.name),
                      borderRadius: BorderRadius.horizontal(
                        left: isFirst
                            ? Radius.circular(height / 2)
                            : Radius.zero,
                        right: isLast
                            ? Radius.circular(height / 2)
                            : Radius.zero,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        const SizedBox(height: 14),
        Wrap(
          spacing: 16,
          runSpacing: 8,
          children: items.map((item) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _colorFor(item.name),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  '${item.name} ${item.percentage.round()}%',
                  style: TextStyles.caption.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ],
    );
  }

  static Color _colorFor(String name) {
    return switch (name) {
      'Flexi Cap' => AppColors.primary,
      'Small Cap' => AppColors.secondary,
      'Debt' => const Color(0xFF4CAF50),
      'ELSS' => const Color(0xFF2196F3),
      'Index' => const Color(0xFF2196F3),
      _ => AppColors.grey,
    };
  }
}

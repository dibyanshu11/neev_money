import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:new_app/core/constants/app_colors.dart';
import 'package:new_app/core/utils/chart_data.dart';

class FundLineChart extends StatelessWidget {
  const FundLineChart({
    super.key,
    required this.baseNav,
    required this.period,
    this.height = 180,
    this.showGrid = true,
    this.lineColor,
  });

  final double baseNav;
  final String period;
  final double height;
  final bool showGrid;
  final Color? lineColor;

  @override
  Widget build(BuildContext context) {
    final spots = ChartDataHelper.navSpots(period, baseNav);
    final minY = spots.map((s) => s.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);
    final pad = ((maxY - minY) * 0.18).clamp(0.5, baseNav);
    final color = lineColor ?? AppColors.primary;
    final last = spots.last;

    return Container(
      height: height,
      padding: const EdgeInsets.fromLTRB(8, 12, 12, 8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: LineChart(
        LineChartData(
          minY: minY - pad,
          maxY: maxY + pad,
          gridData: FlGridData(
            show: showGrid,
            drawVerticalLine: false,
            horizontalInterval: (maxY - minY + pad * 2) / 3,
            getDrawingHorizontalLine: (value) => FlLine(
              color: AppColors.divider.withValues(alpha: 0.85),
              strokeWidth: 1,
              dashArray: [4, 4],
            ),
          ),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineTouchData: LineTouchData(
            handleBuiltInTouches: true,
            getTouchedSpotIndicator: (bar, indexes) => indexes
                .map(
                  (i) => TouchedSpotIndicatorData(
                    FlLine(
                      color: color.withValues(alpha: 0.35),
                      strokeWidth: 1.2,
                    ),
                    FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) =>
                          FlDotCirclePainter(
                        radius: 5,
                        color: AppColors.white,
                        strokeWidth: 2.5,
                        strokeColor: color,
                      ),
                    ),
                  ),
                )
                .toList(),
            touchTooltipData: LineTouchTooltipData(
              getTooltipColor: (_) => AppColors.primary,
              tooltipRoundedRadius: 10,
              getTooltipItems: (touched) => touched
                  .map(
                    (s) => LineTooltipItem(
                      '₹${s.y.toStringAsFixed(2)}',
                      const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              curveSmoothness: 0.28,
              color: color,
              barWidth: 2.8,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: true,
                checkToShowDot: (spot, _) => spot.x == last.x,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 4.5,
                  color: AppColors.white,
                  strokeWidth: 2.5,
                  strokeColor: color,
                ),
              ),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    color.withValues(alpha: 0.28),
                    color.withValues(alpha: 0.04),
                    color.withValues(alpha: 0.0),
                  ],
                  stops: const [0, 0.55, 1],
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
      ),
    );
  }
}

/// Projection / growth chart for portfolio & plan screens.
class GrowthLineChart extends StatelessWidget {
  const GrowthLineChart({
    super.key,
    this.height = 88,
    this.onDark = true,
  });

  final double height;
  final bool onDark;

  @override
  Widget build(BuildContext context) {
    final spots = ChartDataHelper.growthSpots();
    final minY = spots.map((s) => s.y).reduce((a, b) => a < b ? a : b);
    final maxY = spots.map((s) => s.y).reduce((a, b) => a > b ? a : b);
    final line = onDark ? Colors.white : AppColors.primary;
    final fillTop = onDark
        ? Colors.white.withValues(alpha: 0.28)
        : AppColors.primary.withValues(alpha: 0.22);

    return SizedBox(
      height: height,
      width: double.infinity,
      child: LineChart(
        LineChartData(
          minY: minY * 0.92,
          maxY: maxY * 1.05,
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineTouchData: const LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              curveSmoothness: 0.32,
              color: line.withValues(alpha: onDark ? 0.95 : 1),
              barWidth: 2.6,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    fillTop,
                    (onDark ? Colors.white : AppColors.primary)
                        .withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutCubic,
      ),
    );
  }
}

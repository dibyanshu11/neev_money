import 'dart:math';

import 'package:fl_chart/fl_chart.dart';

class ChartDataHelper {
  static List<FlSpot> navSpots(String period, double baseNav) {
    final pointCount = switch (period) {
      '1Y' => 14,
      '3Y' => 20,
      '5Y' => 28,
      _ => 36,
    };

    final growth = switch (period) {
      '1Y' => 0.10,
      '3Y' => 0.26,
      '5Y' => 0.42,
      _ => 0.58,
    };

    return List.generate(pointCount, (i) {
      final progress = i / (pointCount - 1);
      // Gentle compounding curve + small market noise.
      final curve = pow(progress, 0.85).toDouble();
      final wave = sin(i * 0.55) * baseNav * 0.015
          + cos(i * 0.28) * baseNav * 0.008;
      final value =
          baseNav * (1 - growth) + baseNav * growth * curve + wave;
      return FlSpot(i.toDouble(), value);
    });
  }

  /// Smooth upward projection for portfolio / SIP growth cards.
  static List<FlSpot> growthSpots({int points = 24}) {
    return List.generate(points, (i) {
      final t = i / (points - 1);
      final value = 10 + 90 * pow(t, 1.35) + sin(i * 0.4) * 2.2;
      return FlSpot(i.toDouble(), value.toDouble());
    });
  }
}

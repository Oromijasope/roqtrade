import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MiniPerformanceChart extends StatelessWidget {
  final Color lineColor;
  final int points;

  const MiniPerformanceChart({
    Key? key,
    this.lineColor = const Color(0xFF17B26A),
    this.points = 12,
  }) : super(key: key);

  List<FlSpot> _generateData() {
    final random = Random();
    double base = 50 + random.nextDouble() * 50;
    return List.generate(points, (i) {
      base += random.nextDouble() * 8 - 4;
      return FlSpot(i.toDouble(), base);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = _generateData();

    return SizedBox(
      height: 60,
      width: 120,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: data,
              isCurved: true,
              colors: [lineColor],
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              barWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}

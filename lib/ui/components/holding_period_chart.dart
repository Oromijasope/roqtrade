import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HoldingPeriodChartComponent extends StatelessWidget {
  const HoldingPeriodChartComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF20252B),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Holding period",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                DropdownButton<String>(
                  value: '7 days',
                  onChanged: (String? newValue) {},
                  items: <String>['7 days', '30 days', '60 days', '90 days']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  dropdownColor: const Color(0xFF20252B),
                  iconEnabledColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: ScatterChart(
                ScatterChartData(
                  gridData: FlGridData(
                    show: true,
                    getDrawingHorizontalLine: (value) => FlLine(
                      color: Colors.white.withOpacity(0.2),
                      strokeWidth: 1,
                    ),
                    getDrawingVerticalLine: (value) => FlLine(
                      color: Colors.white.withOpacity(0.2),
                      strokeWidth: 1,
                    ),
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10),
                      margin: 8,
                      reservedSize: 30,
                    ),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10),
                      margin: 8,
                    ),
                    topTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (context, value) =>
                          const TextStyle(color: Colors.white, fontSize: 10),
                      margin: 8,
                    ),
                    rightTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.white24, width: 1),
                  ),
                  minX: 0,
                  maxX: 4,
                  minY: 64000,
                  maxY: 65000,
                  scatterSpots: [
                    ScatterSpot(0, 64000, color: Colors.green),
                    ScatterSpot(1, 64500, color: Colors.green),
                    ScatterSpot(2, 64800, color: Colors.green),
                    ScatterSpot(3, 64400, color: Colors.red),
                    ScatterSpot(4, 64200, color: Colors.red),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildTimeLabel("1m"),
                _buildTimeLabel("24h"),
                _buildTimeLabel("5d"),
                _buildTimeLabel("15d"),
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.circle, color: Colors.green, size: 16),
                SizedBox(width: 4),
                Text("Profit",
                    style: TextStyle(color: Colors.white, fontSize: 14)),
                SizedBox(width: 16),
                Icon(Icons.circle, color: Colors.red, size: 16),
                SizedBox(width: 4),
                Text("Loss",
                    style: TextStyle(color: Colors.white, fontSize: 14)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildTimeLabel(String label) {
    return Text(
      label,
      style: const TextStyle(color: Colors.white, fontSize: 12),
    );
  }
}

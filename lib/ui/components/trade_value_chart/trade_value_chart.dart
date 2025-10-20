import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stacked/stacked.dart';
import '../loading.dart';
import 'trade_value_chart_model.dart';

class TradeValueChartComponent extends StackedView<TradeValueChartViewModel> {
  const TradeValueChartComponent({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, TradeValueChartViewModel viewModel, Widget? child) {
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
            const Text(
              "Total PNL",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: DropdownButton<String>(
                value: viewModel.selectedRange,
                onChanged: (value) {
                  if (value != null) viewModel.changeRange(value);
                },
                items: ['7 days', '30 days', '60 days', '90 days']
                    .map((String value) => DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: const TextStyle(color: Colors.white)),
                        ))
                    .toList(),
                dropdownColor: const Color(0xFF20252B),
                iconEnabledColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: viewModel.isBusy
                  ? const Center(child: Loading())
                  : LineChart(
                      LineChartData(
                        gridData: FlGridData(
                          show: true,
                          drawVerticalLine: true,
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
                            getTextStyles: (context, value) => const TextStyle(
                                color: Colors.white, fontSize: 10),
                            margin: 8,
                            reservedSize: 30,
                          ),
                          bottomTitles: SideTitles(
                            showTitles: true,
                            getTextStyles: (context, value) => const TextStyle(
                                color: Colors.white, fontSize: 10),
                            margin: 8,
                            reservedSize: 30,
                          ),
                          topTitles: SideTitles(showTitles: false),
                          rightTitles: SideTitles(showTitles: false),
                        ),
                        borderData: FlBorderData(show: false),
                        lineBarsData: [
                          LineChartBarData(
                            spots: viewModel.chartData,
                            isCurved: true,
                            colors: [const Color(0XFF17B26A)],
                            barWidth: 2.5,
                            belowBarData: BarAreaData(
                              show: true,
                              colors: [
                                const Color(0xFF17B26A).withOpacity(0.3)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  TradeValueChartViewModel viewModelBuilder(BuildContext context) =>
      TradeValueChartViewModel();
}

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:stacked/stacked.dart';
import '../loading.dart';
import 'roi_chart_model.dart';

class ROIChartComponent extends StackedView<ROIChartViewModel> {
  final String coinId;
  final bool isMyDashboard;

  const ROIChartComponent(
      {Key? key, required this.coinId, required this.isMyDashboard})
      : super(key: key);

  @override
  void onViewModelReady(ROIChartViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.setCoin(coinId);
  }

  @override
  Widget builder(
      BuildContext context, ROIChartViewModel viewModel, Widget? child) {
    return Card(
      color: const Color(0xFF20252B),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isMyDashboard
                    ? const Text(
                        "Copy trading PNL",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    : const Text(
                        "ROI",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
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
              ],
            ),
            const SizedBox(height: 12),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: viewModel.isBusy
                  ? const Center(child: Loading())
                  : viewModel.chartData.isEmpty
                      ? const Center(
                          child: Text(
                            "No chart data available",
                            style: TextStyle(color: Colors.white70),
                          ),
                        )
                      : LineChart(
                          LineChartData(
                            gridData: FlGridData(show: true),
                            titlesData: FlTitlesData(
                              leftTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (context, value) =>
                                    const TextStyle(
                                        color: Colors.white, fontSize: 10),
                                margin: 8,
                                reservedSize: 30,
                              ),
                              bottomTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (context, value) =>
                                    const TextStyle(
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
                                    const Color(0XFF17B26A).withOpacity(0.3)
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
  ROIChartViewModel viewModelBuilder(BuildContext context) =>
      ROIChartViewModel();
}

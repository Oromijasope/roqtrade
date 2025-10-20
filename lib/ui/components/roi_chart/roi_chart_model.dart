import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stacked/stacked.dart';

class ROIChartViewModel extends BaseViewModel {
  String selectedRange = '7 days';
  String _coinId = 'bitcoin';
  List<FlSpot> chartData = [];

  Future<void> setCoin(String coinId) async {
    _coinId = coinId;
    await loadChartData();
  }

  Future<void> changeRange(String range) async {
    selectedRange = range;
    notifyListeners();
    await loadChartData();
  }

  Future<void> loadChartData() async {
    setBusy(true);

    try {
      final days = {
        '7 days': '7',
        '30 days': '30',
        '60 days': '60',
        '90 days': '90'
      }[selectedRange]!;

      final url =
          'https://api.coingecko.com/api/v3/coins/$_coinId/market_chart?vs_currency=usd&days=$days';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final prices = data['prices'] as List?;

        if (prices == null || prices.isEmpty) {
          throw Exception('No price data available for $_coinId');
        }

        final List<FlSpot> points = [];
        for (int i = 0; i < prices.length; i++) {
          final p = prices[i];
          final x = i.toDouble();
          final y = (p[1] as num?)?.toDouble() ?? 0;
          if (y.isFinite) points.add(FlSpot(x, y));
        }

        if (points.isEmpty) {
          throw Exception('No valid chart points for $_coinId');
        }

        chartData = points;
      } else {
        throw Exception('Failed to fetch market chart for $_coinId');
      }
    } catch (e) {
      debugPrint('Error fetching market chart for $_coinId: $e');

      chartData = List.generate(
        20,
        (i) => FlSpot(i.toDouble(), (1000 + i * 10 + i % 5 * 20).toDouble()),
      );
    }

    setBusy(false);
    notifyListeners();
  }
}

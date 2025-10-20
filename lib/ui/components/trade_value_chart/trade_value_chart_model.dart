import 'package:fl_chart/fl_chart.dart';
import 'package:stacked/stacked.dart';
import 'dart:math';

class TradeValueChartViewModel extends BaseViewModel {
  String _selectedRange = '7 days';
  String get selectedRange => _selectedRange;

  List<FlSpot> _chartData = [];
  List<FlSpot> get chartData => _chartData;

  final Random _random = Random();

  TradeValueChartViewModel() {
    _loadData();
  }

  void changeRange(String newRange) {
    _selectedRange = newRange;
    _loadData();
    notifyListeners();
  }

  void _loadData() {
    setBusy(true);

    int points = _selectedRange == '7 days'
        ? 7
        : _selectedRange == '30 days'
            ? 30
            : _selectedRange == '60 days'
                ? 60
                : 90;

    _chartData = List.generate(points, (i) {
      return FlSpot(i.toDouble(), 60000 + _random.nextInt(5000).toDouble());
    });

    setBusy(false);
  }
}

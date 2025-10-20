import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.bottomsheets.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../datamodels/copier.dart';
import '../../../../../datamodels/trade_item.dart';
import '../../../../../services/api_service.dart';
import '../../../../../services/utils_service.dart';

class TradingDetailsViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _apiService = locator<ApiService>();
  final UtilsService _utilsService = locator<UtilsService>();

  final String selectedTraderCoin;

  TradingDetailsViewModel({required this.selectedTraderCoin});

  Map<String, dynamic>? _coinData;
  Map<String, dynamic>? get coinData => _coinData;

  List<TradeItem> _currentTrades = [];
  List<TradeItem> get currentTrades => _currentTrades;

  List<TradeItem> _tradeHistory = [];
  List<TradeItem> get tradeHistory => _tradeHistory;

  List<Copier> _copiers = [];
  List<Copier> get copiers => _copiers;

  List<Copier> _filteredCopiers = [];
  List<Copier> get filteredCopiers => _filteredCopiers;

  Future<void> fetchCoinStats() async {
    setBusy(true);
    notifyListeners();

    try {
      setBusy(true);
      _coinData = await _apiService.fetchCoinData(selectedTraderCoin);
      debugPrint(selectedTraderCoin);

      _currentTrades = [
        TradeItem(
          pair: '${selectedTraderCoin.toUpperCase()}USDT',
          leverage: '10X',
          roi: 3.28,
          entryPrice: '1.9661',
          marketPrice: '1.9728',
          copiers: 20,
          copiersAmount: '1009.772',
          entryTime: '01:22 PM',
          logoUrl: _coinData?['image'] ?? '',
        ),
        TradeItem(
          pair: '${selectedTraderCoin.toUpperCase()}USDT',
          leverage: '5X',
          roi: -1.84,
          entryPrice: '1.9512',
          marketPrice: '1.9458',
          copiers: 12,
          copiersAmount: '823.400',
          entryTime: '09:40 AM',
          logoUrl: _coinData?['image'] ?? '',
        ),
      ];

      _tradeHistory = [
        TradeItem(
          pair: '${selectedTraderCoin.toUpperCase()}USDT',
          leverage: '15X',
          roi: 6.21,
          entryPrice: '1.9201',
          exitPrice: '1.9602',
          copiers: 30,
          copiersAmount: '1450.00',
          entryTime: '09:10 PM',
          exitTime: '10:22 PM',
        ),
      ];

      // ✅ Mock Copiers
      _copiers = [
        const Copier(
            name: 'Jaykay Kayode',
            totalVolume: '996.28',
            tradingProfit: '278.81'),
        const Copier(
            name: 'Okobi Laura',
            totalVolume: '1205.42',
            tradingProfit: '350.14'),
        const Copier(
            name: 'Tosin Lasisi',
            totalVolume: '875.10',
            tradingProfit: '190.45'),
        const Copier(
            name: 'Michael Ade',
            totalVolume: '645.22',
            tradingProfit: '125.30'),
      ];

      _filteredCopiers = List.from(_copiers);
    } catch (e) {
      debugPrint("⚠️ Error fetching coin stats: $e");
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }

  void filterCopiers(String query) {
    if (query.isEmpty) {
      _filteredCopiers = List.from(_copiers);
    } else {
      _filteredCopiers = _copiers
          .where((c) =>
              c.name.toLowerCase().contains(query.toLowerCase()) ||
              c.totalVolume.contains(query) ||
              c.tradingProfit.contains(query))
          .toList();
    }
    notifyListeners();
  }

  @override
  void setBusy(bool value) {
    _utilsService.initiateLoading(value);
    super.setBusy(value);
  }

  Future showImportantBottomSheet() async {
    var sheetResponse = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.importantMessage,
      title: 'Important message!',
      description:
          'Don’t invest unless you’re prepared and understand the risks involved in copy trading.',
      barrierDismissible: false,
    );

    if (sheetResponse?.data == 'showRisks') {
      await _bottomSheetService.showCustomSheet(
        variant: BottomSheetType.risks,
        title: 'Risks involved in copy trading',
        isScrollControlled: true,
        description:
            'Here are some of the key risks to understand before copying trades.',
      );
    }
  }
}

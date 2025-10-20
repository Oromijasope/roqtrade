import 'package:flutter/material.dart';
import 'package:roqtrade/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../services/api_service.dart';
import '../../../services/utils_service.dart';

class DashboardViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final UtilsService _utilsService = locator<UtilsService>();
  final ApiService _apiService = ApiService();

  String bitcoinPrice = '';
  String ethereumPrice = '';
  String ripplePrice = '';
  String litecoinPrice = '';

  String bitcoinChange = '';
  String ethereumChange = '';
  String rippleChange = '';
  String litecoinChange = '';

  String bitcoinIconUrl = '';
  String ethereumIconUrl = '';
  String rippleIconUrl = '';
  String litecoinIconUrl = '';

  Future<void> fetchCoinPrices() async {
    try {
      setBusy(true);

      var btcData = await _apiService.fetchCoinData('bitcoin');
      bitcoinPrice = btcData['price'];
      bitcoinChange = btcData['changePercentage'];
      bitcoinIconUrl = btcData['icon'];

      var ethData = await _apiService.fetchCoinData('ethereum');
      ethereumPrice = ethData['price'];
      ethereumChange = ethData['changePercentage'];
      ethereumIconUrl = ethData['icon'];

      var xrpData = await _apiService.fetchCoinData('ripple');
      ripplePrice = xrpData['price'];
      rippleChange = xrpData['changePercentage'];
      rippleIconUrl = xrpData['icon'];

      var ltcData = await _apiService.fetchCoinData('litecoin');
      litecoinPrice = ltcData['price'];
      litecoinChange = ltcData['changePercentage'];
      litecoinIconUrl = ltcData['icon'];

      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching coin data: $e");
    } finally {
      setBusy(false);
    }
  }

  @override
  void setBusy(bool value) {
    _utilsService.initiateLoading(value);
    super.setBusy(value);
  }

  void gotoAllCoins() {
    _navigationService.navigateToListedCoinsView();
  }

  void onSearchTap() {}

  void onSupportTap() {}

  void onNotificationTap() {}

  void gotoCopyTrading() {
    _navigationService.navigateToCopyTradingView();
  }
}

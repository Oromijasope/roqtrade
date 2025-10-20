import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../app/app.locator.dart';
import '../../../../services/api_service.dart';
import '../../../../services/utils_service.dart';

class ListedCoinsViewModel extends BaseViewModel {
  final ApiService _apiService = ApiService();
  final UtilsService _utilsService = locator<UtilsService>();

  List<Map<String, dynamic>> allCoins = [];

  Future<void> fetchAllCoins() async {
    try {
      setBusy(true);
      allCoins = await _apiService.fetchTop20Coins();
      notifyListeners();
    } catch (e) {
      debugPrint("Error fetching all coins: $e");
    } finally {
      setBusy(false);
    }
  }

  @override
  void setBusy(bool value) {
    _utilsService.initiateLoading(value);
    super.setBusy(value);
  }
}

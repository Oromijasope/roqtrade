import 'dart:math';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../../../app/app.locator.dart';
import '../../../../../app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../services/api_service.dart';
import '../../../../../services/utils_service.dart';

class CopyTradingDashboardViewModel extends BaseViewModel {
  final _apiService = ApiService();
  final _navigationService = locator<NavigationService>();
  final UtilsService _utilsService = locator<UtilsService>();

  List<Map<String, dynamic>> _traders = [];
  List<Map<String, dynamic>> get traders => _traders;

  Future<void> loadProTraders() async {
    setBusy(true);
    try {
      final coins = await _apiService.fetchTop20Coins();
      final random = Random();

      _traders = coins.take(6).map((coin) {
        final change = (coin['price_change_percentage_24h'] ?? 0.0) as double;
        final roi =
            (change * (0.8 + random.nextDouble() * 0.4)).toStringAsFixed(2);
        final pnl =
            "\$${(random.nextDouble() * 50000 + 5000).toStringAsFixed(2)}";
        final winRate = "${(60 + random.nextInt(40))}%";
        final aum = (random.nextDouble() * 120000 + 10000).toStringAsFixed(2);

        final followers = (100 + random.nextInt(900)).toString();

        return {
          'name': coin['name'],
          'id': coin['id'],
          'initials': coin['symbol'].toString().substring(0, 2).toUpperCase(),
          'roi': "$roi%",
          'pnl': pnl,
          'winRate': winRate,
          'aum': aum,
          'followers': followers,
        };
      }).toList();
    } catch (e) {
      debugPrint('Error fetching traders: $e');
    }
    setBusy(false);
  }

  void gotoTradingDetail(Map<String, dynamic> trader) {
    _navigationService.navigateToTradingDetailsView(
      traderName: trader['name'],
      traderInitials: trader['initials'],
      followers: trader['followers'],
      coinId: trader['id'],
    );
  }

  void gotoMyDashboard() {
    _navigationService.navigateToMyDasboardView();
  }

  @override
  void setBusy(bool value) {
    _utilsService.initiateLoading(value);
    super.setBusy(value);
  }
}

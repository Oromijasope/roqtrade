import 'package:roqtrade/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/app.locator.dart';

class IntroViewModel extends BaseViewModel {
  int selectedRiskLevel = 0;
  final _navigationService = locator<NavigationService>();

  void selectRiskLevel(int level) {
    selectedRiskLevel = level;
    notifyListeners();
  }

  void gotoDashboard() {
    _navigationService.navigateToCopyTradingDashboardView();
  }
}

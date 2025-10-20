import 'package:roqtrade/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../app/app.locator.dart';

class CopyTradingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  int _currentPage = 0;

  int get currentPage => _currentPage;

  void setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void goToIntro() {
    _navigationService.navigateToIntroView();
  }
}

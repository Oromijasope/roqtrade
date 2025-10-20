import 'package:roqtrade/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class ImportantMessageSheetModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool isChecked = false;

  void toggleCheckbox(bool value) {
    isChecked = value;
    notifyListeners();
  }

  void gotoEnterAmount() {
    _navigationService.navigateToEnterAmountView();
  }
}

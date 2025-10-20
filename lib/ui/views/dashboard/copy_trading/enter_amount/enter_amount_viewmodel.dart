import 'package:roqtrade/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/app.locator.dart';

class EnterAmountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  String amount = '';
  double balance = 240.73;
  double transactionFee = 1.00;

  void updateAmount(String value) {
    amount = value;
    notifyListeners();
  }

  void useMaxAmount() {
    amount = balance.toString();
    notifyListeners();
  }

  void proceedToNextStep() {
    _navigationService.navigateToConfirmTransactionView(
        copyTradingAmount: amount);
  }
}

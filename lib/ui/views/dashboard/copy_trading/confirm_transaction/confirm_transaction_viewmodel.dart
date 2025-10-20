import 'package:roqtrade/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../../app/app.locator.dart';

class ConfirmTransactionViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final String copyTradingAmount;
  ConfirmTransactionViewModel({required this.copyTradingAmount});

  double get transactionFee => (double.tryParse(copyTradingAmount) ?? 0) * 0.01;

  double get amountAfterFee =>
      (double.tryParse(copyTradingAmount) ?? 0) - transactionFee;

  bool get isButtonEnabled => amountAfterFee > 0;

  void confirmTransaction() {
    _navigationService.navigateToEnterPinView();
  }
}

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/app.locator.dart';
import '../../../../../app/app.router.dart';

class EnterPinViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  final List<String> _pinLabel = [];
  List<String> get pinLabel => _pinLabel;

  bool get isPinComplete => _pinLabel.length == 6;

  void goBack() {
    _navigationService.back();
  }

  void gotoSuccessPage() {
    _navigationService.navigateToSuccessView(
        titleText: 'Trade copied successfully',
        subText: "You have successfully copied BTC Master’s trade. ",
        buttonLabel: 'Go to dashboard',
        buttonOnTapFunction: () {
          _navigationService.clearStackAndShow(Routes.homeView);
        });
  }

  Color getPinLabelStatus(int index) {
    return _pinLabel.length >= index ? Colors.white : const Color(0xFF2A2F36);
  }

  void updatePinLabel(String value) {
    if (value == '-1') {
      if (_pinLabel.isNotEmpty) {
        _pinLabel.removeLast();
        rebuildUi();
      }
      return;
    }

    if (_pinLabel.length < 6 && RegExp(r'^\d$').hasMatch(value)) {
      _pinLabel.add(value);
      rebuildUi();

      if (isPinComplete) {
        _onPinComplete();
      }
    }
  }

  void _onPinComplete() {
    debugPrint("PIN entered: ${_pinLabel.join()}");

    gotoSuccessPage();
  }
}

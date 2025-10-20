import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../common/ui_helpers.dart';
import '../../../../components/keyboard_input/keyboard_input.dart';
import '../../../../components/pin_display/pin_display.dart';
import 'enter_pin_viewmodel.dart';

class EnterPinView extends StackedView<EnterPinViewModel> {
  const EnterPinView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EnterPinViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2127),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2127),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          children: [
            verticalSpaceSmall,
            Image.asset('assets/images/pin_code_lock.png'),
            const SizedBox(
              height: 28,
            ),
            const Text(
              'Confirm Transaction',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            verticalSpaceSmall,
            const Text(
              textAlign: TextAlign.center,
              'Input your 6 digit transaction PIN to confirm your transaction and authenticate your request',
              style: TextStyle(fontSize: 14, color: Color(0xFFA7B1BC)),
            ),
            verticalSpaceLarge,
            PinDisplay(getPinLabelStatus: viewModel.getPinLabelStatus),
            verticalSpaceLarge,
            KeyboardInput(
              updatePinLabel: viewModel.updatePinLabel,
            ),
            verticalSpaceLarge,
            const Text(
              textAlign: TextAlign.center,
              'Forgot PIN?',
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF85D1F0),
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  @override
  EnterPinViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      EnterPinViewModel();
}

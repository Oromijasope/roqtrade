import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../common/ui_helpers.dart';
import '../../components/button_hot.dart';
import 'success_viewmodel.dart';

class SuccessView extends StackedView<SuccessViewModel> {
  const SuccessView(
      {required this.titleText,
      required this.subText,
      required this.buttonLabel,
      this.amount,
      required this.buttonOnTapFunction,
      Key? key})
      : super(key: key);

  final String titleText;
  final String subText;
  final String? amount;
  final String buttonLabel;
  final VoidCallback buttonOnTapFunction;

  @override
  Widget builder(
    BuildContext context,
    SuccessViewModel viewModel,
    Widget? child,
  ) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: const Color(0xFF1C2127),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 27),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpaceSmall,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/images/success.svg'),
                    Text(
                      titleText,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    verticalSpaceSmall,
                    Text(
                      subText,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA7B1BC)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                FractionallySizedBox(
                  widthFactor: 1,
                  child: ButtonHot(
                      label: buttonLabel,
                      onPressed: buttonOnTapFunction,
                      isDisabled: false),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  SuccessViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SuccessViewModel();
}

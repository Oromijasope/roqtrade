import 'package:flutter/material.dart';
import 'package:roqtrade/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import '../../../../components/button_hot.dart';
import 'enter_amount_viewmodel.dart';

class EnterAmountView extends StackedView<EnterAmountViewModel> {
  const EnterAmountView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    EnterAmountViewModel viewModel,
    Widget? child,
  ) {
    final textController = TextEditingController(text: viewModel.amount);

    return Scaffold(
      backgroundColor: const Color(0xFF1C2127),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2127),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Enter Amount',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceMassive,
            Center(
              child: IntrinsicWidth(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Flexible(
                      child: TextField(
                        controller: textController,
                        onChanged: viewModel.updateAmount,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "0.00",
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w900,
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "USD",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF20252B),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "Transaction fee (1%) - ${viewModel.transactionFee.toStringAsFixed(2)} USD",
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
            ),
            verticalSpaceMassive,
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF262932),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "USD Balance",
                        style: TextStyle(color: Colors.white70, fontSize: 14),
                      ),
                      Text(
                        "\$${viewModel.balance.toStringAsFixed(2)}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: viewModel.useMaxAmount,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Use Max",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ButtonHot(
              width: double.infinity,
              height: 52,
              label: 'Continue',
              isDisabled: viewModel.amount.isEmpty,
              onPressed: viewModel.amount.isNotEmpty
                  ? viewModel.proceedToNextStep
                  : null,
            ),
            verticalSpaceMedium,
          ],
        ),
      ),
    );
  }

  @override
  EnterAmountViewModel viewModelBuilder(BuildContext context) =>
      EnterAmountViewModel();
}

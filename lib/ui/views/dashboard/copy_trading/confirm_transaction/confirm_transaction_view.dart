import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqtrade/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import '../../../../components/button_hot.dart';
import '../../../../components/transaction_detail_row.dart';
import 'confirm_transaction_viewmodel.dart';

class ConfirmTransactionView extends StackedView<ConfirmTransactionViewModel> {
  final String copyTradingAmount;
  const ConfirmTransactionView({
    Key? key,
    required this.copyTradingAmount,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ConfirmTransactionViewModel viewModel,
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
        centerTitle: true,
        title: const Text(
          'Confirm Transaction',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceMedium,
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF20252B),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor:
                          const Color(0xFF5C8AFF).withOpacity(0.15),
                      child: SvgPicture.asset(
                        'assets/images/england_flag.svg',
                        width: 56,
                        height: 56,
                      ),
                    ),
                    verticalSpaceSmall,
                    const Text(
                      'Copy trading amount',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA7B1BC)),
                    ),
                    verticalSpaceTiny,
                    Text(
                      "${viewModel.copyTradingAmount} USD",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                    verticalSpaceMedium,
                    const TransactionDetailRow(
                      label: 'PRO trader',
                      value: "BTC master",
                    ),
                    verticalSpaceMedium,
                    TransactionDetailRow(
                      label: 'What you get',
                      value: "${viewModel.amountAfterFee} USD",
                    ),
                    verticalSpaceMedium,
                    TransactionDetailRow(
                      label: 'Transaction fee',
                      value: "${viewModel.transactionFee} USD",
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ButtonHot(
                width: double.infinity,
                height: 52,
                label: 'Confirm transaction',
                isDisabled: !viewModel.isButtonEnabled,
                onPressed: viewModel.isButtonEnabled
                    ? viewModel.confirmTransaction
                    : null,
              ),
              verticalSpaceMedium,
            ],
          ),
        ),
      ),
    );
  }

  @override
  ConfirmTransactionViewModel viewModelBuilder(BuildContext context) =>
      ConfirmTransactionViewModel(copyTradingAmount: copyTradingAmount);
}

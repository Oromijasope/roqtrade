import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import '../../../../components/button_hot.dart';
import '../../../../components/risk_profile_card.dart';
import 'intro_viewmodel.dart';

class IntroView extends StackedView<IntroViewModel> {
  const IntroView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    IntroViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2127),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
        title: const Text(
          "Copy trading",
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: const Color(0xFF1C2127),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              "What risk level are you comfortable exploring?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Choose a level",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA7B1BC),
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  RiskProfileCard(
                    title: 'Conservative profile',
                    description:
                        'Conservative profile involves stable returns from proven strategies with minimal volatility.',
                    onTap: () {
                      viewModel.selectRiskLevel(1);
                    },
                    isSelected: viewModel.selectedRiskLevel == 1,
                  ),
                  const SizedBox(height: 16),
                  RiskProfileCard(
                    title: 'Steady growth profile',
                    description:
                        'Steady growth involves balanced gains with moderate fluctuations in strategy performance.',
                    onTap: () {
                      viewModel.selectRiskLevel(2);
                    },
                    isSelected: viewModel.selectedRiskLevel == 2,
                  ),
                  const SizedBox(height: 16),
                  RiskProfileCard(
                    title: 'Exponential growth profile',
                    description:
                        'It has potentials for significant gains or losses due to aggressive trading and market exposure.',
                    onTap: () {
                      viewModel.selectRiskLevel(3);
                    },
                    isSelected: viewModel.selectedRiskLevel == 3,
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            ButtonHot(
              width: double.infinity,
              label: 'Proceed',
              onPressed: () {
                viewModel.gotoDashboard();
              },
              isDisabled: false,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  @override
  IntroViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      IntroViewModel();
}

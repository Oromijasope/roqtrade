import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../../../components/button_hot.dart';
import 'copy_trading_viewmodel.dart';

class CopyTradingView extends StackedView<CopyTradingViewModel> {
  const CopyTradingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CopyTradingViewModel viewModel,
    Widget? child,
  ) {
    final PageController pageController = PageController();

    pageController.addListener(() {
      final newPage = pageController.page?.round() ?? 0;
      if (newPage != viewModel.currentPage) {
        viewModel.setCurrentPage(newPage);
      }
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1C2127),
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
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
          children: [
            const SizedBox(height: 16),
            Row(
              children: List.generate(2, (index) {
                final isActive = index == viewModel.currentPage;
                return Expanded(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 4,
                    decoration: BoxDecoration(
                      color: isActive
                          ? const Color(0xFF85D1F0)
                          : const Color(0xFF262932),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        "Copy PRO traders",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Leverage expert strategies from professional traders to boost your trading results.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA7B1BC),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Expanded(
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/images/bitcoin_trading_illustration.svg',
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Watch a how to video",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF85D1F0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ButtonHot(
                        width: double.infinity,
                        label: 'Get Started',
                        onPressed: () {
                          viewModel.goToIntro();
                        },
                        isDisabled: false,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      const Text(
                        "Do less, Win more",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      const Text(
                        "Streamline your approach to trading and increase your winning potential effortlessly.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFA7B1BC),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Expanded(
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/images/crypto_trading_illustration.svg',
                          ),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Watch a how to video",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF85D1F0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      ButtonHot(
                        width: double.infinity,
                        label: 'Get Started',
                        onPressed: () {
                          viewModel.goToIntro();
                        },
                        isDisabled: false,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CopyTradingViewModel viewModelBuilder(BuildContext context) =>
      CopyTradingViewModel();
}

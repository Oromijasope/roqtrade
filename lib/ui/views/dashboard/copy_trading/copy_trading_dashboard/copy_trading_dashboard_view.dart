import 'package:flutter/material.dart';
import 'package:roqtrade/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';

import '../../../../components/dashboard_card.dart';
import '../../../../components/trader_profile_card.dart';
import 'copy_trading_dashboard_viewmodel.dart';

class CopyTradingDashboardView
    extends StackedView<CopyTradingDashboardViewModel> {
  const CopyTradingDashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    CopyTradingDashboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2127),
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
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => await viewModel.loadProTraders(),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(12.0),
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DashboardCard(
                      title: "My dashboard",
                      description: "View trades",
                      iconPath: 'assets/icons/new_dashboard_icon_1.svg',
                      onTap: viewModel.gotoMyDashboard,
                      isFirstCard: true,
                    ),
                    DashboardCard(
                      title: "Become a PRO trader",
                      description: "Apply Now",
                      iconPath: 'assets/icons/new_become_a_trader_icon_1.svg',
                      onTap: () {},
                      isFirstCard: false,
                    ),
                  ],
                ),
                verticalSpaceMedium,
                const Text(
                  "PRO Traders",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                verticalSpaceSmall,
                ...viewModel.traders.map(
                  (trader) => Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TraderProfileCard(
                      traderName: trader['name'],
                      traderInitials: trader['initials'],
                      roi: trader['roi'],
                      pnl: trader['pnl'],
                      winRate: trader['winRate'],
                      aum: trader['aum'],
                      followers: trader['followers'],
                      onCopy: () => viewModel.gotoTradingDetail(trader),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  CopyTradingDashboardViewModel viewModelBuilder(BuildContext context) =>
      CopyTradingDashboardViewModel();

  @override
  void onViewModelReady(CopyTradingDashboardViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.loadProTraders();
  }
}

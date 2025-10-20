import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqtrade/ui/components/loading.dart';
import 'package:stacked/stacked.dart';

import '../../../../components/asset_allocation.dart';
import '../../../../components/button_hot.dart';
import '../../../../components/copiers_list.dart';
import '../../../../components/holding_period_chart.dart';
import '../../../../components/roi_chart/roi_chart.dart';
import '../../../../components/trade_value_chart/trade_value_chart.dart';
import '../../../../components/trader_certification_card.dart';
import '../../../../components/trades_section.dart';
import '../../../../components/trading_statistics.dart';
import 'trading_details_viewmodel.dart';

class TradingDetailsView extends StatelessWidget {
  final String traderName;
  final String traderInitials;
  final String followers;
  final String coinId;
  const TradingDetailsView({
    Key? key,
    required this.traderName,
    required this.traderInitials,
    required this.followers,
    required this.coinId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TradingDetailsViewModel>.reactive(
      viewModelBuilder: () =>
          TradingDetailsViewModel(selectedTraderCoin: coinId),
      onViewModelReady: (model) => model.fetchCoinStats(),
      builder: (context, model, child) {
        return DefaultTabController(
          length: 4,
          child: Scaffold(
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
                "Trading details",
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor:
                                const Color(0xFF5C8AFF24).withOpacity(0.14),
                            child: Text(
                              traderInitials,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -4,
                            right: -4,
                            child:
                                SvgPicture.asset('assets/icons/layer_36.svg'),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            traderName,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              SvgPicture.asset('assets/icons/u_users_alt.svg'),
                              const SizedBox(width: 4),
                              Text(
                                "$followers copiers",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF85D1F0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildInfoBox("43 trading days"),
                      _buildInfoBox("15% profit-share"),
                      _buildInfoBox("56 total orders"),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const TraderCertificationCard(
                    traderLabel: "Certified PROtrader",
                    highWinRateText: "High win rate",
                    greatRiskControlText: "Great risk control",
                    verifiedText: "Verified",
                    winRateIcon: 'assets/icons/graph_icon.svg',
                    riskControlIcon: 'assets/icons/scale_icon.svg',
                  ),
                  const SizedBox(height: 16),
                  const TabBar(
                    labelPadding: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    isScrollable: false,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.white70,
                    dividerColor: Colors.transparent,
                    indicatorColor: Color(0xFF85D1F0),
                    tabs: [
                      Tab(text: 'Chart'),
                      Tab(text: 'Stats'),
                      Tab(text: 'All Trades'),
                      Tab(text: 'Copiers'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: TabBarView(
                      children: [
                        _buildChartTab(context, model),
                        _buildStatsTab(model),
                        _buildAllTradesTab(model),
                        _buildCopiersTab(model),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  static Widget _buildChartTab(
      BuildContext context, TradingDetailsViewModel model) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ROIChartComponent(
            coinId: model.selectedTraderCoin,
            isMyDashboard: false,
          ),
          const SizedBox(height: 16),
          ButtonHot(
            width: double.infinity,
            label: 'Copy trade',
            onPressed: model.showImportantBottomSheet,
            isDisabled: false,
          ),
          const SizedBox(height: 16),
          const TradeValueChartComponent(),
          const AssetAllocationComponent(),
          const HoldingPeriodChartComponent(),
        ],
      ),
    );
  }

  static Widget _buildStatsTab(TradingDetailsViewModel model) {
    if (model.isBusy) {
      return const Center(child: Loading());
    }

    final data = model.coinData;
    if (data == null) {
      return const Center(
        child:
            Text("No stats available", style: TextStyle(color: Colors.white70)),
      );
    }

    return TradingStatistics(
      selectedTimeRange: '7 days',
      averageROI: data['changePercentage'] ?? "0",
      winRates: "85",
      totalProfit: data['price'] ?? "0",
      averageLosses: "0",
      totalTrades: "72",
      averageROIIcon: data['icon'],
      winRatesIcon: data['icon'],
      totalProfitIcon: data['icon'],
      averageLossesIcon: data['icon'],
      totalTradesIcon: data['icon'],
    );
  }

  static Widget _buildAllTradesTab(TradingDetailsViewModel model) {
    if (model.isBusy) {
      return const Center(
        child: Loading(),
      );
    }

    return TradesSection(
      current: model.currentTrades,
      history: model.tradeHistory,
    );
  }

  static Widget _buildCopiersTab(TradingDetailsViewModel model) {
    if (model.isBusy) {
      return const Center(
        child: Loading(),
      );
    }

    if (model.filteredCopiers.isEmpty) {
      return const Center(
        child: Text(
          "No copiers found",
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    return CopiersList(
      copiers: model.filteredCopiers,
      onSearchChanged: model.filterCopiers,
    );
  }

  static Widget _buildInfoBox(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF262932),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        value,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: Color(0xFFA7B1BC),
        ),
      ),
    );
  }
}

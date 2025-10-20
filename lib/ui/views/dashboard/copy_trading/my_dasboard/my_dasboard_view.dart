import 'package:flutter/material.dart';
import 'package:roqtrade/ui/components/loading.dart';
import 'package:stacked/stacked.dart';

import '../../../../components/copiers_list.dart';
import '../../../../components/roi_chart/roi_chart.dart';
import '../../../../components/trades_section.dart';
import '../../../../components/trading_statistics.dart';
import '../../../../components/copy_trading_summary_card.dart';
import 'my_dasboard_viewmodel.dart';

class MyDasboardView extends StackedView<MyDasboardViewModel> {
  const MyDasboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    MyDasboardViewModel viewModel,
    Widget? child,
  ) {
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
            "My dashboard",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const CopyTradingSummaryCard(
                assets: 5564.96,
                netProfit: 5564.96,
                todaysPnl: 207.25,
                currency: 'USD',
              ),
              const SizedBox(height: 20),
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
                  Tab(text: 'Current Trades'),
                  Tab(text: 'Stats'),
                  Tab(text: 'My traders'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildChartTab(context, viewModel),
                    _buildAllTradesTab(viewModel),
                    _buildStatsTab(viewModel),
                    _buildCopiersTab(viewModel),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildChartTab(
      BuildContext context, MyDasboardViewModel model) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ROIChartComponent(
            coinId: model.selectedTraderCoin,
            isMyDashboard: true,
          ),
          const SizedBox(height: 16),
          const Text(
            "Trading History",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          if (model.isBusy)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Loading(),
              ),
            )
          else if (model.currentTrades.isEmpty && model.tradeHistory.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(
                child: Text(
                  "No trades available",
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            )
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...model.currentTrades
                    .map((trade) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TradeCard(item: trade),
                        ))
                    .toList(),
                ...model.tradeHistory
                    .map((trade) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: TradeCard(item: trade),
                        ))
                    .toList(),
              ],
            ),
        ],
      ),
    );
  }

  static Widget _buildStatsTab(MyDasboardViewModel model) {
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

  static Widget _buildAllTradesTab(MyDasboardViewModel model) {
    if (model.isBusy) {
      return const Center(child: Loading());
    }

    if (model.currentTrades.isEmpty && model.tradeHistory.isEmpty) {
      return const Center(
        child: Text(
          "No trades available",
          style: TextStyle(color: Colors.white70),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...model.currentTrades.map(
            (trade) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TradeCard(item: trade),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Trade History",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          ...model.tradeHistory.map(
            (trade) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TradeCard(item: trade),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildCopiersTab(MyDasboardViewModel model) {
    if (model.isBusy) {
      return const Center(child: Loading());
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

  @override
  MyDasboardViewModel viewModelBuilder(BuildContext context) =>
      MyDasboardViewModel();
}

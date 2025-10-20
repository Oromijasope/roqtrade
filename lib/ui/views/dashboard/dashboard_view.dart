import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqtrade/ui/common/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import '../../components/copy_trading_card.dart';
import '../../components/crypto_card.dart';
import '../../components/notification_card.dart';
import '../../components/notification_carousel.dart';
import '../../components/top_bar_component.dart';
import 'dashboard_viewmodel.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(DashboardViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchCoinPrices();
  }

  @override
  Widget builder(
      BuildContext context, DashboardViewModel viewModel, Widget? child) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFC0CFFE),
              Color(0xFFF3DFF4),
              Color(0xFFF9D8E5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.only(top: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBarComponent(
                onSearchTap: viewModel.onSearchTap,
                onSupportTap: viewModel.onSupportTap,
                onNotificationTap: viewModel.onNotificationTap,
              ),
              verticalSpaceMedium,
              _buildBalanceCard(context, viewModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard(BuildContext context, DashboardViewModel viewModel) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1E26),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your GBP Balance ",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              SvgPicture.asset('assets/icons/eye.svg')
            ],
          ),
          verticalSpaceTiny,
          RichText(
            text: const TextSpan(
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "£0",
                  style: TextStyle(fontSize: 32),
                ),
                TextSpan(
                  text: ".00",
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          verticalSpaceMedium,
          // Action buttons
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF262932),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionItem("Deposit", 'assets/icons/deposit.svg'),
                horizontalSpaceMedium,
                _actionItem("Buy", 'assets/icons/buy.svg'),
                horizontalSpaceMedium,
                _actionItem("Withdraw", 'assets/icons/withdraw.svg'),
                horizontalSpaceMedium,
                _actionItem(
                  "Sell",
                  'assets/icons/sell.svg',
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFF2A2F38),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                "See more",
                style: TextStyle(
                  color: Color(0xFF85D1F0),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          verticalSpaceMedium,
          CopyTradingCard(
            onTap: viewModel.gotoCopyTrading,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 8.0, top: 16.0, bottom: 8.0),
              child: Text(
                "Stay Updated",
                style: TextStyle(
                  color: Color(0xFFA7B1BC),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          NotificationCarousel(
            notifications: [
              NotificationCard(
                title: 'Delisting coins',
                message: 'View the list of coins we are delisting.',
                badgeText: 'Urgent Notice',
                badgeColor: const Color(0xFFFF554A).withOpacity(0.1),
                iconPath: 'assets/icons/notification_on.svg',
              ),
              const NotificationCard(
                title: 'Exchange Rate',
                message: 'View all currencies rate at a glance',
                iconPath: 'assets/icons/money.svg',
              ),
              const NotificationCard(
                title: 'Roqqu Expands to Europe',
                message: 'We are now on the shores of Europe!',
                iconPath: 'assets/icons/money.svg',
              ),
            ],
          ),

          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 16.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Listed Coins",
                    style: TextStyle(
                      color: Color(0xFFA7B1BC),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  GestureDetector(
                    onTap: viewModel.gotoAllCoins,
                    child: const Text(
                      "See all",
                      style: TextStyle(
                        color: Color(0xFF85D1F0),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CryptoCard(
            name: 'Bitcoin',
            avatarColor: const Color(0xFFF7931A),
            symbol: 'BTC',
            price: '\$${viewModel.bitcoinPrice}',
            changePercentage: '${viewModel.bitcoinChange}%',
            iconUrl: viewModel.bitcoinIconUrl,
          ),
          CryptoCard(
            name: 'Ethereum',
            avatarColor: const Color(0xFF627EEA),
            symbol: 'ETH',
            price: '\$${viewModel.ethereumPrice}',
            changePercentage: '${viewModel.ethereumChange}%',
            iconUrl: viewModel.ethereumIconUrl,
          ),
          CryptoCard(
            name: 'Ripple',
            avatarColor: const Color(0xFF23292F),
            symbol: 'XRP',
            price: '\$${viewModel.ripplePrice}',
            changePercentage: '${viewModel.rippleChange}%',
            iconUrl: viewModel.rippleIconUrl,
          ),
          CryptoCard(
            name: 'Litecoin',
            avatarColor: const Color(0xFF345D9D),
            symbol: 'LTC',
            price: '\$${viewModel.litecoinPrice}',
            changePercentage: '${viewModel.litecoinChange}%',
            iconUrl: viewModel.litecoinIconUrl,
          ),

          verticalSpaceMedium
        ],
      ),
    );
  }

  Widget _actionItem(
    String label,
    String iconPath, {
    double svgWidth = 24,
    double svgHeight = 24,
  }) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color(0xFF262932),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SizedBox(
            width: svgWidth,
            height: svgHeight,
            child: SvgPicture.asset(
              iconPath,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();
}

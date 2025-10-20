import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../../components/crypto_card.dart';
import 'listed_coins_viewmodel.dart';

class ListedCoinsView extends StackedView<ListedCoinsViewModel> {
  const ListedCoinsView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(ListedCoinsViewModel viewModel) {
    super.onViewModelReady(viewModel);
    viewModel.fetchAllCoins();
  }

  @override
  Widget builder(
    BuildContext context,
    ListedCoinsViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: const Color(0xFF1C2127),
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
          "All Listed Coins",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: viewModel.allCoins.length,
        itemBuilder: (context, index) {
          final coin = viewModel.allCoins[index];
          return CryptoCard(
            name: coin['name'],
            symbol: coin['symbol'].toUpperCase(),
            price: "\$${coin['current_price']}",
            changePercentage:
                "${coin['price_change_percentage_24h'].toStringAsFixed(2)}%",
            iconUrl: coin['icon'],
            avatarColor: const Color(0xFF2A2F38),
          );
        },
      ),
    );
  }

  @override
  ListedCoinsViewModel viewModelBuilder(BuildContext context) =>
      ListedCoinsViewModel();
}

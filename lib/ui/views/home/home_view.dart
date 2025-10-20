import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import '../dashboard/dashboard_view.dart';
import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: getViewForIndex(viewModel.currentIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E1E),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            // Bottom nav bar background and items
            SizedBox(
              height: 105,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    svgAsset: 'assets/icons/home.svg',
                    label: 'Home',
                    isSelected: viewModel.currentIndex == 0,
                    onTap: () => viewModel.updateIndex(0),
                    showBadge: true,
                  ),
                  _buildNavItem(
                    svgAsset: 'assets/icons/wallet.svg',
                    label: 'Wallet',
                    isSelected: viewModel.currentIndex == 1,
                    onTap: () => viewModel.updateIndex(1),
                  ),
                  const SizedBox(width: 50),
                  _buildNavItem(
                    svgAsset: 'assets/icons/transactions.svg',
                    label: 'History',
                    isSelected: viewModel.currentIndex == 2,
                    onTap: () => viewModel.updateIndex(2),
                  ),
                  _buildNavItem(
                    svgAsset: 'assets/icons/profile_trade.svg',
                    label: 'Profile',
                    isSelected: viewModel.currentIndex == 3,
                    onTap: () => viewModel.updateIndex(3),
                  ),
                ],
              ),
            ),

            // Center Floating Action Button
            Positioned(
              top: 20,
              child: GestureDetector(
                onTap: viewModel.onCenterButtonTap,
                child: SvgPicture.asset(
                  'assets/icons/close_menu.svg',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String svgAsset,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
    bool showBadge = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              SvgPicture.asset(
                svgAsset,
                color: isSelected ? Colors.white : Colors.grey,
                width: 26,
                height: 26,
              ),
              if (showBadge)
                const Positioned(
                  right: -2,
                  top: -2,
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.orange,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const DashboardView();
      case 1:
        return const Center(child: Text("Wallet Screen"));
      case 2:
        return const Center(child: Text("History Screen"));
      case 3:
        return const Center(child: Text("Profile Screen"));
      default:
        return const Center(child: Text("Home Screen"));
    }
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}

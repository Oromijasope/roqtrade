import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'trading_pairs.dart';

class TradingStatistics extends StatelessWidget {
  final String selectedTimeRange;
  final String averageROI;
  final String winRates;
  final String totalProfit;
  final String averageLosses;
  final String totalTrades;

  final String averageROIIcon;
  final String winRatesIcon;
  final String totalProfitIcon;
  final String averageLossesIcon;
  final String totalTradesIcon;

  const TradingStatistics({
    Key? key,
    required this.selectedTimeRange,
    required this.averageROI,
    required this.winRates,
    required this.totalProfit,
    required this.averageLosses,
    required this.totalTrades,
    required this.averageROIIcon,
    required this.winRatesIcon,
    required this.totalProfitIcon,
    required this.averageLossesIcon,
    required this.totalTradesIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF20252B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Trading statistics',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                DropdownButton<String>(
                  value: selectedTimeRange,
                  onChanged: (String? newValue) {},
                  items: <String>['7 days', '30 days', '60 days', '90 days']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  dropdownColor: const Color(0xFF20252B),
                  iconEnabledColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildStatisticRow('Average ROI', '$averageROI%', averageROIIcon,
                const Color(0xFFF7931A), const Color(0xFF17B26A)),
            const SizedBox(height: 16),
            _buildStatisticRow('Win rates', '$winRates%', winRatesIcon,
                const Color(0xFFF7931A)),
            const SizedBox(height: 16),
            _buildStatisticRow('Total profit', '$totalProfit USDT',
                totalProfitIcon, const Color(0xFFF7931A)),
            const SizedBox(height: 16),
            _buildStatisticRow(
                'Average losses',
                '$averageLosses USDT',
                averageLossesIcon,
                const Color(0xFFF7931A),
                const Color(0xFFF04438)),
            const SizedBox(height: 16),
            _buildStatisticRow('Total trades', totalTrades, totalTradesIcon,
                const Color(0xFFF7931A)),
            const SizedBox(
              height: 20,
            ),
            const TradingPairs(
              tradingPairs: [
                'BTCUSDT',
                'ETHUSDT',
                'XRPUSDT',
                'TIAUSDT',
                'DOGEUSDT',
                'PERPUSDT',
                'TIAUSDT',
                'DOGEUSDT',
                'PERPUSDT',
                'TIAUSDT',
                'DOGEUSDT',
                'PERPUSDT',
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticRow(
    String label,
    String value,
    String iconPath,
    Color iconColor, [
    Color? textColor,
  ]) {
    final isNetworkIcon = iconPath.startsWith('http');

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  backgroundColor: iconColor,
                  child: isNetworkIcon
                      ? ClipOval(
                          child: Image.network(
                            iconPath,
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        )
                      : SvgPicture.asset(iconPath, width: 20, height: 20),
                ),
                Positioned(
                  bottom: -4,
                  right: -4,
                  child: SvgPicture.asset('assets/icons/u_arrow_right.svg'),
                ),
              ],
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFFA7B1BC),
              ),
            ),
          ],
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: textColor ?? Colors.white,
          ),
        ),
      ],
    );
  }
}

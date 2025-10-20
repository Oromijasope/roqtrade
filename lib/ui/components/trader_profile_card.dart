import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common/ui_helpers.dart';
import 'mini_performance_chart.dart';

class TraderProfileCard extends StatelessWidget {
  final String traderName;
  final String traderInitials;
  final String roi;
  final String pnl;
  final String winRate;
  final String aum;
  final String followers;
  final VoidCallback onCopy;

  const TraderProfileCard({
    Key? key,
    required this.traderName,
    required this.traderInitials,
    required this.roi,
    required this.pnl,
    required this.winRate,
    required this.aum,
    required this.followers,
    required this.onCopy,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFF20252B),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: SvgPicture.asset('assets/icons/layer_36.svg')),
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
                          followers,
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xFF85D1F0)),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: onCopy,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1C2127),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text("Copy"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(
              color: Color(0xFF262932),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoColumn("ROI", roi),
                    verticalSpaceSmall,
                    _buildHorizontalInfoColumn("Total PNL: ", pnl),
                  ],
                ),
                const MiniPerformanceChart(lineColor: Color(0xFF17B26A))
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildHorizontalInfoColumn("Win rate: ", winRate),
                _buildHorizontalInfoColumn("AUM: ", aum),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white70,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF17B26A),
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalInfoColumn(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white70,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqtrade/ui/common/ui_helpers.dart';

class TraderCertificationCard extends StatelessWidget {
  final String traderLabel;
  final String highWinRateText;
  final String greatRiskControlText;
  final String verifiedText;
  final String winRateIcon;
  final String riskControlIcon;

  const TraderCertificationCard({
    Key? key,
    required this.traderLabel,
    required this.highWinRateText,
    required this.greatRiskControlText,
    required this.verifiedText,
    required this.winRateIcon,
    required this.riskControlIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color(0xFF20252B),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  traderLabel,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/verified_icon.svg',
                      color: Colors.white,
                      height: 20,
                    ),
                    verticalSpaceSmall,
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/V.svg',
                        ),
                        SvgPicture.asset(
                          'assets/icons/E.svg',
                        ),
                        SvgPicture.asset(
                          'assets/icons/R.svg',
                        ),
                        SvgPicture.asset(
                          'assets/icons/I.svg',
                        ),
                        SvgPicture.asset(
                          'assets/icons/F.svg',
                        ),
                        SvgPicture.asset(
                          'assets/icons/I.svg',
                        ),
                        SvgPicture.asset(
                          'assets/icons/E.svg',
                        ),
                        SvgPicture.asset(
                          'assets/icons/D.svg',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildBadge(
                    highWinRateText,
                    winRateIcon,
                    const Color(0xFF17B26A).withOpacity(0.08),
                    const Color(0xFF17B26A)),
                const SizedBox(
                  width: 8,
                ),
                _buildBadge(greatRiskControlText, riskControlIcon,
                    Colors.orange, const Color(0xFFF79009))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(String text, String icon, Color color, Color textcolor) {
    return Container(
      height: 22,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            color: color,
            height: 16,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textcolor,
            ),
          ),
        ],
      ),
    );
  }
}

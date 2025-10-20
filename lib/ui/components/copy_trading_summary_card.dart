import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CopyTradingSummaryCard extends StatelessWidget {
  const CopyTradingSummaryCard({
    super.key,
    required this.assets,
    required this.netProfit,
    required this.todaysPnl,
    this.currency = 'USD',
    this.locale,
  });

  final double assets;
  final double netProfit;
  final double todaysPnl;
  final String currency;
  final String? locale;

  @override
  Widget build(BuildContext context) {
    const card = Color(0xFF20252B);
    const divider = Color(0xFF2B2F36);
    const label = Colors.white70;

    final fmt = NumberFormat.simpleCurrency(
      name: currency,
      locale: locale,
      decimalDigits: 2,
    );

    final isPositive = todaysPnl >= 0;
    final pnlColor =
        isPositive ? const Color(0xFF17B26A) : const Color(0xFFE5484D);
    final pnlIcon =
        isPositive ? Icons.trending_up_rounded : Icons.trending_down_rounded;

    return Container(
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Copy trading assets',
                  style: TextStyle(color: label, fontSize: 13)),
              Text(
                fmt.format(assets),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          const Divider(height: 1, color: divider),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Net profit',
                        style: TextStyle(color: label, fontSize: 13)),
                    const SizedBox(height: 6),
                    Text(
                      fmt.format(netProfit),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text("Today's PNL",
                      style: TextStyle(color: label, fontSize: 13)),
                  const SizedBox(height: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: pnlColor.withOpacity(.12),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(pnlIcon, color: pnlColor, size: 18),
                        const SizedBox(width: 6),
                        Text(
                          NumberFormat('#,##0.##').format(todaysPnl),
                          style: TextStyle(
                            color: pnlColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

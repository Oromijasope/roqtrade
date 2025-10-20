import 'package:flutter/material.dart';

class TradingPairs extends StatelessWidget {
  final List<String> tradingPairs;

  const TradingPairs({
    Key? key,
    required this.tradingPairs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF262932),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Trading Pairs',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              mainAxisExtent: 36,
            ),
            itemCount: tradingPairs.length,
            itemBuilder: (context, index) {
              return _buildTradingPairButton(tradingPairs[index]);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildTradingPairButton(String pair) {
    return ElevatedButton(
      onPressed: () {
        debugPrint('Selected: $pair');
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF262932),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        pair,
        style: const TextStyle(
          fontSize: 14,
          color: Color(0xFFA7B1BC),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

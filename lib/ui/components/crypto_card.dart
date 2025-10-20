import 'package:flutter/material.dart';

class CryptoCard extends StatelessWidget {
  final String name;
  final String symbol;
  final String price;
  final String changePercentage;
  final Color avatarColor;
  final String iconUrl;

  const CryptoCard({
    super.key,
    required this.name,
    required this.symbol,
    required this.price,
    required this.changePercentage,
    required this.avatarColor,
    required this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    double numericChange = double.tryParse(
          changePercentage.replaceAll('%', '').replaceAll('+', ''),
        ) ??
        0.0;

    Color changeColor = numericChange < 0 ? Colors.red : Colors.green;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF20252B),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: avatarColor,
              radius: 24,
              child: iconUrl.isNotEmpty
                  ? Image.network(
                      iconUrl,
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    )
                  : const Icon(Icons.error),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        symbol,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                      ),
                      Text(
                        changePercentage,
                        style: TextStyle(
                          fontSize: 14,
                          color: changeColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

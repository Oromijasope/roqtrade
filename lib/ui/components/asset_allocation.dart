import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class AssetAllocationComponent extends StatelessWidget {
  const AssetAllocationComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF20252B),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Assets allocation",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                DropdownButton<String>(
                  value: '7 days',
                  onChanged: (String? newValue) {},
                  items: <String>['7 days', '30 days', '60 days', '90 days']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(color: Colors.white)),
                    );
                  }).toList(),
                  dropdownColor: const Color(0xFF20252B),
                  iconEnabledColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Center(
              child: CircularPercentIndicator(
                radius: 120.0,
                lineWidth: 12.0,
                animation: true,
                animationDuration: 1500,
                percent: 1.0,
                center: const Text(
                  "BTCUSDT\n100.00%",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.orange,
                backgroundColor: const Color(0xFF262932),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CopyTradingCard extends StatelessWidget {
  final VoidCallback? onTap;

  const CopyTradingCard({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade200, Colors.green.shade100],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.only(left: 16, bottom: 16, top: 16),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Copy Trading',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Discover our latest feature. Follow and watch the PRO traders closely and win like a PRO! We are rooting for you!',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                SvgPicture.asset('assets/images/crown.svg'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

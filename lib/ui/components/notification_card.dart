import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String iconPath;
  final String? badgeText;
  final Color? badgeColor;
  final double width;
  final double height;
  final double iconSize;

  const NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.iconPath,
    this.badgeText,
    this.badgeColor,
    this.width = 312,
    this.height = 74,
    this.iconSize = 32,
  });

  bool get hasBadge => badgeText != null && badgeText!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: SizedBox(
        width: width,
        height: height,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF20252B),
              borderRadius: BorderRadius.circular(15),
            ),
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (hasBadge)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: badgeColor ?? const Color(0x14A7B1BC),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          badgeText!,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFF04438),
                          ),
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.only(top: hasBadge ? 0 : 28),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        iconPath,
                        width: iconSize,
                        height: iconSize,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              message,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

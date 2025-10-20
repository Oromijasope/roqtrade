import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:roqtrade/ui/common/ui_helpers.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;
  final VoidCallback onTap;
  final bool isFirstCard;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.description,
    required this.iconPath,
    required this.onTap,
    this.isFirstCard = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170,
        height: 140,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: isFirstCard
              ? const LinearGradient(
                  colors: [
                    Color(0xFFABE2F3),
                    Color(0xFFBDE4E5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [
                    Color(0xFFC0CFFE),
                    Color(0xFFF3DFF4),
                    Color(0xFFF9D8E5),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: const Color(0xFF2A2F36),
                        child: SvgPicture.asset(
                          iconPath,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1C2127),
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  description,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.black54,
                                  ),
                                ),
                                horizontalSpaceLarge,
                                SvgPicture.asset(
                                    'assets/icons/u_angle_right.svg')
                              ],
                            ),
                          ],
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
    );
  }
}

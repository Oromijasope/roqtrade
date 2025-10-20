import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopBarComponent extends StatelessWidget {
  final VoidCallback onSearchTap;
  final VoidCallback onSupportTap;
  final VoidCallback onNotificationTap;
  final bool showNotificationDot;

  const TopBarComponent({
    Key? key,
    required this.onSearchTap,
    required this.onSupportTap,
    required this.onNotificationTap,
    this.showNotificationDot = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                const Text(
                  "Crypto",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF1C2127),
                  ),
                ),
                const SizedBox(width: 8),
                SvgPicture.asset('assets/icons/dropdown_icon.svg'),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: onSearchTap,
                icon: SvgPicture.asset('assets/icons/icon-Search.svg'),
              ),
              IconButton(
                onPressed: onSupportTap,
                icon: SvgPicture.asset('assets/icons/headphones.svg'),
              ),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  IconButton(
                    onPressed: onNotificationTap,
                    icon: SvgPicture.asset('assets/icons/notification.svg'),
                  ),
                  if (showNotificationDot)
                    const Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.red,
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0x1F767680),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    ClipOval(
                      child: SvgPicture.asset('assets/images/england_flag.svg'),
                    ),
                    const SizedBox(width: 4),
                    SvgPicture.asset('assets/icons/dropdown_icon.svg'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

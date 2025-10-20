import 'package:flutter/material.dart';

import 'notification_card.dart';

class NotificationCarousel extends StatefulWidget {
  final double height;
  final List<NotificationCard> notifications;

  const NotificationCarousel({
    Key? key,
    this.height = 120,
    required this.notifications,
  }) : super(key: key);

  @override
  State<NotificationCarousel> createState() => _NotificationCarouselState();
}

class _NotificationCarouselState extends State<NotificationCarousel> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView(
            controller: _controller,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: widget.notifications,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            widget.notifications.length,
            (index) => AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: _currentPage == index
                    ? const Color(0xFFA7B1BC)
                    : const Color(0xFF2A2F36),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

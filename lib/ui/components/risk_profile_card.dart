import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RiskProfileCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onTap;
  final bool isSelected;

  const RiskProfileCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF262932),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFF85D1F0)
                    : const Color(0xFF262932),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFA7B1BC),
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Positioned(
              top: -8,
              right: -8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Color(0xFF85D1F0),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset('assets/icons/u_check.svg'),
              ),
            ),
        ],
      ),
    );
  }
}

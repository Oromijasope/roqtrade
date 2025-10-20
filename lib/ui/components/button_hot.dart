import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonHot extends StatefulWidget {
  final String label;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final double? elevation;
  final bool isDisabled;
  final FontWeight? fontWeight;
  final Color? textColor;
  final Gradient? gradient;
  final Color? color;

  const ButtonHot({
    Key? key,
    required this.label,
    required this.onPressed,
    required this.isDisabled,
    this.width,
    this.height,
    this.elevation,
    this.fontWeight,
    this.textColor,
    this.gradient,
    this.color,
  }) : super(key: key);

  @override
  State<ButtonHot> createState() => _ButtonHotState();
}

class _ButtonHotState extends State<ButtonHot> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    const defaultGradient = LinearGradient(
      colors: [
        Color(0xFF483BEB),
        Color(0xFF7847E1),
        Color(0xFFDD568D),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    const disabledGradient = LinearGradient(
      colors: [
        Color(0xFFB8B8B8),
        Color(0xFFA0A0A0),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final textColor =
        widget.textColor ?? (isDarkMode ? Colors.white : Colors.white);

    return SizedBox(
      width: widget.width,
      child: Material(
        elevation: widget.elevation ?? 2,
        borderRadius: BorderRadius.circular(8.0),
        child: Ink(
          decoration: BoxDecoration(
            gradient: widget.isDisabled
                ? disabledGradient
                : widget.gradient ?? defaultGradient,
            color: widget.isDisabled ? null : widget.color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            onTap: widget.isDisabled ? null : widget.onPressed,
            child: Container(
              alignment: Alignment.center,
              height: widget.height ?? 52,
              child: Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                  letterSpacing: 0.5,
                  fontWeight: widget.fontWeight ?? FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

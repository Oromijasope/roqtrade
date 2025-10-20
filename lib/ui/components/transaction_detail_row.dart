import 'package:flutter/material.dart';

class TransactionDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;

  const TransactionDetailRow({
    Key? key,
    required this.label,
    required this.value,
    this.labelStyle,
    this.valueStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: labelStyle ??
              const TextStyle(
                fontSize: 12,
                color: Color(0xFFA7B1BC),
                fontWeight: FontWeight.w400,
              ),
        ),
        Text(
          value,
          style: valueStyle ??
              const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}

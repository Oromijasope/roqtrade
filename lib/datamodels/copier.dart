import 'package:flutter/material.dart';

class Copier {
  final String name;
  final String totalVolume;
  final String tradingProfit;
  final VoidCallback? onTap;

  const Copier({
    required this.name,
    required this.totalVolume,
    required this.tradingProfit,
    this.onTap,
  });
}

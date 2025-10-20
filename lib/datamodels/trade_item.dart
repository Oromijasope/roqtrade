class TradeItem {
  final String pair;
  final String leverage;
  final double roi;
  final String entryPrice;
  final String? marketPrice;
  final int copiers;
  final String copiersAmount;
  final String entryTime;
  final String? exitPrice;
  final String? exitTime;
  final String? logoUrl;

  const TradeItem({
    required this.pair,
    required this.leverage,
    required this.roi,
    required this.entryPrice,
    this.marketPrice,
    required this.copiers,
    required this.copiersAmount,
    required this.entryTime,
    this.exitPrice,
    this.exitTime,
    this.logoUrl,
  });
}

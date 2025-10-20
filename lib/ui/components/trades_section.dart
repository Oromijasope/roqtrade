import 'package:flutter/material.dart';

import '../../datamodels/trade_item.dart';

class TradesSection extends StatelessWidget {
  const TradesSection({
    super.key,
    this.current = const [],
    this.history = const [],
  });

  final List<TradeItem> current;
  final List<TradeItem> history;

  @override
  Widget build(BuildContext context) {
    const card = Color(0xFF20252B);
    const surface = Color(0xFF262B31);
    const stroke = Color(0xFF2B2F36);

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 6),
            child: Builder(
              builder: (ctx) {
                final controller = DefaultTabController.of(ctx);
                return AnimatedBuilder(
                  animation: controller.animation!,
                  builder: (_, __) {
                    final isHistory = controller.index == 1;
                    return Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: card,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: stroke),
                            ),
                            padding: const EdgeInsets.all(4),
                            child: TabBar(
                              padding: EdgeInsets.zero,
                              labelPadding:
                                  const EdgeInsets.symmetric(vertical: 8),
                              indicator: BoxDecoration(
                                color: surface,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              dividerColor: Colors.transparent,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.white70,
                              labelStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                              tabs: const [
                                Tab(text: 'Current trades'),
                                Tab(text: 'History'),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (isHistory) ...[
                              const SizedBox(width: 8),
                              _DaysPill(label: '7 days', onTap: () {}),
                            ],
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                _TradesList(items: current),
                _TradesList(items: history),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DaysPill extends StatelessWidget {
  const _DaysPill({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const pillBg = Color(0xFF262B31);
    const stroke = Color(0xFF2B2F36);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: pillBg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: stroke),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label,
                style: const TextStyle(color: Colors.white, fontSize: 13)),
            const SizedBox(width: 6),
            const Icon(Icons.keyboard_arrow_down_rounded,
                size: 18, color: Colors.white70),
          ],
        ),
      ),
    );
  }
}

class _TradesList extends StatelessWidget {
  const _TradesList({required this.items});
  final List<TradeItem> items;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text('No trades', style: TextStyle(color: Colors.white54)),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, i) => TradeCard(item: items[i]),
    );
  }
}

class TradeCard extends StatelessWidget {
  const TradeCard({super.key, required this.item});
  final TradeItem item;

  @override
  Widget build(BuildContext context) {
    const card = Color(0xFF20252B);
    const rowDivider = Color(0xFF2B2F36);
    final isHistory = item.exitPrice != null || item.exitTime != null;

    return Container(
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: rowDivider.withOpacity(.5)),
      ),
      padding: const EdgeInsets.all(14),
      child: Column(
        children: [
          Row(
            children: [
              _coinBadge(),
              const SizedBox(width: 8),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: item.pair,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      const TextSpan(
                          text: '  –  ',
                          style: TextStyle(color: Color(0xFFA7B1BC))),
                      TextSpan(
                        text: item.leverage,
                        style: const TextStyle(color: Color(0xFF85D1F0)),
                      ),
                    ],
                  ),
                ),
              ),
              _roiPill(item.roi),
            ],
          ),
          const SizedBox(height: 12),
          const Divider(height: 1, color: rowDivider),
          const SizedBox(height: 12),
          _infoRow('Entry price', '${item.entryPrice} USDT'),
          if (!isHistory && item.marketPrice != null)
            _infoRow('Market price', '${item.marketPrice} USDT'),
          if (isHistory && item.exitPrice != null)
            _infoRow('Exit price', '${item.exitPrice} USDT'),
          _infoRow('Copiers', '${item.copiers}'),
          _infoRow('Copiers amount', '${item.copiersAmount} USDT'),
          _infoRow('Entry time', item.entryTime),
          if (isHistory && item.exitTime != null)
            _infoRow('Exit time', item.exitTime!),
        ],
      ),
    );
  }

  Widget _coinBadge() {
    if (item.logoUrl != null && item.logoUrl!.isNotEmpty) {
      return ClipOval(
        child: Image.network(
          item.logoUrl!,
          width: 22,
          height: 22,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _fallbackBadge(),
        ),
      );
    }
    return _fallbackBadge();
  }

  Widget _fallbackBadge() => Container(
        width: 22,
        height: 22,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFF8A00),
        ),
        alignment: Alignment.center,
        child: const Text(
          '₿',
          style: TextStyle(color: Colors.white, fontSize: 12, height: 1),
        ),
      );

  Widget _roiPill(double roi) {
    final isPositive = roi >= 0;
    final color =
        isPositive ? const Color(0xFF17B26A) : const Color(0xFFE5484D);
    return Text(
      '${isPositive ? '+' : ''}${roi.toStringAsFixed(2)}% ROI',
      style: TextStyle(color: color, fontWeight: FontWeight.w600, fontSize: 12),
    );
  }

  Widget _infoRow(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(label,
                  style: const TextStyle(color: Colors.white70, fontSize: 13)),
            ),
            Text(value,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      );
}

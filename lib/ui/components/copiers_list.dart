import 'package:flutter/material.dart';

import '../../datamodels/copier.dart';

class CopiersList extends StatelessWidget {
  const CopiersList({
    super.key,
    required this.copiers,
    this.onSearchChanged,
  });

  final List<Copier> copiers;
  final ValueChanged<String>? onSearchChanged;

  @override
  Widget build(BuildContext context) {
    const bg = Color(0xFF1C2127);
    const card = Color(0xFF20252B);
    const input = Color(0xFF262B31);
    const stroke = Color(0xFF2B2F36);

    return Container(
      color: bg,
      child: Column(
        children: [
          // Search
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 10),
            child: TextField(
              onChanged: onSearchChanged,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white70,
              decoration: InputDecoration(
                // hintText: 'Search for copiers',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: input,
                prefixIcon: const Icon(Icons.search, color: Colors.white60),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: stroke),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: stroke),
                ),
              ),
            ),
          ),

          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: card,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: stroke),
              ),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 6),
                itemCount: copiers.length,
                separatorBuilder: (_, __) =>
                    const Divider(height: 1, color: stroke),
                itemBuilder: (_, i) => _CopierRow(copier: copiers[i]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CopierRow extends StatelessWidget {
  const _CopierRow({required this.copier});
  final Copier copier;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: copier.onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _InitialAvatar(
                  initials: _initials(copier.name),
                  color: _ringColor(copier.name),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    copier.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _StatBlock(
                    label: 'Total volume',
                    value: copier.totalVolume,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _StatBlock(
                    alignRight: true,
                    label: 'Trading profit',
                    value: copier.tradingProfit,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.isEmpty) return '';
    if (parts.length == 1) {
      return parts.first.characters.take(2).toString().toUpperCase();
    }
    return (parts.first.characters.first + parts.last.characters.first)
        .toUpperCase();
  }

  static Color _ringColor(String seed) {
    final v = seed.codeUnits.fold<int>(0, (a, b) => (a + b) & 0xFF);
    const palette = [
      Color(0xFF4FC3F7),
      Color(0xFFFFD54F),
      Color(0xFF81C784),
      Color(0xFFBA68C8),
      Color(0xFFFF8A65),
      Color(0xFF64B5F6),
      Color(0xFFFFB74D),
      Color(0xFFA5D6A7),
    ];
    return palette[v % palette.length];
  }
}

class _InitialAvatar extends StatelessWidget {
  const _InitialAvatar({required this.initials, required this.color});
  final String initials;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 38,
      height: 38,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(.15),
        border: Border.all(color: color, width: 1.5),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _StatBlock extends StatelessWidget {
  const _StatBlock({
    required this.label,
    required this.value,
    this.alignRight = false,
  });

  final String label;
  final String value;
  final bool alignRight;

  @override
  Widget build(BuildContext context) {
    final align = alignRight ? TextAlign.right : TextAlign.left;
    return Column(
      crossAxisAlignment:
          alignRight ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(label,
            textAlign: align,
            style: const TextStyle(color: Colors.white60, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          '$value USDT',
          textAlign: align,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w800,
            letterSpacing: .2,
          ),
        ),
      ],
    );
  }
}

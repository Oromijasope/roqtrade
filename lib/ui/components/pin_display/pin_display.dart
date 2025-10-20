import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

import 'pin_display_model.dart';

class PinDisplay extends StackedView<PinDisplayModel> {
  const PinDisplay({super.key, required this.getPinLabelStatus});

  final Function(int) getPinLabelStatus;

  @override
  Widget builder(
    BuildContext context,
    PinDisplayModel viewModel,
    Widget? child,
  ) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFF20252B),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(6, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                  color: getPinLabelStatus(index + 1),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  @override
  PinDisplayModel viewModelBuilder(BuildContext context) => PinDisplayModel();
}

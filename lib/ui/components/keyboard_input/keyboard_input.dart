import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked/stacked.dart';

import 'keyboard_input_model.dart';

class KeyboardInput extends StackedView<KeyboardInputModel> {
  const KeyboardInput({
    super.key,
    required this.updatePinLabel,
  });

  final Function(String) updatePinLabel;

  @override
  Widget builder(
    BuildContext context,
    KeyboardInputModel viewModel,
    Widget? child,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => updatePinLabel('1'),
                behavior: HitTestBehavior.translucent,
                child: const Text(
                  '1',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => updatePinLabel('2'),
                behavior: HitTestBehavior.translucent,
                child: const Text(
                  '2',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () => updatePinLabel('3'),
                  behavior: HitTestBehavior.translucent,
                  child: const Text(
                    '3',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 64,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () => updatePinLabel('4'),
                  behavior: HitTestBehavior.translucent,
                  child: const Text(
                    '4',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () => updatePinLabel('5'),
                  behavior: HitTestBehavior.translucent,
                  child: const Text(
                    '5',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () => updatePinLabel('6'),
                  behavior: HitTestBehavior.translucent,
                  child: const Text(
                    '6',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 64,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => updatePinLabel('7'),
                  child: const Text(
                    '7',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => updatePinLabel('8'),
                  child: const Text(
                    '8',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => updatePinLabel('9'),
                  child: const Text(
                    '9',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 64,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => updatePinLabel('.'),
                  child: const Text(
                    '.',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => updatePinLabel('0'),
                  child: const Text(
                    '0',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => updatePinLabel('-1'),
                  child: SvgPicture.asset(
                    'assets/icons/u_arrow_left.svg',
                    width: 22,
                    height: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  KeyboardInputModel viewModelBuilder(
    BuildContext context,
  ) =>
      KeyboardInputModel();
}

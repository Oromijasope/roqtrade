import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      "assets/lottie/Loading.json",
      width: 65,
      height: 65,
      alignment: Alignment.center,
    );
  }
}

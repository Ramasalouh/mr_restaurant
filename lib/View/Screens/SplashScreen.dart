import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// Ward Khadour
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  static const String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset(
            opacity: const AlwaysStoppedAnimation(.9),
            'assets/Screenshot (48).png',
            fit: BoxFit.fitHeight,
          )),
          Positioned.fill(
              child: BackdropFilter(
                  child: SizedBox(),
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3))),
          Center(
              child: Lottie.asset(
                  delegates: LottieDelegates(
                    values: [
                      ValueDelegate.colorFilter(
                        ['Layer 3 Outlines', '**'],
                        value: ColorFilter.mode(
                            Colors.indigo.shade200, BlendMode.src),
                      ),
                      ValueDelegate.colorFilter(
                        ['Layer 2 Outlines', '**'],
                        value: ColorFilter.mode(
                            Colors.indigo.shade300, BlendMode.src),
                      ),
                    ],
                  ),
                  'assets/json/111524-restaurant-rating-animation.json')),
        ],
      ),
    );
  }
}

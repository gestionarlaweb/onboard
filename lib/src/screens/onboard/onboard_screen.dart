import 'package:dot/src/screens/onboard/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/bottom_controls.dart';
import 'widgets/onboard_slider.dart';

class OnBoardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OnboardController>(
      //create: (_) => OnboardController(),
      create: (_) {
        final controller = OnboardController();
        // Así sabemos si la página ha sido renderizada
        // para llamar a la función .cambiosLayout();
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          controller.cambiosLayout();
        });
        return controller;
      },
      builder: (_, __) => Scaffold(
        body: SafeArea(
            child: Container(
          width: double.infinity,
          child: Column(
            children: [
              OnboardSlider(),
              BottomControls(),
            ],
          ),
        )),
      ),
    );
  }
}

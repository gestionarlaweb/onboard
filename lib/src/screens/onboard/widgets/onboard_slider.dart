import 'package:dot/src/data/models/onboard_item.dart';
import 'package:dot/src/screens/onboard/onboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class OnboardSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context, listen: false);
    return Expanded(
      child: PageView(
        // control de página para los dots
        controller: controller.pageController,
        children: List.generate(
          controller.items.length,
          (index) {
            final OnboardItem item = controller.items[index];
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Expanded(child: SvgPicture.asset(item.image)),
                  Text(
                    item.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    item.description,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:dot/src/routes/routes.dart';
import 'package:dot/src/screens/onboard/onboard_controller.dart';
import 'package:dot/src/utils/colors.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomControls extends StatelessWidget {
  const BottomControls({
    Key? key,
  }) : super(key: key);

  void _onNext(BuildContext context, OnboardController controller) {
    if (controller.currentPage == 2) {
      Navigator.pushReplacementNamed(context, Routes.WELCOME);
    } else {
      controller.pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.linear, // Tipo de animación
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _Dots(),
          // Consumer para cambiar el estado del texto boton
          Consumer<OnboardController>(
            builder: (_, controller, ___) {
              final double page = controller.currentPage;
              // Si estoy al final de las páginas
              bool isEnd = page % 1 == 0 && page == 2.0;
              return CupertinoButton(
                onPressed: () {
                  this._onNext(context, controller);
                },
                child: Text(isEnd ? 'Emepzar' : 'Next'),
                color: primaryColor,
                borderRadius: BorderRadius.circular(30),
              );
            },
          )
        ],
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<OnboardController>(context);
    return DotsIndicator(
      dotsCount: controller.items.length,
      position: controller.currentPage,
      decorator: DotsDecorator(
        size: const Size.square(9.0),
        activeSize: const Size(18.0, 9.0),
        color: Colors.grey.withOpacity(0.4),
        activeColor: primaryColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}

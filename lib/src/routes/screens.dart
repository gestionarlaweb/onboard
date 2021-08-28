import 'package:dot/src/routes/routes.dart';
import 'package:dot/src/screens/onboard/onboard_screen.dart';
import 'package:dot/src/screens/welcom/welcome_screen.dart';
import 'package:flutter/material.dart';

abstract class Screens {
  static const String INITIAL = Routes.ONBOARD;
  static final Map<String, Widget Function(BuildContext)> routes = {
    Routes.ONBOARD: (context) => OnBoardScreen(),
    Routes.WELCOME: (context) => WelcomeScreen(),
  };
}

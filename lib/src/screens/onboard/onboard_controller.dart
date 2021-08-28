import 'package:dot/src/data/models/onboard_item.dart';
import 'package:flutter/material.dart';

class OnboardController extends ChangeNotifier {
  final List<OnboardItem> items = [
    OnboardItem(
      image: 'assets/screens/onboard/slider_1.svg',
      title: 'title 1',
      description:
          'Cupidatat fugiat qui id sint non proident mollit deserunt consectetur elit ut pariatur.',
    ),
    OnboardItem(
      image: 'assets/screens/onboard/slider_2.svg',
      title: 'title 2',
      description:
          'Cupidatat fugiat qui id sint non proident mollit deserunt consectetur elit ut pariatur.',
    ),
    OnboardItem(
      image: 'assets/screens/onboard/slider_3.svg',
      title: 'title 3',
      description:
          'Cupidatat fugiat qui id sint non proident mollit deserunt consectetur elit ut pariatur.',
    ),
  ];

// Para controlar la página (dots)
  final PageController pageController = PageController();
  double _currentPage = 0;
  double get currentPage => _currentPage;

  void cambiosLayout() {
    // Escuchar lo cambios de nuestro PageView
    pageController.addListener(() {
      final double? page = pageController.page;
      _currentPage = page!;
      notifyListeners();
      print('page ${pageController.page}');
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}

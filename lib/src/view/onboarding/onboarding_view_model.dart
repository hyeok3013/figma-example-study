import 'package:figma_study/src/view/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:figma_study/src/model/onboarding.dart';

class OnboardingViewModel extends ChangeNotifier {
  PageController pageController = PageController();
  int currentPageIndex = 0;

  final List<Onboarding> onboardingPages = [
    Onboarding(
      image: Image.asset(
        'assets/images/onboarding1.png',
        alignment: const Alignment(0, -0.6),
      ),
      title: 'Explore Upcoming and Nearby Events',
      subtitle:
          'In publishing and graphic design, Lorem is a placeholder text commonly',
    ),
    Onboarding(
      image: Image.asset(
        'assets/images/onboarding2.png',
        alignment: const Alignment(0, -0.6),
      ),
      title: 'Web Have Modern Events Calendar Feature',
      subtitle:
          'In publishing and graphic design, Lorem is a placeholder text commonly',
    ),
    Onboarding(
      image: Image.asset(
        'assets/images/onboarding3.png',
        alignment: const Alignment(0, -0.6),
      ),
      title: 'To Look Up More Events or Activities Nearby By Map',
      subtitle:
          'In publishing and graphic design, Lorem is a placeholder text commonly',
    ),
  ];

  void onPageChanged(int index) {
    currentPageIndex = index;
    notifyListeners();
  }

  void completeOnboarding(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginView(), // 다음 페이지로 변경하세요.
      ),
    );
  }
}

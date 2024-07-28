import 'package:figma_study/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class OnboardingNavigation extends StatelessWidget {
  final void Function() completeOnboarding;
  final int onboardingCount;
  final int currentPageIndex;
  final PageController pageController;

  const OnboardingNavigation({
    super.key,
    required this.completeOnboarding,
    required this.onboardingCount,
    required this.currentPageIndex,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: completeOnboarding,
          child: Text(
            'Skip',
            style: context.typo.headline6.copyWith(
                color: context.color.hint, fontWeight: context.typo.semiBold),
          ),
        ),
        Row(
          children: List.generate(onboardingCount, (index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPageIndex == index
                      ? context.color.onPrimary
                      : context.color.hint),
            );
          }),
        ),
        TextButton(
          onPressed: () {
            currentPageIndex != onboardingCount - 1
                ? pageController.jumpToPage(currentPageIndex + 1)
                : completeOnboarding();
            print(currentPageIndex);
          },
          child: Text(
            currentPageIndex != onboardingCount - 1 ? 'Next' : 'Done',
            style: context.typo.headline6.copyWith(
                color: context.color.onPrimary,
                fontWeight: context.typo.semiBold),
          ),
        )
      ],
    );
  }
}

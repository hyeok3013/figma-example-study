import 'package:figma_study/src/view/onboarding/onboarding_view_model.dart';
import 'package:figma_study/src/view/onboarding/widget/onboarding_bottom_sheet.dart';
import 'package:figma_study/src/view/onboarding/widget/onboarding_navigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///1. SVG이미지가 안될 때 어떻게 하지?
///2. 페이지 에니메이션 추가
///3. 토글 에니메이션 추가
///4. 토글 눌렀을 때 화면 전환

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingViewModel(),
      child: Consumer<OnboardingViewModel>(
        builder: (BuildContext context, viewModel, Widget? child) => Scaffold(
          body: Stack(
            children: [
              PageView(
                controller: viewModel.pageController,
                children: viewModel.onboardingPages
                    .map((page) => page.image)
                    .toList(),
                onPageChanged: (index) => viewModel.onPageChanged(index),
              ),
              OnboardingBottomSheet(
                titleList: viewModel.onboardingPages
                    .map((page) => page.title)
                    .toList(),
                subtitleList: viewModel.onboardingPages
                    .map((page) => page.subtitle ?? '')
                    .toList(),
                currentPageIndex: viewModel.currentPageIndex,
                child: OnboardingNavigation(
                    completeOnboarding: () =>
                        viewModel.completeOnboarding(context),
                    onboardingCount: viewModel.onboardingPages.length,
                    currentPageIndex: viewModel.currentPageIndex,
                    pageController: viewModel.pageController),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:figma_study/src/service/theme_service.dart';
import 'package:flutter/material.dart';

class OnboardingBottomSheet extends StatelessWidget {
  final List<String> titleList;
  final List<String>? subtitleList;
  final Widget? child;
  final int currentPageIndex;

  const OnboardingBottomSheet({
    super.key,
    required this.titleList,
    this.subtitleList,
    this.child,
    required this.currentPageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: context.color.primary,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(48),
            topLeft: Radius.circular(48),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ///Title
                Text(
                  titleList[currentPageIndex],
                  style: context.typo.headline2.copyWith(
                      fontWeight: context.typo.semiBold,
                      color: context.color.onPrimary),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16,
                ),

                ///SubTitle
                if (subtitleList != null) ...[
                  Text(
                    subtitleList![currentPageIndex],
                    style: context.typo.subtitle2
                        .copyWith(color: context.color.onPrimary),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 43,
                  ),
                ],

                ///Navigator
                if (child != null) child!,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

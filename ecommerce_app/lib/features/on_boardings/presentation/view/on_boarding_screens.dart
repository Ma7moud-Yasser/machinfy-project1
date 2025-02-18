import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/features/on_boardings/presentation/component/onBoarding_widget.dart';
import 'package:ecommerce_app/features/on_boardings/presentation/component/skip_next_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: PaddingManager.main(context),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: PageView(
                  controller: pageController,
                  children: [
                    OnBoardingWidget(
                      imagePath: IconsAssets.onboarding1,
                      title: AppString.onBoardingTitle1,
                      subTitle: AppString.onBoardingSubTitle1,
                    ),
                    OnBoardingWidget(
                      imagePath: IconsAssets.onboarding2,
                      title: AppString.onBoardingTitle2,
                      subTitle: AppString.onBoardingSubTitle2,
                    ),
                    OnBoardingWidget(
                      imagePath: IconsAssets.onboarding3,
                      title: AppString.onBoardingTitle3,
                      subTitle: AppString.onBoardingSubTitle3,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: SkipNextIndicator(
                  pageController: pageController,
                  totalDots: 3,
                  onSkip: () {
                    pageController.jumpToPage(2);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

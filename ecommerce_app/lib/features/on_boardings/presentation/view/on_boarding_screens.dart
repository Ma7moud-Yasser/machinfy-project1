import 'package:ecommerce_app/core/components/custom_elevated_button.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/resources/route_manager.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/features/on_boardings/presentation/component/onBoarding_widget.dart';
import 'package:ecommerce_app/features/on_boardings/presentation/component/skip_next_indicator.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  final ValueNotifier<int> currentPage = ValueNotifier<int>(0);

  @override
  void dispose() {
    pageController.dispose();
    currentPage.dispose();
    super.dispose();
  }

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
                  onPageChanged: (index) => currentPage.value = index,
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
              ValueListenableBuilder<int>(
                valueListenable: currentPage,
                builder: (context, page, _) {
                  return page == 2
                      ? Expanded(
                        child: Column(
                          children: [
                            CustomElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.authScreens,
                                );
                              },
                              textButton: AppString.getStarted,
                            ),
                          ],
                        ),
                      )
                      : Expanded(
                        flex: 2,
                        child: SkipNextIndicator(
                          pageController: pageController,
                          totalDots: 3,
                          onSkip: () => pageController.jumpToPage(2),
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

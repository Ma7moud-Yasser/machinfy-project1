import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SkipNextIndicator extends StatelessWidget {
  final PageController pageController;
  final int totalDots;
  final VoidCallback onSkip;

  const SkipNextIndicator({
    super.key,
    required this.pageController,
    required this.totalDots,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onSkip,
          child: Text(
            'Skip',
            style: StyleManager.textStyle18(
              context,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SmoothPageIndicator(
          controller: pageController,
          count: totalDots,
          effect: WormEffect(
            dotColor: Theme.of(context).colorScheme.background,
            activeDotColor: Theme.of(context).colorScheme.primary,
            dotWidth: SizeManager.getSize(context).width * 0.025,
            dotHeight: SizeManager.getSize(context).height * 0.013,
          ),
        ),
        TextButton(
          onPressed: () {
            if (pageController.page! < totalDots - 1) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
          child: Text(
            'Next',
            style: StyleManager.textStyle18(
              context,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

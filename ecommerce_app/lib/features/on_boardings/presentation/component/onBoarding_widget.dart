import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
  });
  final String imagePath;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 15,
      children: [
        SvgPicture.asset(imagePath),
        Text(
          textAlign: TextAlign.center,
          title,
          style: StyleManager.textStyle20(
            context,
          ).copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          textAlign: TextAlign.center,
          subTitle,
          style: StyleManager.textStyle16(
            context,
          ).copyWith(color: Theme.of(context).colorScheme.outline),
        ),
      ],
    );
  }
}

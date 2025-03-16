import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';

class FeaturesTitle extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const FeaturesTitle({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.main(context).copyWith(
        top: SizeManager.getSize(context).height * 0.02,
        bottom: SizeManager.getSize(context).height * 0.02,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: StyleManager.textStyle22(context, FontWeight.w700),
          ),
          onTap != null
              ? GestureDetector(
                onTap: onTap,
                child: Text(
                  AppString.seeAll,
                  style: StyleManager.textStyle14(context, FontWeight.w400),
                ),
              )
              : SizedBox(),
        ],
      ),
    );
  }
}

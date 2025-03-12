import 'package:ecommerce_app/core/components/custom_text_form.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: PaddingManager.mainWithVertical(context),
          child: Column(
            children: [
              Row(
                spacing: SizeManager.getSize(context).width * 0.02,
                children: [
                  CircleAvatar(
                    radius: 25,
                    foregroundImage: AssetImage(ImagesAssets.user),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppString.welcome} Ahmed",
                        style: StyleManager.textStyle16(
                          context,
                          FontWeight.bold,
                        ),
                      ),
                      Text(
                        AppString.startOurShoping,
                        style: StyleManager.textStyle12(
                          context,
                        ).copyWith(color: AppColor.primary),
                      ),
                    ],
                  ),
                  Spacer(),
                  badges.Badge(
                    badgeContent: Text(
                      '4',
                      style: StyleManager.textStyle12(
                        context,
                        FontWeight.w600,
                      ).copyWith(color: AppColor.background),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        IconsAssets.compareIcon,
                        width: SizeManager.getSize(context).width * 0.06,
                      ),
                    ),
                  ),

                  badges.Badge(
                    badgeContent: Text(
                      '4',
                      style: StyleManager.textStyle12(
                        context,
                        FontWeight.w600,
                      ).copyWith(color: AppColor.background),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        IconsAssets.cart,
                        width: SizeManager.getSize(context).width * 0.06,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SizeManager.getSize(context).height * 0.01),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      fillColor: true,
                      filledColor: AppColor.lightGrey,
                      prefixIconPath: IconsAssets.search,
                      hintText: "Find everything you can imagine...",
                    ),
                  ),
                  SizedBox(width: SizeManager.getSize(context).width * 0.02),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        border: Border.all(color: AppColor.background),
                        borderRadius: BorderRadiusManager.small(context),
                      ),
                      padding: EdgeInsets.all(
                        SizeManager.getSize(context).width * 0.036,
                      ),
                      child: SvgPicture.asset(
                        IconsAssets.filterIcon,
                        width: SizeManager.getSize(context).width * 0.06,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

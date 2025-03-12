import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildCard(
  String imagePath,
  String title,
  String subtitle,
  BuildContext context,
) {
  return Stack(
    children: [
      ClipRRect(
        borderRadius: BorderRadiusManager.medium(context),

        child: Image.asset(
          height: SizeManager.getSize(context).height * 0.19,
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
      Positioned(
        bottom: 50,
        left: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: StyleManager.textStyle18(
                context,
                FontWeight.w500,
              ).copyWith(color: AppColor.white),
            ),
            SizedBox(height: 5),
            Text(
              subtitle,
              style: StyleManager.textStyle14(
                context,
                FontWeight.w500,
              ).copyWith(color: AppColor.white),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Row(
                spacing: 8,
                children: [
                  Text(
                    AppString.viewMore,
                    style: StyleManager.textStyle14(
                      context,
                      FontWeight.w500,
                    ).copyWith(color: AppColor.primary),
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: AppColor.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

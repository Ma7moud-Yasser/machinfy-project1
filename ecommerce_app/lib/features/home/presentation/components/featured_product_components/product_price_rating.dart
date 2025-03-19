import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildProductPriceAndRating(
  BuildContext context, {
  required String price,
  required String rating,
}) {
  return Row(
    children: [
      FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          "$price EGP",
          style: StyleManager.textStyle16(
            context,
            FontWeight.w700,
          ).copyWith(color: AppColor.secondary),
        ),
      ),
      const Spacer(),
      Row(
        children: [
          Text(
            rating,
            style: StyleManager.textStyle14(
              context,
              FontWeight.w500,
            ).copyWith(color: AppColor.primary),
          ),
          SvgPicture.asset(IconsAssets.starIcon),
        ],
      ),
    ],
  );
}

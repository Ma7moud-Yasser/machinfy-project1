import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentation/components/featured_product_components/build_product_image.dart';
import 'package:ecommerce_app/features/home/presentation/components/featured_product_components/product_price_rating.dart';
import 'package:ecommerce_app/features/home/presentation/components/featured_product_components/product_title.dart';
import 'package:flutter/material.dart';

Widget buildProductInfo(
  BuildContext context, {
  required String productImage,
  required String title,
  required String subtitle,
  required String price,
  required String rating,
}) {
  return Container(
    // width: SizeManager.getSize(context).width * 0.6,
    height: SizeManager.getSize(context).height * 0.3,
    padding: PaddingManager.smallAll(context),
    decoration: BoxDecoration(
      color: AppColor.lightGrey,
      borderRadius: BorderRadiusManager.custom(
        topLeft: 20,
        topRight: 20,
        context: context,
      ),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildProductImage(context, productImage: productImage),
        SizedBox(height: SizeManager.getSize(context).height * 0.01),
        Padding(
          padding: PaddingManager.smallSymmetricHorizontal(context),
          child: Column(
            spacing: 2,
            children: [
              buildProductTitle(context, title: title),

              buildProductSubtitle(context, subtitle: subtitle),
              buildProductPriceAndRating(context, price: price, rating: rating),
            ],
          ),
        ),
      ],
    ),
  );
}

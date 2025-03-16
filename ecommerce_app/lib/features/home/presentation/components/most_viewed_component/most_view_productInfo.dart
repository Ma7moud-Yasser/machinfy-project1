import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/features/home/presentation/components/featured_product_components/product_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildMostViewedProductInfo(
  BuildContext context, {
  required String productImage,
  required String title,

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
    child: Stack(
      children: [
        Container(
          padding: PaddingManager.mediumSymmetricHorizontal(context),
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadiusManager.medium(context),
          ),
          child: CachedNetworkImage(
            width: SizeManager.getSize(context).width * 0.4,
            height: SizeManager.getSize(context).height * 0.18,
            imageUrl: productImage,
            fit: BoxFit.fitWidth,
            placeholder:
                (context, url) =>
                    const Center(child: CircularProgressIndicator()),
            errorWidget:
                (context, url, error) =>
                    Image.asset(ImagesAssets.notFoundImage),
          ),
        ),
        Positioned(
          bottom: 200,
          right: -5,
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite_outline_sharp,
              color: AppColor.primary,
              size: SizeManager.getSize(context).width * 0.06,
            ),
          ),
        ),
        Positioned(
          bottom: 1,
          left: 0,
          right: 0,
          child: Column(
            spacing: 2,
            children: [
              buildProductTitle(context, title: title),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
              Text(
                "$price EGP",
                style: StyleManager.textStyle16(
                  context,
                  FontWeight.w700,
                ).copyWith(color: AppColor.primary),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

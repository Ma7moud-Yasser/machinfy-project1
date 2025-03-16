import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildProductImage(BuildContext context, {required String productImage}) {
  return Stack(
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
              (context, url, error) => Image.asset(ImagesAssets.notFoundImage),
        ),
      ),
      Positioned(
        bottom: 118,
        right: -5,
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_outline_sharp,
            color: AppColor.secondary,
            size: SizeManager.getSize(context).width * 0.06,
          ),
        ),
      ),

      Positioned(
        bottom: 122,
        left: 7,
        child: SvgPicture.asset(
          IconsAssets.qualityBadgeIcon,
          width: SizeManager.getSize(context).width * 0.05,
        ),
      ),
    ],
  );
}

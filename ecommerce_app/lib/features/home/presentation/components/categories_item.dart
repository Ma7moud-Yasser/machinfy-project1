import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';

class CategoriesItems extends StatelessWidget {
  const CategoriesItems({
    super.key,
    required this.imagePath,
    required this.categoryName,
  });
  final String imagePath;
  final String categoryName;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        CircleAvatar(
          radius: SizeManager.getSize(context).width * 0.1,
          backgroundColor: AppColor.lightGrey,
          child: CachedNetworkImage(
            // height: SizeManager.getSize(context).height * 0.19,
            imageUrl: imagePath,
            fit: BoxFit.contain,

            placeholder:
                (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget:
                (context, url, error) => Image.asset(ImagesAssets.watches),
          ),
        ),

        Text(
          categoryName,
          maxLines: 2,
          softWrap: true, // يسمح للنص بالانتقال لسطر جديد عند الحاجة
          overflow: TextOverflow.ellipsis, // يضيف ... إذا تجاوز السطرين
          style: StyleManager.textStyle16(context, FontWeight.w500),
        ),
      ],
    );
  }
}

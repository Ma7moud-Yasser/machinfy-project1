import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentation/components/featured_product_components/build_Action_Buttons.dart';
import 'package:ecommerce_app/features/home/presentation/components/featured_product_components/build_productInfo.dart';
import 'package:flutter/material.dart';

class FeaturedProductCard extends StatelessWidget {
  final String? productImage;
  final String? title;
  final String? subtitle;
  final String? rating;
  final String? price;

  const FeaturedProductCard({
    super.key,
    required this.productImage,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeManager.getSize(context).width * 0.5,
      child: Column(
        children: [
          buildProductInfo(
            context,
            productImage: productImage ?? ImagesAssets.notFoundImage,
            title: title ?? "Not Tittle",
            subtitle: subtitle ?? "Not Sub Tittle",
            rating: rating ?? "0",
            price: price ?? "0",
          ),

          buildActionButtons(context),
        ],
      ),
    );
  }
}

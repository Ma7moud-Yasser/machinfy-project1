import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentation/components/featured_product_components/build_Action_Buttons.dart';
import 'package:ecommerce_app/features/home/presentation/components/featured_product_components/build_productInfo.dart';
import 'package:flutter/material.dart';

class FeaturedProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const FeaturedProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeManager.getSize(context).width * 0.5,
      child: Column(
        children: [
          buildProductInfo(
            context,
            productImage: product["image"],
            title: product["title"],
            subtitle: product["subtitle"],
            rating: product["rating"],
            price: product["price"],
          ),
          buildActionButtons(context),
        ],
      ),
    );
  }
}

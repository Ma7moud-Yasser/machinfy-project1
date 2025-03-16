import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentaion/components/featured_product_components/build_Action_Buttons.dart';
import 'package:ecommerce_app/features/home/presentaion/components/most_viewed_component/most_view_productInfo.dart';
import 'package:flutter/material.dart';

class MostViewedProductCard extends StatelessWidget {
  final Map<String, dynamic> product;

  const MostViewedProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeManager.getSize(context).width * 0.5,
      child: Column(
        children: [
          buildMostViewedProductInfo(
            context,
            productImage: product["image"],
            title: product["title"],

            rating: product["rating"],
            price: product["price"],
          ),
          buildActionButtons(context),
        ],
      ),
    );
  }
}

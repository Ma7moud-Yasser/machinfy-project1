import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentation/components/featured_product_card.dart';
import 'package:ecommerce_app/features/home/presentation/controllers/featured_products_cubit/featured_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListViewBuilder extends StatelessWidget {
  final List<Map<String, dynamic>> productList;
  const ProductListViewBuilder({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedProductsCubit, FeaturedProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SizedBox(
          height: SizeManager.getSize(context).height * 0.35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                    left: SizeManager.getSize(context).width * 0.05,
                  ),
                  child: FeaturedProductCard(product: productList[index]),
                ),
            itemCount: productList.length,
          ),
        );
      },
    );
  }
}

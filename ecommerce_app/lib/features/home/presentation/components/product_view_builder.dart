import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentation/components/featured_product_card.dart';
import 'package:ecommerce_app/features/home/presentation/controllers/featured_products_cubit/featured_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListViewBuilder extends StatefulWidget {
  const ProductListViewBuilder({super.key});

  @override
  State<ProductListViewBuilder> createState() => _ProductListViewBuilderState();
}

class _ProductListViewBuilderState extends State<ProductListViewBuilder> {
  @override
  void initState() {
    BlocProvider.of<FeaturedProductsCubit>(context).getFeaturedProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedProductsCubit, FeaturedProductsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is FeaturedProductsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is FeaturedProductsErrorState) {
          return Center(child: Text(state.error));
        } else if (state is FeaturedProductsSuccessState) {
          var products = state.featuredProductsModel.data!.products;
          return SizedBox(
            height: SizeManager.getSize(context).height * 0.36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsets.only(
                      left: SizeManager.getSize(context).width * 0.05,
                    ),
                    child: FeaturedProductCard(
                      productImage: products[index].image,
                      title: products[index].name,
                      subtitle: products[index].description,
                      rating: "4.5",
                      price: products[index].price.toString(),
                    ),
                  ),
              itemCount: products!.length,
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

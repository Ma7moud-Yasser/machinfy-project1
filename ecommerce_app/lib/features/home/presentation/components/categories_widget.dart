import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentation/components/categories_item.dart';
import 'package:ecommerce_app/features/home/presentation/controllers/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesListViewBuilder extends StatefulWidget {
  const CategoriesListViewBuilder({super.key});

  @override
  State<CategoriesListViewBuilder> createState() =>
      _CategoriesListViewBuilderState();
}

class _CategoriesListViewBuilderState extends State<CategoriesListViewBuilder> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CategoriesCubit>(context).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategoriesLoadingState) {
          return const Center(
            child: Center(child: CircularProgressIndicator.adaptive()),
          );
        } else if (state is CategoriesSuccessState) {
          {
            final categories = state.categoriesModel.data.categories;
            return SizedBox(
              height: SizeManager.getSize(context).height * 0.14,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder:
                    (context, index) => Padding(
                      padding: EdgeInsets.only(
                        left: SizeManager.getSize(context).width * 0.05,
                      ),
                      child: CategoriesItems(
                        categoryName: categories[index].name,
                        imagePath: categories[index].image,
                      ),
                    ),
              ),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}

import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentaion/components/categories_item.dart';
import 'package:flutter/widgets.dart';

class CategoriesListViewBuilder extends StatelessWidget {
  const CategoriesListViewBuilder({super.key, required this.categoriesList});
  final List<Map<String, dynamic>> categoriesList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeManager.getSize(context).height * 0.13,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsets.only(
                left: SizeManager.getSize(context).width * 0.05,
              ),
              child: CategoriesItems(
                categoryName: categoriesList[index]["name"],
                imagePath: categoriesList[index]["image"],
              ),
            ),
      ),
    );
  }
}

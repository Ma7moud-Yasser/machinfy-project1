import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/data/data.dart';
import 'package:ecommerce_app/features/home/presentaion/components/categories_item.dart';
import 'package:flutter/widgets.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.categoriesList});
  final List<Map<String, dynamic>> categoriesList;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeManager.getSize(context).height * 0.13,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: HomeData.categories.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                    right: SizeManager.getSize(context).width * 0.05,
                  ),
                  child: CategoriesItems(
                    categoryName: categoriesList[index]["name"],
                    imagePath: categoriesList[index]["image"],
                  ),
                ),
          ),
        ),
      ],
    );
  }
}

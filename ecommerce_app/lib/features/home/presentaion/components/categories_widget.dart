import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppString.categories,
              style: StyleManager.textStyle22(context, FontWeight.w700),
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                AppString.seeAll,
                style: StyleManager.textStyle14(context, FontWeight.w400),
              ),
            ),
          ],
        ),
        SizedBox(height: SizeManager.getSize(context).height * 0.02),
        SizedBox(
          height: SizeManager.getSize(context).height * 0.12,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: HomeData.categories.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: EdgeInsets.only(
                    right: SizeManager.getSize(context).width * 0.03,
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

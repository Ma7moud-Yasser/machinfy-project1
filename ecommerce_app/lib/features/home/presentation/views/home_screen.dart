import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/components/features_title.dart';
import 'package:ecommerce_app/core/components/timer.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/features/home/data/data.dart';
import 'package:ecommerce_app/features/home/presentation/components/categories_widget.dart';
import 'package:ecommerce_app/features/home/presentation/components/custom_search_bar.dart';
import 'package:ecommerce_app/features/home/presentation/components/custom_user_bar.dart';
import 'package:ecommerce_app/features/home/presentation/components/most_viewed_component/most_view_builder.dart';
import 'package:ecommerce_app/features/home/presentation/components/offers_banner.dart';
import 'package:ecommerce_app/features/home/presentation/components/product_view_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: PaddingManager.main(context),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  CustomUserBar(),
                  CustomSearchBar(),
                  SizedBox(height: SizeManager.getSize(context).height * 0.02),
                  OffersBanner(sliderItems: HomeData.sliderItems),
                ]),
              ),
            ),

            SliverToBoxAdapter(
              child: FeaturesTitle(title: AppString.categories, onTap: () {}),
            ),
            SliverToBoxAdapter(
              child: CategoriesListViewBuilder(
                categoriesList: HomeData.categories,
              ),
            ),
            SliverPadding(
              padding: PaddingManager.main(context),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: SizeManager.getSize(context).height * 0.02),
                  CountdownTimer(),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: FeaturesTitle(title: "Featured Products"),
            ),
            SliverToBoxAdapter(
              child: ProductListViewBuilder(
                productList: HomeData.featuredProducts,
              ),
            ),

            SliverToBoxAdapter(child: FeaturesTitle(title: "Best seller")),

            SliverPadding(
              padding: PaddingManager.main(context),
              sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: SizeManager.getSize(context).height * 0.27,
                ),
                itemCount: 4,
                itemBuilder:
                    (context, index) => Container(
                      decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        borderRadius: BorderRadiusManager.medium(context),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: PaddingManager.smallSymmetricHorizontal(
                                context,
                              ).copyWith(
                                top:
                                    SizeManager.getSize(context).height * 0.008,
                              ),
                              decoration: BoxDecoration(
                                color: AppColor.lightGrey,
                                borderRadius: BorderRadiusManager.medium(
                                  context,
                                ),
                              ),
                              child: CachedNetworkImage(
                                height:
                                    SizeManager.getSize(context).height * 0.2,
                                imageUrl:
                                    "https://i.pinimg.com/474x/84/e9/b0/84e9b0a271f67bf7d8dad4c177689190.jpg",
                                fit: BoxFit.cover,
                                placeholder:
                                    (context, url) => const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                errorWidget:
                                    (context, url, error) =>
                                        Image.asset(ImagesAssets.notFoundImage),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 190,
                            right: -5,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.favorite_outline_sharp,
                                color: AppColor.primary,
                                size: SizeManager.getSize(context).width * 0.06,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height:
                                  SizeManager.getSize(context).height * 0.12,
                              width: SizeManager.getSize(context).width * 0.44,
                              padding: PaddingManager.smallSymmetricHorizontal(
                                context,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.9),
                                borderRadius: BorderRadiusManager.medium(
                                  context,
                                ).copyWith(
                                  topLeft: Radius.zero,
                                  topRight: Radius.zero,
                                ),
                              ),
                              child: Column(
                                spacing: 2,
                                children: [
                                  Text(
                                    "Product Name",
                                    style: StyleManager.textStyle16(
                                      context,
                                      FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Sony headset",
                                    style: StyleManager.textStyle14(
                                      context,
                                      FontWeight.w500,
                                    ).copyWith(color: AppColor.primary),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,

                                    children: [
                                      Text(
                                        "800 EGP",
                                        style: StyleManager.textStyle16(
                                          context,
                                          FontWeight.w700,
                                        ).copyWith(color: AppColor.secondary),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '4.5',
                                            style: StyleManager.textStyle14(
                                              context,
                                              FontWeight.w500,
                                            ).copyWith(color: AppColor.primary),
                                          ),
                                          SvgPicture.asset(
                                            IconsAssets.starIcon,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SvgPicture.asset(IconsAssets.cart),
                                      SvgPicture.asset(IconsAssets.compareIcon),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              ),
            ),
            SliverToBoxAdapter(child: FeaturesTitle(title: "Most Viewed")),
            SliverToBoxAdapter(
              child: MostViewListViewBuilder(
                productList: HomeData.featuredProducts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

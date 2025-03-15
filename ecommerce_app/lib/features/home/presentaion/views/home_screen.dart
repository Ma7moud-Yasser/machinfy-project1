import 'package:ecommerce_app/core/components/features_title.dart';
import 'package:ecommerce_app/core/components/timer.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/data/data.dart';
import 'package:ecommerce_app/features/home/presentaion/components/categories_widget.dart';
import 'package:ecommerce_app/features/home/presentaion/components/custom_search_bar.dart';
import 'package:ecommerce_app/features/home/presentaion/components/custom_user_bar.dart';
import 'package:ecommerce_app/features/home/presentaion/components/offers_banner.dart';
import 'package:ecommerce_app/features/home/presentaion/components/product_card.dart';
import 'package:flutter/material.dart';

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
                  FeaturesTitle(title: AppString.categories, onTap: () {}),
                  Categories(categoriesList: HomeData.categories),
                  SizedBox(height: SizeManager.getSize(context).height * 0.02),
                  CountdownTimer(),
                  FeaturesTitle(title: "Featured Products"),
                ]),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: SizeManager.getSize(context).height * 0.37,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder:
                      (context, index) => Padding(
                        padding: EdgeInsets.only(
                          left: SizeManager.getSize(context).width * 0.05,
                        ),
                        child: FeaturedProductCard(
                          product: HomeData.featuredProducts[index],
                        ),
                      ),
                  itemCount: HomeData.featuredProducts.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

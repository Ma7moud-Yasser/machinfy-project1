import 'package:ecommerce_app/core/components/custom_app_bar.dart';
import 'package:ecommerce_app/core/components/features_title.dart';
import 'package:ecommerce_app/core/components/timer.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/data/data.dart';
import 'package:ecommerce_app/features/home/presentation/components/best_seller_component.dart';
import 'package:ecommerce_app/features/home/presentation/components/categories_widget.dart';
import 'package:ecommerce_app/features/home/presentation/components/most_viewed_component/most_view_builder.dart';
import 'package:ecommerce_app/features/home/presentation/components/offers_banner.dart';
import 'package:ecommerce_app/features/home/presentation/components/product_view_builder.dart';
import 'package:ecommerce_app/features/home/presentation/controllers/banner_cubit/banner_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/controllers/categories_cubit/categories_cubit.dart';
import 'package:ecommerce_app/features/home/presentation/controllers/featured_products_cubit/featured_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  late final BannerCubit bannerCubit;
  late final CategoriesCubit categoriesCubit;
  late final FeaturedProductsCubit featuredProductsCubit;

  @override
  void initState() {
    super.initState();
    bannerCubit = BannerCubit()..getBanner();
    categoriesCubit = CategoriesCubit()..getCategories();
    featuredProductsCubit = FeaturedProductsCubit()..getFeaturedProducts();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: bannerCubit),
        BlocProvider.value(value: categoriesCubit),
        BlocProvider.value(value: featuredProductsCubit),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: PaddingManager.main(context),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    CustomAppBar(),
                    OffersBanner(),
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: FeaturesTitle(title: AppString.categories, onTap: () {}),
              ),
              SliverToBoxAdapter(child: CategoriesListViewBuilder()),
              SliverPadding(
                padding: PaddingManager.main(context),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(
                      height: SizeManager.getSize(context).height * 0.02,
                    ),
                    CountdownTimer(),
                  ]),
                ),
              ),
              SliverToBoxAdapter(
                child: FeaturesTitle(title: "Featured Products"),
              ),
              SliverToBoxAdapter(child: ProductListViewBuilder()),
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
                  itemBuilder: (context, index) => BestSellerComponent(),
                ),
              ),
              SliverToBoxAdapter(child: FeaturesTitle(title: "Most Viewed")),
              SliverToBoxAdapter(
                child: MostViewListViewBuilder(
                  productList: HomeData.featuredProducts,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: SizeManager.getSize(context).height * 0.012,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

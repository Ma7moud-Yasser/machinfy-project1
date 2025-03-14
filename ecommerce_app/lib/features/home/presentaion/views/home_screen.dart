import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/features/home/presentaion/components/custom_search_bar.dart';
import 'package:ecommerce_app/features/home/presentaion/components/custom_user_bar.dart';
import 'package:ecommerce_app/features/home/presentaion/components/details_item_screen.dart';
import 'package:ecommerce_app/features/home/presentaion/components/offers_banner.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> sliderItems = const [
    {
      "image":
          "https://i.pinimg.com/736x/27/8e/46/278e46ef553cc3176963ed0d52077cdd.jpg",
      "title": "Elegant Black Watch",
      "subtitle": "Discover timeless elegance.",
      "page": DetailPage(title: "Page 1"),
    },
    {
      "image":
          "https://i.pinimg.com/736x/73/8c/66/738c66a1e117f638020803ff8c6a6575.jpg",
      "title": "Luxury Silver Watch",
      "subtitle": "Refined style for modern times.",
      "page": DetailPage(title: "Page 2"),
    },
    {
      "image":
          "https://i.pinimg.com/736x/f1/ca/4a/f1ca4a2b4143a4ce875b20261bc91a4c.jpg",
      "title": "Classic Leather Watch",
      "subtitle": "Vintage charm meets innovation.",
      "page": DetailPage(title: "Page 3"),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: PaddingManager.main(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomUserBar(),
              SizedBox(height: 10),
              CustomSearchBar(),
              SizedBox(height: 20),
              OffersBanner(sliderItems: sliderItems),
              SizedBox(height: SizeManager.getSize(context).height * 0.02),
              Text(
                AppString.categories,
                style: StyleManager.textStyle22(context, FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/features/home/presentaion/components/buid_card_banner.dart';
import 'package:ecommerce_app/features/home/presentaion/components/details_item_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OffersBanner extends StatefulWidget {
  const OffersBanner({super.key});

  @override
  State<OffersBanner> createState() => _OffersBannerState();
}

class _OffersBannerState extends State<OffersBanner> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;
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
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 205,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items:
              sliderItems.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => item["page"]),
                    );
                  },
                  child: buildCard(
                    item["image"],
                    item["title"],
                    item["subtitle"],
                    context,
                  ),
                );
              }).toList(),
        ),
        Center(
          child: AnimatedSmoothIndicator(
            activeIndex: _currentIndex,
            count: sliderItems.length,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: AppColor.primary,
              dotColor: AppColor.background,
            ),
            onDotClicked: (index) {
              _carouselController.animateToPage(index);
            },
          ),
        ),
      ],
    );
  }
}

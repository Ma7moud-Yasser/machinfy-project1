import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/features/home/presentaion/components/buid_card_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OffersBanner extends StatefulWidget {
  const OffersBanner({super.key, required this.sliderItems});

  final List<Map<String, dynamic>> sliderItems;

  @override
  State<OffersBanner> createState() => _OffersBannerState();
}

class _OffersBannerState extends State<OffersBanner> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  bool autoPlay = true;
  int _currentIndex = 0;

  @override
  dispose() {
    _carouselController.stopAutoPlay();
    autoPlay = false;
    log("autoPlay: $autoPlay");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 205,
            autoPlay: autoPlay,
            enlargeCenterPage: true,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items:
              widget.sliderItems.map((item) {
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
            count: widget.sliderItems.length,
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

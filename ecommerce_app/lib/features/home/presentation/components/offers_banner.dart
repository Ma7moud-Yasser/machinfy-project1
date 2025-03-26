import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentation/components/buid_card_banner.dart';
import 'package:ecommerce_app/features/home/presentation/controllers/banner_cubit/banner_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OffersBanner extends StatefulWidget {
  const OffersBanner({super.key});

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
    autoPlay = false;
    log("autoPlay: $autoPlay");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BannerCubit, BannerState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BannerLoadingState) {
          return const Center(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (state is BannerSuccessState) {
          final bannerData = state.bannerModel.data;

          // if (bannerData.isEmpty) {
          //   return Container();
          // }
          return Column(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: SizeManager.getSize(context).height * 0.2,
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
                    bannerData.map((item) {
                      final imageUrl = item.image;

                      bool isValidImage =
                          imageUrl.isNotEmpty &&
                          Uri.tryParse(imageUrl)?.hasAbsolutePath == true;

                      return GestureDetector(
                        onTap: () {},
                        child: buildCard(
                          isValidImage
                              ? imageUrl
                              : 'https://via.placeholder.com/150',

                          context,
                        ),
                      );
                    }).toList(),
              ),
              Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: bannerData.length,
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
        } else {
          return Container();
        }
      },
    );
  }
}

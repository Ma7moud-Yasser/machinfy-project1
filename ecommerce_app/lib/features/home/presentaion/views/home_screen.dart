import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/features/home/presentaion/components/custom_search_bar.dart';
import 'package:ecommerce_app/features/home/presentaion/components/custom_user_bar.dart';
import 'package:ecommerce_app/features/home/presentaion/components/offers_banner.dart';
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
              OffersBanner(),
            ],
          ),
        ),
      ),
    );
  }
}

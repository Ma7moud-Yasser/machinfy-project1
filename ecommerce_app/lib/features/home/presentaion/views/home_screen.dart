import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/features/home/presentaion/components/custom_search_bar.dart';
import 'package:ecommerce_app/features/home/presentaion/components/custom_user_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: PaddingManager.main(context),
          child: Column(children: [CustomUserBar(), CustomSearchBar()]),
        ),
      ),
    );
  }
}

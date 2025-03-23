import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/features/home/presentation/components/custom_search_bar.dart';
import 'package:ecommerce_app/features/home/presentation/components/custom_user_bar.dart';
import 'package:flutter/cupertino.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomUserBar(),
        CustomSearchBar(),
        SizedBox(height: SizeManager.getSize(context).height * 0.02),
      ],
    );
  }
}

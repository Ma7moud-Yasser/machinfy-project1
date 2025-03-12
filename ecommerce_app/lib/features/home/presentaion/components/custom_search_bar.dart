import 'package:ecommerce_app/core/components/custom_text_form.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: CustomTextFormField(
            fillColor: true,
            filledColor: AppColor.lightGrey,
            prefixIconPath: IconsAssets.search,
            hintText: "Find everything you can imagine...",
          ),
        ),
        SizedBox(width: SizeManager.getSize(context).width * 0.02),
        GestureDetector(
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.lightGrey,
              border: Border.all(color: AppColor.background),
              borderRadius: BorderRadiusManager.small(context),
            ),
            padding: EdgeInsets.all(SizeManager.getSize(context).width * 0.036),
            child: SvgPicture.asset(
              IconsAssets.filterIcon,
              width: SizeManager.getSize(context).width * 0.06,
            ),
          ),
        ),
      ],
    );
  }
}

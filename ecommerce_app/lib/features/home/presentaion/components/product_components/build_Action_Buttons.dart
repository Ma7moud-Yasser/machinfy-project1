import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildActionButtons(BuildContext context) {
  return Container(
    padding: PaddingManager.smallSymmetricHorizontal(context).copyWith(
      top: SizeManager.getSize(context).height * 0.013,
      bottom: SizeManager.getSize(context).height * 0.013,
    ),
    width: SizeManager.getSize(context).width * 0.5,
    decoration: BoxDecoration(
      color: AppColor.primary,
      borderRadius: BorderRadiusManager.custom(
        context: context,
        bottomLeft: 20,
        bottomRight: 20,
      ),
    ),
    child: Row(
      children: [
        SvgPicture.asset(
          IconsAssets.cart,
          color: AppColor.white,
          width: SizeManager.getSize(context).width * 0.05,
        ),
        const Spacer(),
        SvgPicture.asset(
          IconsAssets.compareIcon,
          color: AppColor.white,
          width: SizeManager.getSize(context).width * 0.05,
        ),
      ],
    ),
  );
}

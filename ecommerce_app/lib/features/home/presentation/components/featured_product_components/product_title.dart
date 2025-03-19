import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';

Widget buildProductTitle(BuildContext context, {required String title}) {
  return Text(
    title,
    maxLines: 1,
    softWrap: false,
    overflow: TextOverflow.ellipsis,
    textDirection: TextDirection.rtl,
    style: StyleManager.textStyle16(context, FontWeight.w700),
  );
}

Widget buildProductSubtitle(BuildContext context, {required String subtitle}) {
  return Text(
    subtitle,
    maxLines: 1,
    softWrap: false,
    overflow: TextOverflow.ellipsis,
    textDirection: TextDirection.rtl,
    style: StyleManager.textStyle14(
      context,
      FontWeight.w500,
    ).copyWith(color: AppColor.primary),
  );
}

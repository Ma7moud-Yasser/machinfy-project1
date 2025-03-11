import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Future<dynamic> CustomAlertDialog(BuildContext context) {
  return showAdaptiveDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Column(
            children: [
              SvgPicture.asset(
                IconsAssets.success,
                width: SizeManager.getSize(context).width * .2,
              ),
              Text(
                textAlign: TextAlign.center,
                AppString.warning,
                style: StyleManager.textStyle20(context, FontWeight.bold),
              ),
            ],
          ),
          content: Text(
            AppString.warning,
            style: StyleManager.textStyle16(context, FontWeight.bold),
          ),

          actions: [
            TextButton(
              child: Text(AppString.ok),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
  );
}

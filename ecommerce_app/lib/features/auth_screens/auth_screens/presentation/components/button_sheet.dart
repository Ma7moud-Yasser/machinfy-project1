import 'package:ecommerce_app/core/components/custom_text_form.dart';
import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';

void showButtonSheet(BuildContext context, String title) =>
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      enableDrag: true,
      elevation: 2,

      builder: (BuildContext context) {
        return Container(
          height: SizeManager.getSize(context).height * 0.5,
          width: SizeManager.getSize(context).width,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusManager.small(context),
          ),
          child: Padding(
            padding: PaddingManager.main(context),
            child: Column(
              children: [
                Text(
                  title,
                  style: StyleManager.textStyle22(
                    context,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                CustomTextFormField(
                  hintText: AppString.search,
                  label: "",
                  prefixIconPath: IconsAssets.search,
                  suffixIconWidget: SizedBox(),
                ),
              ],
            ),
          ),
        );
      },
    );

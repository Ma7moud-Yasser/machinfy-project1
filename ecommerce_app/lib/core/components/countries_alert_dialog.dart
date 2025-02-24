import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

countriesAlertDialog(BuildContext context) => showDialog(
  context: context,
  builder:
      (context) => AlertDialog.adaptive(
        title: Text(
          AppString.country,
          style: StyleManager.textStyle18(context),
          textAlign: TextAlign.center,
        ),
        content: SizedBox(
          height: SizeManager.getSize(context).height * 0.4,
          width: SizeManager.getSize(context).width * 0.8,
          child: ListView.builder(
            // itemCount: signUpCubit.countries.length,
            itemCount: 5,
            itemBuilder: (context, index) {
              return ListTile(
                leading: SvgPicture.asset(IconsAssets.egyptFlag),
                title: Text('egypt'),
                // title: Text(signUpCubit.countries[index]),
                onTap: () {
                  // signUpCubit.countryController.text = signUpCubit.countries[index];
                  Navigator.pop(context);
                },
              );
            },
          ),
        ),
      ),
);

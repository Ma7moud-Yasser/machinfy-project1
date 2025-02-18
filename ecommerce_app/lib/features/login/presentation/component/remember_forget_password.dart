import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RememberAndForgetPassword extends StatelessWidget {
  const RememberAndForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: RememberAndForgetPasswordPadding.getPadding(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * .05,
                child: Checkbox(
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  value: false,
                  onChanged: (value) {
                    ///
                  },
                ),
              ),
              Text(
                AppString.rememberMe,
                style: StyleManager.textStyle14(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          Text(
            AppString.forgetPassword,
            style: StyleManager.textStyle14(context).copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

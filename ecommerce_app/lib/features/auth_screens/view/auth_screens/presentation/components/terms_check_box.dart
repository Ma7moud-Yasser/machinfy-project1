import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/resources/route_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';

class TermsCheckbox extends StatelessWidget {
  final bool isChecked;
  final void Function()? onTap;

  const TermsCheckbox({
    super.key,
    required this.onTap,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(
            isChecked
                ? Icons.radio_button_checked
                : Icons.radio_button_unchecked,
            color: Theme.of(context).colorScheme.primary,
            size: 20,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.termsAndConditionsScreen);
          },
          child: Text(
            AppString.agreeToTermsAndConditions,
            style: StyleManager.textStyle14(
              context,
            ).copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

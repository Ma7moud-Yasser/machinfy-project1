import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final bool isEditing;
  final String label;
  final String prefixIconPath;
  final Widget suffixIconWidget;

  const CustomTextFormField({
    this.validator,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.isEditing = true,
    required this.label,
    required this.prefixIconPath,
    required this.suffixIconWidget,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          label,
          style: StyleManager.textStyle18(
            context,
          ).copyWith(fontWeight: FontWeight.w800),
        ),
        TextFormField(
          enabled: isEditing,
          onChanged: onChanged,
          maxLines: maxLines,
          maxLength: maxLength,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          style: StyleManager.textStyle16(
            context,
          ).copyWith(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: StyleManager.textStyle14(context),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadiusManager.small(context),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.error,
              ),
              borderRadius: BorderRadiusManager.small(context),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.error,
              ),
              borderRadius: BorderRadiusManager.small(context),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.background,
              ),
              borderRadius: BorderRadiusManager.small(context),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
              borderRadius: BorderRadiusManager.small(context),
            ),
            suffixIcon: Padding(
              padding: IconTextFormPadding.getPadding(context),
              child: suffixIconWidget,
            ),
            prefixIcon: Padding(
              padding: IconTextFormPadding.getPadding(context),
              child: SvgPicture.asset(prefixIconPath),
            ),
          ),

          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
        ),
      ],
    );
  }
}

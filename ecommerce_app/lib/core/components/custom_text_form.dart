import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/padding_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String? Function(String?)? validator;
  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final bool isEditing;
  final String? label;
  final String? prefixIconPath;
  final Widget? suffixIconWidget;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function()? onTap;

  const CustomTextFormField({
    this.validator,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    this.onChanged,
    this.isEditing = true,
    this.onTap,
    this.obscureText = false,
    this.keyboardType,
    this.label = '',
    this.prefixIconPath,
    this.suffixIconWidget,
    super.key,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Visibility(
          visible: widget.label?.isNotEmpty ?? false,
          child: Text(
            widget.label ?? '',
            style: StyleManager.textStyle16(context, FontWeight.w600),
          ),
        ),
        TextFormField(
          obscureText: widget.obscureText,
          keyboardType: widget.keyboardType,
          enabled: widget.isEditing,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          style: StyleManager.textStyle14(
            context,
            FontWeight.w600,
          ).copyWith(color: Theme.of(context).colorScheme.primary),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: StyleManager.textStyle12(context),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Theme.of(context).colorScheme.background,
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
            suffixIcon: widget.suffixIconWidget ?? widget.suffixIconWidget,
            prefixIcon:
                widget.prefixIconPath == null || widget.prefixIconPath == ''
                    ? null
                    : Padding(
                      padding: PaddingManager.iconTextForm(context),
                      child: SvgPicture.asset(widget.prefixIconPath!),
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

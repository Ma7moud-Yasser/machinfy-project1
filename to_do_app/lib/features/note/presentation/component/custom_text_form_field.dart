import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  String? Function(String?)? validator;
  String hintText;
  TextEditingController? controller;
  int? maxLines = 1;
  int? maxLength;

  CustomTextFormField({
    this.validator,
    required this.hintText,
    this.controller,
    this.maxLines,
    this.maxLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      validator: validator,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w500,
          ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.04)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.7,
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.04)),
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}

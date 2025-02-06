import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final int? maxLength;

  const CustomTextFormField({
    this.validator,
    required this.hintText,
    this.controller,
    this.maxLines = 1,
    this.maxLength,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: maxLength,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Theme.of(context).colorScheme.tertiary,
            fontWeight: FontWeight.w500,
          ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.error,
            ),
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.03)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.error,
            ),
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.03)),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.03)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.7,
              color: Theme.of(context).colorScheme.primary,
            ),
            borderRadius:
                BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.03)),
      ),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
    );
  }
}

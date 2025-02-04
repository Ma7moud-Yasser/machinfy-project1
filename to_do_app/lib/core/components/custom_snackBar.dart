import 'package:flutter/material.dart';
import 'package:to_do_app/core/styles/color_manager.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
    BuildContext context,
    {required String message}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    ),
  );
}

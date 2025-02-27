import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/resources/route_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RememberAndForgetPassword extends StatefulWidget {
  RememberAndForgetPassword({
    super.key,
    required this.emailController,
    required this.rememberMe,
  });
  final TextEditingController emailController;
  bool rememberMe = false;
  @override
  State<RememberAndForgetPassword> createState() =>
      _RememberAndForgetPasswordState();
}

class _RememberAndForgetPasswordState extends State<RememberAndForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          spacing: 10,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .05,
              height: MediaQuery.sizeOf(context).height * .009,
              child: Checkbox(
                side: BorderSide(color: Theme.of(context).colorScheme.outline),
                value: widget.rememberMe,
                onChanged: (value) {
                  setState(() {
                    widget.rememberMe = value!;
                  });
                },
              ),
            ),
            Text(
              AppString.rememberMe,
              style: StyleManager.textStyle14(
                context,
                FontWeight.w600,
              ).copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.forgetPasswordScreens,
              arguments: widget.emailController.text,
            );
          },
          child: Text(
            AppString.forgetPassword,
            style: StyleManager.textStyle14(
              context,
              FontWeight.w600,
            ).copyWith(color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}

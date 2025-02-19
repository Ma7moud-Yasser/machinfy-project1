import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AuthTitleHeader extends StatelessWidget {
  const AuthTitleHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(IconsAssets.auth),

        Text(
          title,
          style: StyleManager.textStyle22(
            context,
          ).copyWith(fontWeight: FontWeight.w900),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
      ],
    );
  }
}

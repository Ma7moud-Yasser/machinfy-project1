import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class AuthTitleHeader extends StatelessWidget {
  const AuthTitleHeader({super.key, this.title, required this.imagePath});
  final String? title;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(imagePath),

        Text(
          title ?? '',
          style: StyleManager.textStyle22(
            context,
          ).copyWith(fontWeight: FontWeight.w900),
        ),
        SizedBox(height: MediaQuery.sizeOf(context).height * 0.01),
      ],
    );
  }
}

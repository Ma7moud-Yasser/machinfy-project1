import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/features/login/presentation/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigateAfterDelay();
    super.initState();
  }

  void navigateAfterDelay() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              IconsAssets.logo,
              width: MediaQuery.sizeOf(context).width * .4,
            ),
            Text(AppString.appName, style: StyleManager.textStyle50(context)),
            Text(
              AppString.appSubName,
              style: StyleManager.textStyle20(
                context,
              ).copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }
}

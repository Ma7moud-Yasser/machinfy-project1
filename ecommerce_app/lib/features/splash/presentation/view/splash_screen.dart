import 'package:ecommerce_app/core/resources/app_stings.dart';
import 'package:ecommerce_app/core/resources/route_manager.dart';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:ecommerce_app/core/utils/cache_manager.dart';
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
    bool isOnBoardingViewSeen =
        CacheManager.getValueFromCache(CacheKeys.isOnBoardingViewSeen) ?? false;
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        isOnBoardingViewSeen ? Routes.loginScreen : Routes.onBoardingScreen,
      );
    });
  }

  @override
  /*************  ✨ Codeium Command ⭐  *************/
  /// The build method of the splash screen widget.
  ///
  /// This widget will render a logo, the app name and the app sub name.
  /// The navigation to the next route will be done after a delay of 3 seconds.
  ///
  /// The route to navigate to is determined by whether or not the onboarding view has been seen.
  /// If the onboarding view has been seen, the login screen will be shown.
  /// Otherwise, the onboarding screen will be shown.
  /******  53958f8a-e63c-4003-83d6-51c138aa7e27  *******/
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
                FontWeight.w600,
              ).copyWith(color: Theme.of(context).colorScheme.secondary),
            ),
          ],
        ),
      ),
    );
  }
}

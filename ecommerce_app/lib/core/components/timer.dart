import 'dart:async';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:ecommerce_app/core/styles/border_radius_manager.dart';
import 'package:ecommerce_app/core/styles/color_manager.dart';
import 'package:ecommerce_app/core/styles/size_manager.dart';
import 'package:ecommerce_app/core/styles/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  Duration duration = Duration(days: 3, hours: 20, minutes: 15);
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (duration.inSeconds > 0) {
        setState(() {
          duration -= Duration(seconds: 1);
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int days = duration.inDays;
    int hours = duration.inHours.remainder(24);
    int minutes = duration.inMinutes.remainder(60);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: SizeManager.getSize(context).height * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColor.lightGrey,
        borderRadius: BorderRadiusManager.medium(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildFlipCard(days.toString().padLeft(2, '0'), "DAYS"),
          SizedBox(width: 16),
          buildFlipCard(hours.toString().padLeft(2, '0'), "HOURS"),
          SizedBox(width: 16),
          buildFlipCard(minutes.toString().padLeft(2, '0'), "MINUTES"),
        ],
      ),
    );
  }

  Widget buildFlipCard(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Column(
              children: [
                // الجزء العلوي
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.5,
                    child: Container(
                      width: SizeManager.getSize(context).width * 0.25,

                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          end: Alignment.topCenter,
                          begin: Alignment.bottomCenter,
                          colors: [
                            AppColor.white,
                            Colors.grey.shade300,
                            Colors.grey.shade300,
                          ],
                        ),
                        color: AppColor.background,
                        borderRadius: BorderRadius.circular(3),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black, // لون الظل
                        //     blurRadius: 10, // مدى التمويه
                        //     spreadRadius: 2, // مدى الانتشار
                        //     offset: Offset(4, 4), // اتجاه الظل (يمين وأسفل)
                        //   ),
                        // ],
                      ),
                      child: Center(
                        child: TimerFont(context: context, value: value),
                      ),
                    ),
                  ),
                ),

                // الخط الفاصل
                Container(height: 1.5, width: 80, color: AppColor.tertiary),

                // الجزء السفلي
                ClipRect(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.5,
                    child: Container(
                      width: SizeManager.getSize(context).width * 0.25,

                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColor.white,
                            Colors.grey.shade300,
                            Colors.grey.shade200,
                          ],
                        ),
                        color: AppColor.background,
                        borderRadius: BorderRadius.circular(3),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black12,
                        //     blurRadius: 4,
                        //     offset: Offset(2, 2),
                        //   ),
                        // ],
                      ),
                      child: Center(
                        child: TimerFont(context: context, value: value),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // المفصلات الجانبية
            Positioned(
              left: -4,
              top: 32,
              child: SvgPicture.asset(IconsAssets.roll, width: 10),
            ),
            Positioned(
              right: -4,
              top: 32,
              child: SvgPicture.asset(IconsAssets.roll, width: 10),
            ),
          ],
        ),

        SizedBox(height: 10),

        // اسم الوحدة (DAYS, HOURS, MINUTES)
        Text(
          label,
          style: StyleManager.textStyle14(
            context,
            FontWeight.w500,
          ).copyWith(color: AppColor.primary),
        ),
      ],
    );
  }
}

class TimerFont extends StatelessWidget {
  const TimerFont({super.key, required this.context, required this.value});

  final String value;
  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: StyleManager.textStyle50(
        context,
        FontWeight.w400,
      ).copyWith(fontFamily: GoogleFonts.bebasNeue().fontFamily, fontSize: 60),
    );
  }
}

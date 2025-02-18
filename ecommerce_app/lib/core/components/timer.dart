import 'dart:async';
import 'package:ecommerce_app/core/styles/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
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
        ),
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
                      width: 80,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFFEAEAEA),
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black26,
                        //     blurRadius: 4,
                        //     offset: Offset(2, 2),
                        //   ),
                        // ],
                      ),
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // الخط الفاصل
                Container(height: 2, width: 80, color: Colors.grey.shade400),

                // الجزء السفلي
                ClipRect(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.5,
                    child: Container(
                      width: 80,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Color(0xFFEAEAEA),
                        borderRadius: BorderRadius.circular(10),
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.black12,
                        //     blurRadius: 4,
                        //     offset: Offset(2, 2),
                        //   ),
                        // ],
                      ),
                      child: Center(
                        child: Text(
                          value,
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // المفصلات الجانبية
            Positioned(
              left: -4,
              top: 35,
              child: SvgPicture.asset(IconsAssets.roll, width: 10),
            ),
            Positioned(
              right: -4,
              top: 35,
              child: SvgPicture.asset(IconsAssets.roll, width: 10),
            ),
          ],
        ),

        SizedBox(height: 10),

        // اسم الوحدة (DAYS, HOURS, MINUTES)
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.teal.shade700,
          ),
        ),
      ],
    );
  }
}

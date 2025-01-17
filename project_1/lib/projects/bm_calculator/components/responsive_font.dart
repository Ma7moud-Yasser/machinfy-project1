import 'package:flutter/material.dart';


double responsiveFont(BuildContext context ,
{required double fontSize,}){
  double scale = scaleFactorCalc(context);
  double scaledFontSize = fontSize * scale;

  // max font Size : 120 % 
  // min font Size : 80% 
  double max = fontSize * 1.2;
  double min = fontSize * 0.8;

  
  return scaledFontSize.clamp(min, max);
}

 scaleFactorCalc(BuildContext context){
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  if (width < 600){
    return width /400;
  }else if (width < 900){
    return width / 700;
 } else {
  return width / 1000;
 }
 }
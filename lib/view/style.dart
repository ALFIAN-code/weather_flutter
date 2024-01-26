import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fonts{
  static TextStyle extraBold36 = GoogleFonts.poppins(fontSize: 37, color: Colors.black.withOpacity(0.5), fontWeight: FontWeight.w800);
  static TextStyle extraBold90 = extraBold36.copyWith(fontSize: 90, fontWeight: FontWeight.w800);
  static TextStyle medium44 = extraBold36.copyWith(fontSize: 44, fontWeight: FontWeight.w500);
  static TextStyle regular20 = extraBold36.copyWith(fontSize: 20, fontWeight: FontWeight.w200);
  static TextStyle semiBold16 = extraBold36.copyWith(fontSize: 16, fontWeight: FontWeight.w600);
  static TextStyle regular10 = extraBold36.copyWith(fontSize: 10, fontWeight: FontWeight.w400);
}

class AppColor{
  static const List<Color> sunny = [Color(0xffFFD686), Color(0xffFE8787)]; 
  static const List<Color> cloudy = [ Color(0xffA4E4FF), Color(0xffAAB8FF)];
  static const List<Color> rainy = [Color(0xff4661A6), Color(0xff4F97B6)];
  static const List<Color> storm = [Color(0xff9493C0), Color(0xff5C5B8B)];
}

class WeatherAnimation{
  static const String sunny = 'lib/asset/sunny.json';
  static const String cloudy = 'lib/asset/cloudy.json';
  static const String rainy = 'lib/asset/rain.json';
  static const String storm = 'lib/asset/thunderstorm.json';
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


class Themes{

  static final light= ThemeData(


      primaryColor: Colors.blue,
      backgroundColor: Colors.white,
      brightness: Brightness.light
  );
  static final dark= ThemeData(
      primaryColor: Colors.black87,
      backgroundColor: Colors.black87,
      brightness: Brightness.dark

  );
}

TextStyle get subHeadingStyle{
  return GoogleFonts.lato (
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      )
  );
}

TextStyle get HeadingStyle{
  return GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
      )
  );
}

TextStyle get titleStyle{
  return GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color:Get.isDarkMode?Colors.white:Colors.black
      )
  );
}

TextStyle get subtitleStyle{
  return GoogleFonts.lato (
      textStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color:Get.isDarkMode?Colors.grey[100]:Colors.grey[600]
      )
  );
}
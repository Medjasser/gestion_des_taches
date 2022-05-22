import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Themes{

  static final light= ThemeData(

      primaryColor: Colors.blue,
      brightness: Brightness.light
  );
  static final dark= ThemeData(
      primaryColor: Colors.black87,
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
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class CustomTheme {
  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: const Color(0xff084f57),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.openSans(
          fontSize: 25.0.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
          color: Colors.black87,
        ),
        headlineMedium: GoogleFonts.openSans(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
          color: Colors.black87,
        ),
        displaySmall: GoogleFonts.openSans(
          fontSize: 18.0.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
          color: Colors.black87,
        ),
        displayMedium: GoogleFonts.openSans(
          fontSize: 17.0.sp,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
          color: Colors.black87,
        ),
        bodyLarge: GoogleFonts.openSans(
          fontSize: 15.0.sp,
          letterSpacing: 1.0,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: GoogleFonts.openSans(fontSize: 17.0.sp, letterSpacing: 1.0),
        headlineSmall: GoogleFonts.openSans(fontSize: 18.0.sp, letterSpacing: 1.0),
      ),
      splashColor: const Color(0xff084f57),
      iconTheme: const IconThemeData(
        color: Color(0xff084f57),
      ),
  );


}

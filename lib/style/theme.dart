import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color(0xFFEEF7FF);
const Color secondaryColor = Color(0xFFF8F3F0);
const Color blackColor = Color(0xFF000000);

// ! Material 3
TextTheme textTheme = TextTheme(
  titleLarge: GoogleFonts.poppins(
    fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: 0.25,color: blackColor),
  titleMedium: GoogleFonts.poppins(
    fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.25,color: blackColor),
  titleSmall: GoogleFonts.poppins(
    fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.15,color: blackColor),
  bodyLarge: GoogleFonts.poppins(
    fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5,color: blackColor),
  bodyMedium: GoogleFonts.poppins(
    fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25,color: blackColor),
  labelLarge: GoogleFonts.poppins(
    fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.25,color: blackColor),
  labelMedium: GoogleFonts.poppins(
    fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.15,color: blackColor),
  labelSmall: GoogleFonts.poppins(
    fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.1,color: blackColor),
  bodySmall: GoogleFonts.poppins(
    fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4,color: blackColor),
  displaySmall: GoogleFonts.poppins(
    fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5,color: blackColor),
);

// ! Material Design
// const textTheme = TextTheme(
//   headline1: GoogleFonts.lemonada(
//       fontSize: 82, fontWeight: FontWeight.w300, letterSpacing: -1.5),
//   headline2: GoogleFonts.lemonada(
//       fontSize: 51, fontWeight: FontWeight.w300, letterSpacing: -0.5),
//   headline3: GoogleFonts.lemonada(fontSize: 41, fontWeight: FontWeight.w400),
//   headline4: GoogleFonts.lemonada(
//       fontSize: 29, fontWeight: FontWeight.w400, letterSpacing: 0.25),
//   headline5: GoogleFonts.lemonada(fontSize: 20, fontWeight: FontWeight.w400),
//   headline6: GoogleFonts.lemonada(
//       fontSize: 17, fontWeight: FontWeight.w500, letterSpacing: 0.15),
//   subtitle1: GoogleFonts.lemonada(
//       fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.15),
//   subtitle2: GoogleFonts.lemonada(
//       fontSize: 12, fontWeight: FontWeight.w500, letterSpacing: 0.1),
//   bodyText1: GoogleFonts.sourceSerifPro(
//       fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.5),
//   bodyText2: GoogleFonts.sourceSerifPro(
//       fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.25),
//   button: GoogleFonts.sourceSerifPro(
//       fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 1.25),
//   caption: GoogleFonts.sourceSerifPro(
//       fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.4),
//   overline: GoogleFonts.sourceSerifPro(
//       fontSize: 11, fontWeight: FontWeight.w400, letterSpacing: 1.5),
// );
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeColors {
  static Color black = const Color(0xff000000);
  static Color white = const Color(0xffffffff);
  static Color grey800 = const Color(0xff3F3F3F);
  static Color grey700 = const Color(0xff535353);
  static Color grey600 = const Color(0xff666666);
  static Color grey500 = const Color(0xff7C7C7C);
  static Color grey400 = const Color(0xff909090);
  static Color grey300 = const Color(0xffADADAD);
  static Color grey200 = const Color(0xffCACACA);
  static Color grey100 = const Color(0xffE3E3E3);
  static Color grey50 = const Color(0xffF3F3F3);
  static Color mint600 = const Color(0xff1DB4A5);
  static Color mint500 = const Color(0xff20C5B5);
  static Color mint400 = const Color(0xff40E0D0);
  static Color mint200 = const Color(0xffB7F2EF);
  static Color mint100 = const Color(0xffE9FBFA);
  static Color teal800 = const Color(0xff1A3440);
  static Color teal700 = const Color(0xff314D51);
  static Color teal600 = const Color(0xff4E7C82);
  static Color teal500 = const Color(0xff5D939B);
  static Color coral500 = const Color(0xffEF976B);
  static Color coral400 = const Color(0xffF3B08E);
  static Color red500 = const Color(0xffEF6B6B);
}

final TextTheme textTheme = TextTheme(
    headline1: GoogleFonts.roboto(
      fontSize: 96,
      fontWeight: FontWeight.w300,
      height: 1.1152,
      letterSpacing: -1.5,
    ),
    headline2: GoogleFonts.roboto(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        height: 1.72),
    headline3: GoogleFonts.roboto(
      fontSize: 48,
      fontWeight: FontWeight.w400,
      height: 1.576,
    ),
    headline4: GoogleFonts.roboto(
      fontSize: 34,
      fontWeight: FontWeight.w400,
      height: 1.408,
      letterSpacing: 0.25,
    ),
    headline5: GoogleFonts.roboto(
      fontSize: 24,
      fontWeight: FontWeight.w400,
      height: 1.3202,
    ),
    headline6: GoogleFonts.roboto(
      fontSize: 20,
      fontWeight: FontWeight.w500,
      height: 1.32,
      letterSpacing: 0.15,
    ),
    subtitle1: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.24,
      letterSpacing: 0.15,
    ),
    button: GoogleFonts.roboto(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.46,
      height: 1.26,
    ),
    bodyText1: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.24,
      letterSpacing: 0.15,
    ),
    bodyText2: GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.21,
      letterSpacing: 0.15,
    ),
    labelMedium: GoogleFonts.roboto(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.24,
      letterSpacing: 0.14,
    ));

ThemeData theme = ThemeData(
    textTheme: TextTheme(
      subtitle1: TextStyle(color: ThemeColors.teal800),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: textTheme.labelMedium!.copyWith(color: ThemeColors.grey500),
      floatingLabelStyle: TextStyle(color: ThemeColors.coral500),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ThemeColors.coral500)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      prefixIconColor: ThemeColors.coral500,
    ),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        color: Colors.white,
        foregroundColor: ThemeColors.teal800,
        shadowColor: ThemeColors.grey300,
        elevation: 0,
        shape: Border(
            bottom: BorderSide(
                width: 4,
                color: ThemeColors.grey200.withOpacity(0.25),
                style: BorderStyle.solid))),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 8),
        primary: ThemeColors.mint400, // background (button) color
        onPrimary: Colors.white, // foreground (text) color
        textStyle: textTheme.button,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ThemeColors.white,
      selectedItemColor: ThemeColors.mint500,
      unselectedItemColor: ThemeColors.grey500,
    ));

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final textTheme = GoogleFonts.latoTextTheme(textTheme).copyWith(
  bodyText1: GoogleFonts.oswald(textStyle: textTheme.body1),
);

final lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.cyan,
  ),
  textTheme:  textTheme,
  brightness: Brightness.light,
  primaryColor: Color(0xff00bcd4),
  primaryColorBrightness: Brightness.light,
  primaryColorLight: Color(0xffb2ebf2),
  primaryColorDark: Color(0xff0097a7),
  accentColor: Color(0xff00bcd4),
  accentColorBrightness: Brightness.light,
  bottomAppBarColor: Color(0xffffffff),
  dividerColor: Color(0x1f000000),
  backgroundColor: Color(0xff80deea),
  dialogBackgroundColor: Color(0xffffffff),
  dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
  )),
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: MaterialColor(4280361249, {
      50: Color(0xfff2f2f2),
      100: Color(0xffe6e6e6),
      200: Color(0xffcccccc),
      300: Color(0xffb3b3b3),
      400: Color(0xff999999),
      500: Color(0xff808080),
      600: Color(0xff666666),
      700: Color(0xff4d4d4d),
      800: Color(0xff333333),
      900: Color(0xff191919)
    }),
  ),
  textTheme:  textTheme,
  brightness: Brightness.dark,
  primaryColor: Color(0xff212121),
  primaryColorLight: Color(0xff9e9e9e),
  primaryColorDark: Color(0xff000000),
  accentColor: Color(0xff64ffda),
  accentColorBrightness: Brightness.light,
  bottomAppBarColor: Color(0xff424242),
  dividerColor: Color(0x1fffffff),
  backgroundColor: Color(0xff616161),
  dialogBackgroundColor: Color(0xff424242),
  dialogTheme: DialogTheme(
      shape: RoundedRectangleBorder(
    side: BorderSide(
      color: Color(0xff000000),
      width: 0,
      style: BorderStyle.none,
    ),
    borderRadius: BorderRadius.all(Radius.circular(0.0)),
  )),
);

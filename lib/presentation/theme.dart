import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.white),
  textTheme: TextTheme(
    titleMedium: TextStyle(
      letterSpacing: 0.3,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      color: const Color(0xFF333333),
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    bodyMedium: TextStyle(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      color: const Color(0xFF333333),
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    displaySmall: TextStyle(
      letterSpacing: 0.5,
      wordSpacing: 1.5,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      color: const Color(0x99000000),
      fontSize: 11,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      wordSpacing: 1.5,
      letterSpacing: 0.5,
      fontFamily: GoogleFonts.montserrat().fontFamily,
      color: const Color(0x992373F0),
      decorationColor: const Color(0x992373F0),
      fontSize: 11,
      fontWeight: FontWeight.w600,
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
    toolbarHeight: 70,
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontSize: 14,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
      size: 15,
    ),
  ),
  hintColor: const Color(0x36000000),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith(
        (states) => const Color(0xFF100E09),
      ),
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => Colors.white,
      ),
      textStyle: MaterialStateProperty.resolveWith(
        (states) => const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      alignment: Alignment.center,
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateColor.resolveWith(
        (states) => const Color(0xFF100E09),
      ),
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => Colors.white,
      ),
      alignment: Alignment.center,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    shape: CircleBorder(),
  ),
  dialogTheme: DialogTheme(
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontSize: 13,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    contentTextStyle: TextStyle(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      fontSize: 12,
      color: const Color(0xFF333333),
      fontWeight: FontWeight.w400,
    ),
  ),
  listTileTheme: ListTileThemeData(
    visualDensity: VisualDensity.standard,
    tileColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    titleTextStyle: GoogleFonts.montserrat().copyWith(
      color: Colors.black,
      fontSize: 13,
      fontWeight: FontWeight.w600,
    ),
    subtitleTextStyle: GoogleFonts.montserrat().copyWith(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w500,
    ),
    titleAlignment: ListTileTitleAlignment.titleHeight,
  ),
);

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData myTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
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
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
    shape: CircleBorder(),
  ),
  listTileTheme: ListTileThemeData(
    visualDensity: VisualDensity.standard,
    tileColor: Colors.white,
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

import 'package:finanzas_personales/app/utils/color_manangment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
      //!------------------------------Colores-------------------------------!//
      primaryColor: HexColor('#34cafd'),
      accentColor: HexColor('#ed5477'),
      hintColor: HexColor('#CC0000'),
      primaryColorLight: HexColor('#5A5D70'),
      //!------------------------------texto-------------------------------!//
      textTheme: TextTheme(
        //*------------------ titulo
        headline6: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 15,
          letterSpacing: 3,
          color: HexColor('#5A5D70'),
        ),

        //*------------------ subtitulo nivel 1
        headline5: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: 3,
          color: HexColor('#5A5D70'),
        ),

        //*------------------ subtitulo nivel 2
        headline4: GoogleFonts.ptSerif(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          letterSpacing: 3,
          color: HexColor('#5A5D70'),
        ),

        //*------------------ texto
        bodyText2: GoogleFonts.ptSerif(
          fontWeight: FontWeight.bold,
          fontSize: 12,
          letterSpacing: 3,
          color: HexColor('#5A5D70'),
        ),
      ));

  final darkTheme = ThemeData.dark().copyWith(
      //!------------------------------Colores-------------------------------!//
      primaryColor: HexColor('#531782'),
      accentColor: HexColor('#000f64'),
      hintColor: HexColor('#EB999A'),
      primaryColorLight: HexColor('#edf1fc'),
      //!------------------------------texto-------------------------------!//
      textTheme: TextTheme(
          //*------------------ titulo
          headline6: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            letterSpacing: 3,
            color: HexColor('#EBECEE'),
          ),

          //*------------------ subtitulo nivel 1
          headline5: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 3,
            color: HexColor('#EBECEE'),
          ),

          //*------------------ subtitulo nivel 2
          headline4: GoogleFonts.ptSerif(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            letterSpacing: 3,
            color: HexColor('#EBECEE'),
          ),

          //*------------------ texto
          bodyText2: GoogleFonts.ptSerif(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 3,
            color: HexColor('#EBECEE'),
          ),
          //!------------------------------texto-------------------------------!//
          button: TextStyle(
            backgroundColor: HexColor('#EB999A'),
            color: HexColor('#EB999A'),
          )));
}

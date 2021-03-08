import 'package:finanzas_personales/app/utils/color_manangment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final darkTheme = ThemeData.dark().copyWith(
      //!------------------------------Colores-------------------------------!//
      primaryColor: HexColor('#000f64'),
      accentColor: HexColor('#191F32'),
      hintColor: HexColor('#27CAFF'),
      primaryColorLight: HexColor('#edf1fc'),
      disabledColor: HexColor('#CC0000'),
      unselectedWidgetColor: HexColor('#B2BFD2'),
      //!------------------------------texto-------------------------------!//
      textTheme: TextTheme(
        //*------------------ titulo
        headline6: GoogleFonts.robotoSlab(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: HexColor('#edf1fc'),
        ),

        //*------------------ subtitulo nivel 1
        headline5: GoogleFonts.roboto(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: 3,
          color: HexColor('#edf1fc'),
        ),

        //*------------------ subtitulo nivel 2
        headline4: GoogleFonts.ptSerif(
          //fontWeight: FontWeight.bold,
          fontSize: 14,
          letterSpacing: 3,
          color: HexColor('#edf1fc'),
        ),

        //*------------------ texto
        bodyText2: GoogleFonts.ptSerif(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          letterSpacing: 3,
          color: HexColor('#edf1fc'),
        ),
        //!------------------------------boton-------------------------------!//
      ));

  static final lightTheme = ThemeData.light().copyWith(
      //!------------------------------Colores-------------------------------!//
      primaryColor: HexColor('#edf1fc'),
      accentColor: HexColor('#edf1fc'),
      hintColor: HexColor('#EB999A'),
      primaryColorLight: HexColor('#191F32'),
      disabledColor: HexColor('#27CAFF'),
      unselectedWidgetColor: HexColor('#B2BFD2'),

      //!------------------------------texto-------------------------------!//
      textTheme: TextTheme(
        //*------------------ titulo
        headline6: GoogleFonts.robotoSlab(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          letterSpacing: 1,
          color: HexColor('#27CAFF'),
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
          //fontWeight: FontWeight.bold,
          fontSize: 14,
          letterSpacing: 3,
          color: HexColor('#5A5D70'),
        ),

        //*------------------ texto
        bodyText2: GoogleFonts.ptSerif(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          letterSpacing: 3,
          color: HexColor('#5A5D70'),
        ),
        //!------------------------------boton-------------------------------!//
      ));
}

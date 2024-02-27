//definicion de los temas de estilo de la app
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  //constante de color primario
  static const mainColor = Colors.amber;
  //constate de color de fondo 
  static const backColor = Color.fromARGB(255, 213, 207, 207);

  static const seconColor = Colors.blueAccent;
  //constante de tema
  static final ThemeData lightTheme = ThemeData.light().copyWith(scaffoldBackgroundColor: backColor,
        primaryColor: const Color.fromARGB(255, 247, 222, 3),
        appBarTheme:  AppBarTheme(color:  mainColor,
        titleTextStyle: GoogleFonts.lato(
        color:backColor,
        fontSize: 28.5,
        fontWeight: FontWeight.bold ,
        ),
      ),
      iconTheme: const IconThemeData(
        color: mainColor,
        size: 35.0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(mainColor),
          foregroundColor: MaterialStateProperty.all(Colors.blue),
          textStyle: MaterialStateProperty.all(GoogleFonts.pacifico(
          fontSize: 25.0)
          )
          )
          ),
  textTheme: TextTheme(
    //titulos grandes
    headlineLarge: GoogleFonts.montserrat(
      color: mainColor,
      fontSize: 26.5,
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
      decorationColor: mainColor,
      decorationStyle: TextDecorationStyle.wavy,
      decorationThickness: 1.0,

    ),
    headlineMedium: GoogleFonts.montserrat(
      color: seconColor,
      fontSize: 21.0,
      fontWeight: FontWeight.bold,
      
      ),
    //estilo para subtitulo
    bodySmall: GoogleFonts.amethysta(
      color: seconColor,
      fontSize: 16.0,

    ),
  ),
  );
  

}
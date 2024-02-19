//definicion de los temas de estilo de la app
import 'package:flutter/material.dart';

class AppTheme{
  //constante de color primario
  static const mainColor = Colors.amber;
  //constate de color de fondo 
  static const backColor = Color.fromARGB(255, 213, 207, 207);
  //constante de tema
  static final ThemeData lightTheme = ThemeData.light().copyWith(scaffoldBackgroundColor: backColor,
        primaryColor: const Color.fromARGB(255, 247, 222, 3),
        appBarTheme: const AppBarTheme(color:  mainColor,)
  );
  

}
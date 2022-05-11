import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/constants.dart';

ThemeData appTheme() {
  return ThemeData(
    // scaffoldBackgroundColor: const Color(0xFFEBECF1),
    scaffoldBackgroundColor: kBackgroundColor,
    textTheme: lightTextTheme(),
    appBarTheme: lightAppbarTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: const BorderSide(color: Color(0xFF757575)),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
TextTheme lightTextTheme(){
  return const TextTheme(
    bodyText1:  TextStyle(
      fontFamily: "Reem Kufi",
      color: Color(0xff555555),
    ),
    bodyText2:  TextStyle(
      fontFamily: "Reem Kufi",
      color: Color(0xffafafaf),
    ),
  );
}
AppBarTheme lightAppbarTheme(){
  return const AppBarTheme(
      centerTitle: true,
      color: Colors.white,
      elevation: 7.0,
      titleTextStyle: TextStyle(
        color: Color(0xff555555),
        fontSize: 18,
      ),
  );
}
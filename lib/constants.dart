import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/size_config.dart';

const kEmailNullError = "Email can't empty";
const kPasswordNullError = "Password can't empty";
const kPasswordSort = "Password must longer than 8 digits";
const kSelectedButtonColor = Color(0xFF2D6D5D);
const kDefaultButtonColor = Color(0xFFFFFFFF);
const kPrimaryColor = Color(0xFFDB3022);
const kTextColor1 = Color(0xFF555555);
const kTextColor2 =  Color(0xFFAFAFAF);
const kTextColor3 =  Color(0xFFFFFFFF);
const kBackgroundColor = Color(0xFFF9FAFC);
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(34),
  fontWeight: FontWeight.bold,
);
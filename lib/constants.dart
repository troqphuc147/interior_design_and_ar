import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/screens/profile/components/user_chat.dart';
import 'package:interior_design_and_ar/size_config.dart';

final UserChat adminUserChat = UserChat(
    id: 'SwjRT7M1V1MZJ7OO5ovsmSdvmt73',
    name: 'ARFurni Consultant',
    email: 'arfurni101@gmail.com',
    photoUrl:
        'https://lh3.googleusercontent.com/a-/AOh14Gjn8lS0mOhJ_oYu3HPAIy0_kHD0QoVPykARsnJw=s96-c');

const kEmailNullError = "Email can't empty";
const kPasswordNullError = "Password can't empty";
const kPasswordSort = "Password must longer than 8 digits";
const kSelectedButtonColor = Color(0xFF2D6D5D);
const kDefaultButtonColor = Color(0xFFFFFFFF);
const kPrimaryColor = Color(0xFF2D6D5D);
const kTextColor1 = Color(0xFF555555);
const kTextColor2 = Color(0xFFAFAFAF);
const kTextColor3 = Color(0xFFFFFFFF);
const kTextColor4 = Color(0xFF222222);
const kButtonColors = Color(0xFFADADAD);
const kBackgroundColor = Color(0xFFF9FAFC);
const kBackgroundChipColor = Color(0xFFFFFFFF);
const kAnimationDuration = Duration(milliseconds: 200);
const Map<String, int> kCategoryColors = {
  'Chair': 0xFFDADADA,
  'Table': 0xFFC4C4C4,
  'Lamp': 0xFFE7DCCB,
  'Bed': 0xFFDADADA
};
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(34),
  fontWeight: FontWeight.bold,
);
final List<String> kListCategory = ['Chair', 'Table', 'Lamp', 'Bed'];
final List<String> kListRating = [
  "All",
  "Exellent",
  "Very Good",
  "Good",
  "Satisfactory",
  "Bad"
];
final List<String> kListSort = [
  'Default',
  'Cost ascending',
  'Cost descending',
  'Rating ascending',
  'Rating descending',
];

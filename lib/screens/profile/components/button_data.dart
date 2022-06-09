import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/screens/profile/components/contact_screen.dart';
import 'package:interior_design_and_ar/screens/profile/components/help_guide_screen.dart';
import 'package:interior_design_and_ar/screens/profile/components/rating_product_screen.dart';

import '../../authentication/login_screen.dart';

class ButtonData {
  final String title;
  final String subScription;
  final Widget forcusScreen;
  ButtonData(
      {required this.forcusScreen,
      required this.subScription,
      required this.title});
}

List<ButtonData> listButtonData = [
  ButtonData(
      subScription: "Your rating for a lot of product",
      title: "Your rating",
      forcusScreen: const ListRatedProductsScreen()),
  ButtonData(
      subScription: "If you want to buy something",
      title: "Contact us",
      forcusScreen: const SendQuestionScreen()),
  ButtonData(
      subScription: "Frequently asked questions",
      title: "Help",
      forcusScreen: const HelpAndGuideScreen()),
  ButtonData(
      subScription: "App introduction",
      title: "About us",
      forcusScreen: const ListRatedProductsScreen()),
  ButtonData(
      subScription: "All data of you will be deleted",
      title: "Delete account",
      forcusScreen: const ListRatedProductsScreen()),
  ButtonData(
      subScription: "Your can sign in with other account",
      title: "Sign out",
      forcusScreen: const LoginScreen())
];

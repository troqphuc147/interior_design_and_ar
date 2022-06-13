import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/core/service/auth.dart';
import 'package:interior_design_and_ar/screens/profile/components/about_us_screen.dart';
import 'package:interior_design_and_ar/screens/profile/components/chat_screen.dart';
import 'package:interior_design_and_ar/screens/profile/components/contact_screen.dart';
import 'package:interior_design_and_ar/screens/profile/components/help_guide_screen.dart';
import 'package:interior_design_and_ar/screens/profile/components/rating_product_screen.dart';
import 'package:interior_design_and_ar/screens/profile/components/user_chat.dart';

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
      subScription: "Chat with our support team",
      title: "Chat",
      forcusScreen: Chat(
        currentUserChat: UserChat(
          id: AuthService.instance.getCurrentUser!.uid.toString(),
          name: AuthService.instance.getCurrentUser!.displayName.toString(),
          email: AuthService.instance.getCurrentUser!.email.toString(),
          photoUrl: AuthService.instance.getCurrentUser!.photoURL.toString(),),
        isUserNormalCustomer: true,
      )),
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
      forcusScreen: const AboutScreen()),
  ButtonData(
      subScription: "Your can sign in with other account",
      title: "Sign out",
      forcusScreen: const LoginScreen())
];

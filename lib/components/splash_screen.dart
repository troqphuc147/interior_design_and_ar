import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/screens/home/home_sceen.dart';
import 'package:splashscreen/splashscreen.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      useLoader: false,
      backgroundColor: const Color(0xfff2b533),
      seconds: 5,
      image: Image.asset(
        "assets/images/loading.gif",
      ),
      photoSize: 200,
      navigateAfterSeconds: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/custom_nav_bar.dart';
import 'package:interior_design_and_ar/screens/home/home_sceen.dart';
import 'package:splashscreen/splashscreen.dart';

import '../size_config.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SplashScreen(
      useLoader: false,
      seconds: 5,
      image: Image.asset(
        "assets/images/loading.gif",
      ),
      photoSize: 200,
      navigateAfterSeconds: const CustomNavBar(),
    );
  }
}

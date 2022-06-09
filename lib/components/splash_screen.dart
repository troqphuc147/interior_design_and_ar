import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/custom_nav_bar.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
import '../size_config.dart';

class CustomSplashScreen extends StatelessWidget {
  const CustomSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: const Color(0xffffffff),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(160)),
      child: SplashScreen(
        backgroundColor: const Color(0xffffffff),
        useLoader: false,
        seconds: 5,
        image: Image.asset(
          "assets/images/startApp.gif",
        ),
        photoSize: getProportionateScreenWidth(180),
        navigateAfterSeconds: const CustomNavBar(),
      ),
    );
  }
}

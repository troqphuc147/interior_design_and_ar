import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/screens/home/home_sceen.dart';
import 'package:interior_design_and_ar/screens/product/new_product_screen.dart';
import 'package:interior_design_and_ar/screens/product/popular_product_screen.dart';
import 'package:splashscreen/splashscreen.dart';

class LoadingSplashScreen extends StatelessWidget {
  final String newOrPoplar;
  const LoadingSplashScreen({Key? key, required this.newOrPoplar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      backgroundColor: const Color(0xfff2b533),
      useLoader: true,
      seconds: 5,
      image: Image.asset(
        "assets/images/loading.gif",
      ),
      photoSize: 200,
      navigateAfterSeconds: newOrPoplar=="popular"?PopularProductScreen():NewProductScreen(),
    );
  }
}

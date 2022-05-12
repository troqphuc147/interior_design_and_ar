import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/screens/home/components/list_product_category.dart';
import 'package:splashscreen/splashscreen.dart';

class LoadingSplashScreen extends StatelessWidget {
  final String category;
  const LoadingSplashScreen({Key? key, required this.category})
      : super(key: key);

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
      navigateAfterSeconds: ListProductCategoryScreen(
        category: category,
      ),
    );
  }
}

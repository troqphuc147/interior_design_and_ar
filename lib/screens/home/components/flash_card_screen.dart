import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/screens/home/components/list_product_category_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import '../../../size_config.dart';

class LoadingSplashScreen extends StatelessWidget {
  final String category;
  const LoadingSplashScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffffffff),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(160)),
      child: SplashScreen(
        backgroundColor: const Color(0xffffffff),
        useLoader: false,
        seconds: 5,
        image: Image.asset(
          "assets/images/loading.gif",
        ),
        photoSize: getProportionateScreenWidth(180),
        navigateAfterSeconds: ListProductCategoryScreen(
          category: category,
        ),
      ),
    );
  }
}

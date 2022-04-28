import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/components/home/popular_product_card.dart';
import 'package:interior_design_and_ar/components/loading_screen.dart';
import 'package:interior_design_and_ar/screens/home/home_controller.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import 'package:interior_design_and_ar/size_config.dart';
import '../../core/models/product.dart';

class PopularProductScreen extends StatelessWidget {
  final String category ;
  const PopularProductScreen({Key? key, required this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    return homeController.obx((state) {
      return SafeArea(
          child: Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenWidth(20),
                horizontal: getProportionateScreenWidth(24)),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceAround,
              runAlignment: WrapAlignment.spaceAround,
              spacing: getProportionateScreenWidth(24),
              children: [
                ...List.generate(
                    homeController.listManyPopular.length,
                    (index) {
                  Product product =
                      homeController.listManyPopular[index];
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetail(
                                  product: product, isPopular: "true")));
                    },
                    child: PopularProductCard(
                      product: product,
                      isFavorite: false,
                    ),
                  );
                }),
              ],
            )),
      ));
    }, onLoading: const LoadingScreen());
  }
}

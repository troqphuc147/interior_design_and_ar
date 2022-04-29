import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/components/home/popular_product_card.dart';
import 'package:interior_design_and_ar/screens/home/home_controller.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import 'package:interior_design_and_ar/size_config.dart';
import '../../constants.dart';
import '../../core/models/product.dart';

class PopularProductScreen extends StatefulWidget {
  PopularProductScreen({Key? key}) : super(key: key);

  @override
  State<PopularProductScreen> createState() => _PopularProductScreenState();
}

class _PopularProductScreenState extends State<PopularProductScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return homeController.obx(
      (state) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            backgroundColor: kBackgroundColor,
            title: Text(
              "List Popular Product",
              style: TextStyle(
                  color: kTextColor1,
                  fontWeight: FontWeight.w600,
                  fontSize: getProportionateScreenWidth(18)),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: kTextColor1,
                size: getProportionateScreenWidth(24),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(20),
                  horizontal: getProportionateScreenWidth(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    alignment: WrapAlignment.spaceAround,
                    runAlignment: WrapAlignment.spaceAround,
                    spacing: getProportionateScreenWidth(24),
                    runSpacing: getProportionateScreenWidth(10),
                    children: [
                      ...List.generate(homeController.listManyPopular.length,
                          (index) {
                        return GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                        product: homeController
                                            .listManyPopular[index],
                                        isPopular: "true")));
                          },
                          child: PopularProductCard(
                            product: homeController.listManyPopular[index],
                            isFavorite: false,
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              )),
        ));
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import 'package:interior_design_and_ar/size_config.dart';
import '../../components/product_card.dart';
import '../../constants.dart';

class PopularProductScreen extends StatefulWidget {
  const PopularProductScreen({Key? key}) : super(key: key);

  @override
  State<PopularProductScreen> createState() => _PopularProductScreenState();
}

class _PopularProductScreenState extends State<PopularProductScreen> {
  final MainController homeController = Get.find<MainController>();

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
                                    product:
                                        homeController.listManyPopular[index],
                                    category: "popularMuch",
                                    isFavorite: false,
                                  ),
                                ));
                          },
                          child: SizedBox(
                            height: getProportionateScreenWidth(198),
                            child: PopularProductCard(
                              category: "popularMuch",
                              product: homeController.listManyPopular[index],
                              isFavorite: false,
                            ),
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

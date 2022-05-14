import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import 'package:interior_design_and_ar/size_config.dart';
import '../../components/home/product_card.dart';
import '../../constants.dart';
import '../../core/models/product.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({Key? key}) : super(key: key);

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
              "List New Product",
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
                      ...List.generate(homeController.listManyNew.length,
                          (index) {
                        Product product = homeController.listManyNew[index];
                        return GestureDetector(
                          onTap: () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetail(
                                    product: product,
                                    category: "new",
                                    isFavorite: false,
                                  ),
                                ));
                          },
                          child: PopularProductCard(
                            category: "new",
                            product: product,
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

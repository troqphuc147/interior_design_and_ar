import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import 'package:interior_design_and_ar/size_config.dart';
import '../../components/product_card.dart';
import '../../components/search_bar.dart';
import '../../constants.dart';
import '../../core/models/product.dart';

class NewProductScreen extends StatelessWidget {
  NewProductScreen({Key? key}) : super(key: key);

  final MainController homeController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return homeController.obx(
      (state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kBackgroundColor,
            title: Center(
              child: Container(
                width: getProportionateScreenWidth(375),
                height: getProportionateScreenWidth(58),
                padding: EdgeInsets.only(
                    top: getProportionateScreenWidth(5),
                    bottom: getProportionateScreenWidth(3)),
                child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    color: Colors.white,
                    elevation: 3.5,
                    child: SearchBar(
                      width: 240,
                      listOptions: [],
                      listProduct: homeController.listManyNew,
                    )),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: IconButton(
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
            elevation: 0,
          ),
          body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(20),
                  horizontal: getProportionateScreenWidth(24)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Row(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "New Products",
                            style: TextStyle(
                                color: kTextColor1,
                                fontSize: getProportionateScreenWidth(34),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(18),
                  ),
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
                                    category: "newMuch",
                                    isFavorite: false,
                                  ),
                                ));
                          },
                          child: SizedBox(
                            height: getProportionateScreenWidth(198),
                            child: PopularProductCard(
                              category: "newMuch",
                              product: product,
                              isFavorite: false,
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }
}

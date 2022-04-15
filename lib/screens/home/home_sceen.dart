import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/components/Custom_navigator_bar.dart';
import 'package:interior_design_and_ar/components/home/new_product_card.dart';
import 'package:interior_design_and_ar/components/home/popular_product_card.dart';
import 'package:interior_design_and_ar/components/home/product_category_button.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/enums.dart';
import 'package:interior_design_and_ar/screens/home/home_controller.dart';
import 'package:interior_design_and_ar/screens/loading_screen.dart';
import '../../core/models/product.dart';
import '../../size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    HomeControler homeControler = Get.put(HomeControler());
    return homeControler.obx((state) {
      List<Product> listPopular = homeControler.listPopular;
      List<Product> listNew = homeControler.listNew;
      return Scaffold(
        bottomNavigationBar: const CustomBottomNavBar(
          selectedMenuState: MenuState.home,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                getProportionateScreenWidth(30),
                getProportionateScreenWidth(30),
                0,
                getProportionateScreenWidth(30)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Best Furniture',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(34),
                      color: kTextColor1,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'For Your House',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(34),
                      color: kTextColor1,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(250),
                        height: getProportionateScreenWidth(48),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Theme(
                            data: ThemeData(
                              colorScheme: ThemeData()
                                  .colorScheme
                                  .copyWith(primary: kSelectedButtonColor),
                            ),
                            child: TextFormField(
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                              ),
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                ),
                                hintText: 'Search furniture',
                                contentPadding:
                                    EdgeInsets.fromLTRB(24, 16, 12, 16),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(48),
                        height: getProportionateScreenWidth(48),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Icon(
                            Icons.filter_list,
                            color: Colors.white,
                            size: getProportionateScreenWidth(28),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(16),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(48),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ProductCategoryButton(
                          iconData: Icons.widgets,
                          categoryName: 'All',
                          selected: true),
                      ProductCategoryButton(
                          iconData: Icons.weekend,
                          categoryName: 'Sofa',
                          selected: false),
                      ProductCategoryButton(
                          iconData: Icons.table_restaurant,
                          categoryName: 'Table',
                          selected: false),
                      ProductCategoryButton(
                          iconData: Icons.chair_alt_rounded,
                          categoryName: 'Chair',
                          selected: false),
                      ProductCategoryButton(
                          iconData: Icons.king_bed_outlined,
                          categoryName: 'Bed',
                          selected: false),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(8),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: getProportionateScreenWidth(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Popular',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(20),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  '  More',
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(14),
                                    color: Colors.grey,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_right,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(190),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              listPopular.length,
                              (index) => PopularProductCard(
                                imageLink: listPopular[index].linkImage,
                                productName: listPopular[index].name,
                                rating: listPopular[index].rating,
                                isFavorite: false,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: getProportionateScreenWidth(4),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: getProportionateScreenWidth(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'New',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(20),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  '  More',
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(14),
                                    color: Colors.grey,
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_right,
                                  color: Colors.grey,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(100),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            NewProductCard(
                              imageUrlString:
                                  'https://sage-shop.com/WebRoot/Sage2/Shops/SageShop09/5C65/76B2/3C10/B652/F377/0A0C/05BC/F3AE/sessel_m.jpg',
                              productName: 'Light Grey Sofa Sofa Sofa',
                              rating: 4.9,
                              isFavorite: true,
                            ),
                            NewProductCard(
                              imageUrlString:
                                  'https://sage-shop.com/WebRoot/Sage2/Shops/SageShop09/5C65/76B2/3C10/B652/F377/0A0C/05BC/F3AE/sessel_m.jpg',
                              productName: 'Light Grey Sofa Sofa Sofa',
                              rating: 4.9,
                              isFavorite: false,
                            ),
                            NewProductCard(
                              imageUrlString:
                                  'https://sage-shop.com/WebRoot/Sage2/Shops/SageShop09/5C65/76B2/3C10/B652/F377/0A0C/05BC/F3AE/sessel_m.jpg',
                              productName: 'Light Grey Sofa Sofa Sofa',
                              rating: 4.9,
                              isFavorite: false,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    }, onLoading: LoadingScreen());
  }
}

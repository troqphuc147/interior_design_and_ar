import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/components/home/favorite_product_card.dart';
import 'package:interior_design_and_ar/components/home/product_category_button.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/controller/favorite_controller.dart';
import 'package:interior_design_and_ar/screens/favorite/favorite_loading_screen.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import 'package:interior_design_and_ar/size_config.dart';
import 'package:sticky_headers/sticky_headers.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int selected = 1;
  String category = "All";
  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.put(FavoriteController());
    return favoriteController.obx((state) {
      return SafeArea(
        child: Scaffold(
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
                    'Favorites',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(34),
                        color: kTextColor1,
                        fontWeight: FontWeight.bold),
                  ),
                  StickyHeader(
                    header: Container(
                      color: kBackgroundColor,
                      child: Column(
                        children: [
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
                                            .copyWith(
                                                primary: kSelectedButtonColor),
                                      ),
                                      child: TextFormField(
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(16),
                                        ),
                                        decoration: const InputDecoration(
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                          ),
                                          hintText: 'Search furniture',
                                          contentPadding: EdgeInsets.fromLTRB(
                                              24, 16, 12, 16),
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
                                          borderRadius:
                                              BorderRadius.circular(12)),
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
                                    onTap: () {
                                      setState(() {
                                        selected = 1;
                                        category = "All";
                                      });
                                      favoriteController.loadProduct();
                                    },
                                    iconData: Icons.widgets,
                                    categoryName: 'All',
                                    selected: selected == 1 ? true : false),
                                ProductCategoryButton(
                                    onTap: () {
                                      setState(() {
                                        selected = 2;
                                        category = "Sofa";
                                      });
                                      favoriteController.loadProduct();
                                    },
                                    iconData: Icons.weekend,
                                    categoryName: 'Sofa',
                                    selected: selected == 2 ? true : false),
                                ProductCategoryButton(
                                    onTap: () {
                                      setState(() {
                                        selected = 3;
                                        category = "Table";
                                      });
                                      favoriteController.loadProduct();
                                    },
                                    iconData: Icons.table_restaurant,
                                    categoryName: 'Table',
                                    selected: selected == 3 ? true : false),
                                ProductCategoryButton(
                                    onTap: () {
                                      setState(() {
                                        selected = 4;
                                        category = "Lamp";
                                      });
                                      favoriteController.loadProduct();
                                    },
                                    iconData: Icons.chair_alt_rounded,
                                    categoryName: 'Lamp',
                                    selected: selected == 4 ? true : false),
                                ProductCategoryButton(
                                    onTap: () {
                                      setState(() {
                                        selected = 5;
                                        category = "Bed";
                                      });
                                      favoriteController.loadProduct();
                                    },
                                    iconData: Icons.king_bed_outlined,
                                    categoryName: 'Bed',
                                    selected: selected == 5 ? true : false),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenWidth(16),
                          ),
                        ],
                      ),
                    ),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //TODO implement List.generate after rewrite database.getFavoriteList
                        ...List.generate(
                          favoriteController.listFavorite.length,
                          (index) => Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenWidth(4)),
                            child: GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail(
                                              product: favoriteController
                                                  .listFavorite[index],
                                              isPopular: "true",
                                              isFavorite: false,
                                            )));
                                setState(() {});
                              },
                              child: FavoriteProductCard(
                                imageUrlString: favoriteController
                                    .listFavorite[index].linkImage,
                                productName:
                                    favoriteController.listFavorite[index].name,
                                rating: favoriteController
                                    .listFavorite[index].rating,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }, onLoading: FavoriteLoadingScreen(selected: selected));
  }
}

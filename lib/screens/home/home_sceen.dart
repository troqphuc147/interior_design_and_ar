import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/components/Custom_navigator_bar.dart';
import 'package:interior_design_and_ar/components/home/new_product_card.dart';
import 'package:interior_design_and_ar/components/home/popular_product_card.dart';
import 'package:interior_design_and_ar/components/home/product_category_button.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/enums.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/screens/home/home_loading_screen.dart';
import 'package:interior_design_and_ar/screens/product/loading_plash_screen.dart';
import 'package:interior_design_and_ar/screens/product/popular_product_screen.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import '../../size_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 1;
  String category = "All";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    MainController homeController = Get.put(MainController());
    return homeController.obx((state) {
      return SafeArea(
        child: Scaffold(
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
                            onTap: () {
                              setState(() {
                                selected = 1;
                                category = "All";
                              });
                              homeController.loadProduct("All");
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
                              homeController.loadProduct("Sofa");
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
                              homeController.loadProduct("Table");
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
                              homeController.loadProduct("Lamp");
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
                              homeController.loadProduct("Bed");
                            },
                            iconData: Icons.king_bed_outlined,
                            categoryName: 'Bed',
                            selected: selected == 5 ? true : false),
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
                              onPressed: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoadingSplashScreen(
                                                newOrPoplar: 'popular')));
                                homeController.loadPopularProducts(category);
                              },
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
                                homeController.listPopular.length,
                                (index) => Padding(
                                  padding: EdgeInsets.only(
                                      right: getProportionateScreenWidth(8)),
                                  child: GestureDetector(
                                    onTap: () async {
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetail(
                                                      product:
                                                          homeController
                                                                  .listPopular[
                                                              index],
                                                      isPopular: "true",
                                                      isFavorite: homeController
                                                          .listFavoriteId
                                                          .contains(
                                                              homeController
                                                                  .listPopular[
                                                                      index]
                                                                  .id))));
                                      setState(() {});
                                    },
                                    child: PopularProductCard(
                                      product:
                                          homeController.listPopular[index],
                                      isFavorite: homeController.listFavoriteId
                                          .contains(homeController
                                              .listPopular[index].id),
                                    ),
                                  ),
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
                              onPressed: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoadingSplashScreen(
                                                newOrPoplar: 'new')));
                                homeController.loadNewProducts(category);
                              },
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
                              ...List.generate(
                                homeController.listNew.length,
                                (index) => GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ProductDetail(
                                                product: homeController
                                                    .listNew[index],
                                                isPopular: "false",
                                                isFavorite: homeController
                                                    .listFavoriteId
                                                    .contains(homeController
                                                        .listNew[index].id),
                                              )),
                                    );
                                    homeController.listNew.refresh();
                                    setState(() {});
                                  },
                                  child: NewProductCard(
                                    product: homeController.listNew[index],
                                    isFavorite: homeController.listFavoriteId
                                        .contains(
                                            homeController.listNew[index].id),
                                  ),
                                ),
                              )
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
        ),
      );
    }, onLoading: HomeLoadingScreen(selected: selected));
  }
}

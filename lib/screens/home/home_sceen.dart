import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/components/home/new_product_card.dart';
import 'package:interior_design_and_ar/components/home/popular_product_card.dart';
import 'package:interior_design_and_ar/components/home/product_category_button.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/screens/home/components/category_line.dart';
import 'package:interior_design_and_ar/screens/home/components/home_loading_screen.dart';
import 'package:interior_design_and_ar/screens/product/loading_plash_screen.dart';
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
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getProportionateScreenWidth(230),
                width: getProportionateScreenWidth(375),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(30),
                    vertical: getProportionateScreenWidth(15)),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/background_home.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: getProportionateScreenWidth(15),
                    ),
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
                    const Spacer(),
                    SizedBox(
                      width: getProportionateScreenWidth(375),
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
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.w400,
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
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: getProportionateScreenWidth(10),
                  left: getProportionateScreenWidth(30),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(24),
                          fontWeight: FontWeight.w600,
                          color: kTextColor1),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(8),
                    ),
                    CategoryLine(),
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
                                  fontSize: getProportionateScreenWidth(24),
                                  color: kTextColor1,
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
                                        fontSize:
                                            getProportionateScreenWidth(14),
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
                                                builder: (context) => ProductDetail(
                                                    product: homeController
                                                        .listPopular[index],
                                                    isPopular: "true",
                                                    isFavorite: homeController
                                                        .listFavoriteId
                                                        .contains(homeController
                                                            .listPopular[index]
                                                            .id))));
                                        setState(() {});
                                      },
                                      child: PopularProductCard(
                                        product:
                                            homeController.listPopular[index],
                                        isFavorite: homeController
                                            .listFavoriteId
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
                                  fontSize: getProportionateScreenWidth(24),
                                  color: kTextColor1,
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
                                        fontSize:
                                            getProportionateScreenWidth(14),
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
            ],
          ),
        ),
      );
    }, onLoading: const HomeLoadingScreen());
  }
}

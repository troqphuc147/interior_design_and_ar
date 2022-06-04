import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/components/new_product_card.dart';
import 'package:interior_design_and_ar/components/search_bar.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/controller/favorite_controller.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/screens/home/components/category_line.dart';
import 'package:interior_design_and_ar/screens/home/components/home_loading_screen.dart';
import 'package:interior_design_and_ar/screens/product/loading_plash_screen.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import '../../components/product_card.dart';
import '../../size_config.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();
  final category = "All";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    MainController homeController = Get.put(MainController(), permanent: false);
    FavoriteController favoriteController =
        Get.put(FavoriteController(), permanent: false);
    return homeController.obx((state) {
      return GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
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
                        child: SearchBar(
                          width: 315,
                          listOptions: homeController.listOption,
                          listProduct: [],
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
                                    homeController
                                        .loadPopularProducts(category);
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
                            height: getProportionateScreenWidth(198),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    homeController.listPopular.length,
                                    (index) => Padding(
                                      padding: EdgeInsets.only(
                                          right:
                                              getProportionateScreenWidth(8)),
                                      child: Obx(
                                        () => GestureDetector(
                                          onTap: () async {
                                            await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => ProductDetail(
                                                        product: homeController
                                                            .listPopular[index],
                                                        category: "popular",
                                                        isFavorite: homeController
                                                            .listFavoriteId
                                                            .contains(
                                                                homeController
                                                                    .listPopular[
                                                                        index]
                                                                    .id))));
                                          },
                                          child: PopularProductCard(
                                            product: homeController
                                                .listPopular[index],
                                            category: "popular",
                                            isFavorite: homeController
                                                .listFavoriteId
                                                .contains(homeController
                                                    .listPopular[index].id),
                                          ),
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
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ...List.generate(
                                    homeController.listNew.length,
                                    (index) => Obx(
                                      () => GestureDetector(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProductDetail(
                                                      product: homeController
                                                          .listNew[index],
                                                      category: "new",
                                                      isFavorite: homeController
                                                          .listFavoriteId
                                                          .contains(
                                                              homeController
                                                                  .listNew[
                                                                      index]
                                                                  .id),
                                                    )),
                                          );
                                        },
                                        child: NewProductCard(
                                          product:
                                              homeController.listNew[index],
                                          category: "new",
                                          isFavorite: homeController
                                              .listFavoriteId
                                              .contains(homeController
                                                  .listNew[index].id),
                                        ),
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
        ),
      );
    }, onLoading: const HomeLoadingScreen());
  }
}

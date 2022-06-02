import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/components/home/new_product_card.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/controller/favorite_controller.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/screens/home/components/category_line.dart';
import 'package:interior_design_and_ar/screens/home/components/home_loading_screen.dart';
import 'package:interior_design_and_ar/screens/product/loading_plash_screen.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import '../../components/home/product_card.dart';
import '../../size_config.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ScrollController scrollController = ScrollController();
  final category = "All";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    MainController homeController = Get.put(MainController(), permanent: true);
    FavoriteController favoriteController =
        Get.put(FavoriteController(), permanent: true);
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
                              child: Autocomplete<String>(
                                fieldViewBuilder: (context, controller,
                                    focusNode, onEditingComplete) {
                                  return TextFormField(
                                    controller: controller,
                                    focusNode: focusNode,
                                    onEditingComplete: onEditingComplete,
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
                                    onChanged: (String text) {},
                                    onFieldSubmitted: (String text) {
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                  );
                                },
                                optionsMaxHeight:
                                    getProportionateScreenWidth(200),
                                optionsBuilder:
                                    (TextEditingValue textEditingValue) {
                                  if (textEditingValue.text.isEmpty) {
                                    return const Iterable<String>.empty();
                                  }
                                  return homeController.listOption
                                      .where((String option) {
                                    return option.contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                onSelected: (String selection) {
                                  debugPrint('You just selected $selection');
                                },
                                optionsViewBuilder:
                                    (context, onSelected, options) {
                                  return Align(
                                    alignment: Alignment.topLeft,
                                    child: Material(
                                      color: Colors.transparent,
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top:
                                                getProportionateScreenWidth(5)),
                                        width: getProportionateScreenWidth(315),
                                        height:
                                            getProportionateScreenWidth(200),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(15),
                                                    bottomLeft:
                                                        Radius.circular(15)),
                                            boxShadow: [
                                              BoxShadow(
                                                  offset: const Offset(1, 1),
                                                  blurRadius: 4.0,
                                                  color: Colors.grey
                                                      .withOpacity(0.45)),
                                              BoxShadow(
                                                  offset: const Offset(-1, 0),
                                                  blurRadius: 4.0,
                                                  color: Colors.grey
                                                      .withOpacity(0.45))
                                            ]),
                                        child: Scrollbar(
                                          controller: scrollController,
                                          isAlwaysShown: true,
                                          child: ListView.builder(
                                            controller: scrollController,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            itemCount: options.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              final String option =
                                                  options.elementAt(index);

                                              return GestureDetector(
                                                onTap: () {
                                                  onSelected(option);
                                                  FocusScope.of(context)
                                                      .unfocus();
                                                  Product product =
                                                      homeController
                                                          .getSeachedProduct(
                                                              option);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductDetail(
                                                                  product:
                                                                      product,
                                                                  category:
                                                                      "non",
                                                                  isFavorite: homeController
                                                                      .listFavoriteId
                                                                      .contains(
                                                                          product
                                                                              .id))));
                                                },
                                                child: ListTile(
                                                  title: Text(option,
                                                      style: TextStyle(
                                                          fontSize:
                                                              getProportionateScreenWidth(
                                                                  14),
                                                          color: kTextColor1,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )),
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

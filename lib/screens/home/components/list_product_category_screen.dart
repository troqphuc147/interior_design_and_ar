import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:interior_design_and_ar/components/search_bar.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/screens/home/components/list_product_category_loading_screen.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import 'package:interior_design_and_ar/size_config.dart';

import '../../../components/product_card.dart';
import '../../../constants.dart';

class ListProductCategoryScreen extends StatefulWidget {
  final String category;
  const ListProductCategoryScreen({Key? key, required this.category})
      : super(key: key);

  @override
  State<ListProductCategoryScreen> createState() =>
      _ListProductCategoryScreenState();
}

class _ListProductCategoryScreenState extends State<ListProductCategoryScreen> {
  final MainController homeController = Get.find<MainController>();
  String rating = "All";
  String ratingGroup = "All";
  double min = 1;
  double max = 500;
  late RangeValues values;
  late RangeValues fakeValues;
  List<String> listCategorySelected = [];
  List<String> fakeListCategory = [];
  @override
  void initState() {
    super.initState();
    listCategorySelected.addAll(kListCategory);
    values = RangeValues(min, max);
    fakeValues = const RangeValues(0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return homeController.obx((state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: Container(
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
                  listProduct: homeController.listManyShowedNew,
                )),
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
          actions: [
            Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      setState(() {
                        fakeValues = RangeValues(min, max);
                        rating = ratingGroup;
                      });
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: Icon(
                      Icons.filter_alt,
                      color: kTextColor1,
                      size: getProportionateScreenWidth(24),
                    )))
          ],
          elevation: 0,
        ),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(24)),
          child: Column(
            children: [
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.category,
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
                height: getProportionateScreenWidth(25),
              ),
              Expanded(
                child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
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
                            ...List.generate(
                                homeController.listManyShowedNew.length,
                                (index) {
                              return Obx(
                                () => GestureDetector(
                                  onTap: () async {
                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ProductDetail(
                                            product: homeController
                                                .listManyShowedNew[index],
                                            category: "category",
                                            isFavorite: homeController
                                                .listFavoriteId
                                                .contains(
                                              homeController
                                                  .listManyShowedNew[index].id,
                                            ),
                                          ),
                                        ));
                                  },
                                  child: SizedBox(
                                    height: getProportionateScreenWidth(198),
                                    child: PopularProductCard(
                                        product: homeController
                                            .listManyShowedNew[index],
                                        category: "non",
                                        isFavorite: homeController
                                            .listFavoriteId
                                            .contains(
                                          homeController
                                              .listManyShowedNew[index].id,
                                        )),
                                  ),
                                ),
                              );
                            }),
                          ],
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(25),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
        endDrawer: Drawer(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                      color: kTextColor1,
                      fontSize: getProportionateScreenWidth(24),
                      fontWeight: FontWeight.w500),
                ),
                Expanded(
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Text(
                        "Ratings",
                        style: TextStyle(
                            color: kTextColor2,
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      RadioGroup<String>.builder(
                        groupValue: rating,
                        onChanged: (value) => setState(() {
                          rating = value!;
                        }),
                        items: kListRating,
                        itemBuilder: (item) => RadioButtonBuilder(item,
                            textPosition: RadioButtonTextPosition.left),
                        textStyle: TextStyle(
                            color: kTextColor1,
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.w500),
                        activeColor: kSelectedButtonColor,
                      ),
                      Divider(
                        thickness: getProportionateScreenWidth(1),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(15),
                      ),
                      Text(
                        "Cost",
                        style: TextStyle(
                            color: kTextColor2,
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(15),
                      ),
                      Container(
                        height: getProportionateScreenWidth(40),
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Min: \$" + min.toInt().toString(),
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14),
                                  color: kTextColor1),
                            ),
                            Text(
                              "Max: \$" + max.toInt().toString(),
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14),
                                  color: kTextColor1),
                            ),
                          ],
                        ),
                      ),
                      RangeSlider(
                        divisions: 500,
                        inactiveColor: kTextColor2,
                        activeColor: kSelectedButtonColor,
                        min: 0,
                        max: 500,
                        values: fakeValues,
                        onChanged: (RangeValues v) {
                          setState(() {
                            if (v.end - v.start >= 20) {
                              fakeValues = v;
                            } else {
                              if (v.start == values.start) {
                                fakeValues = RangeValues(
                                    fakeValues.start, fakeValues.start + 20);
                              } else {
                                fakeValues = RangeValues(
                                    fakeValues.end - 20, fakeValues.end);
                              }
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(40),
                ),
                Container(
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(375),
                  margin:
                      EdgeInsets.only(bottom: getProportionateScreenWidth(30)),
                  decoration: BoxDecoration(
                    color: kSelectedButtonColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                      onPressed: () async {
                        setState(() {
                          values = fakeValues;
                          min = fakeValues.start;
                          max = fakeValues.end;
                          ratingGroup = rating;
                        });
                        List<String> list = [];
                        list.add(widget.category);
                        await homeController.filterNewProduct(
                            rating, values, list);
                        Navigator.pop(context);
                      },
                      child: Text("Apply",
                          style: TextStyle(
                            color: kTextColor3,
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.w600,
                          ))),
                ),
              ],
            ),
          ),
        ),
      );
    }, onLoading: ListProductCategoryLoadingScreen(category: widget.category));
  }
}

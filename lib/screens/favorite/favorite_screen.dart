import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:interior_design_and_ar/screens/favorite/components/favorite_product_card.dart';
import 'package:interior_design_and_ar/components/loading_screen.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/controller/favorite_controller.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import 'package:interior_design_and_ar/size_config.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  String rating = "All";
  String ratingGroup = "All";
  double min = 30;
  double max = 200;
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
    FavoriteController favoriteController = Get.find<FavoriteController>();
    return favoriteController.obx((state) {
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(30),
              getProportionateScreenWidth(30), 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Text(
                'Favorites',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(34),
                    color: kTextColor1,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(315),
                    height: getProportionateScreenWidth(48),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(-1, 1),
                              color: Colors.grey.withOpacity(0.24),
                              spreadRadius: 2.0,
                              blurRadius: 1.5,
                            )
                          ]),
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
                            contentPadding: EdgeInsets.fromLTRB(24, 16, 12, 16),
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
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Container(
                height: getProportionateScreenWidth(35),
                width: getProportionateScreenWidth(315),
                margin:
                    EdgeInsets.only(bottom: getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                    color: const Color(0xFFEBECF1),
                    borderRadius: BorderRadius.circular(50)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () => {
                            setState(() {
                              rating = ratingGroup;
                              fakeValues = RangeValues(min, max);
                              fakeListCategory.addAll(listCategorySelected);
                            }),
                            Scaffold.of(context).openDrawer(),
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/filter.svg",
                                color: kTextColor1,
                              ),
                              Text(
                                "Filter",
                                style: TextStyle(
                                  color: kTextColor1,
                                  fontSize: getProportionateScreenWidth(14),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () => Scaffold.of(context).openEndDrawer(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              SvgPicture.asset(
                                "assets/icons/sort.svg",
                                color: kTextColor1,
                              ),
                              Text(
                                "Sort: Default",
                                style: TextStyle(
                                  color: kTextColor1,
                                  fontSize: getProportionateScreenWidth(14),
                                ),
                              )
                            ],
                          ),
                        );
                      })
                    ]),
              ),
              SizedBox(
                height: getProportionateScreenWidth(16),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.only(
                      left: getProportionateScreenWidth(3),
                      bottom: getProportionateScreenWidth(20)),
                  child: Obx(
                    () => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...List.generate(
                          favoriteController.listShowedProduct.length,
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
                                                  .listShowedProduct[index],
                                              category: "favorite",
                                              isFavorite: true,
                                            )));
                                setState(() {});
                              },
                              child: FavoriteProductCard(
                                product:
                                    favoriteController.listShowedProduct[index],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
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
                      Divider(
                        thickness: getProportionateScreenWidth(1),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(15),
                      ),
                      Text(
                        "Category",
                        style: TextStyle(
                            color: kTextColor2,
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(15),
                      ),
                      Column(children: [
                        ...List.generate(
                            kListCategory.length,
                            (index) => SizedBox(
                                  height: getProportionateScreenWidth(35),
                                  child: CheckboxListTile(
                                    value: fakeListCategory
                                        .contains(kListCategory[index]),
                                    onChanged: (value) {
                                      setState(() {
                                        if (value != null) {
                                          if (value) {
                                            fakeListCategory
                                                .add(kListCategory[index]);
                                          } else {
                                            fakeListCategory
                                                .remove(kListCategory[index]);
                                          }
                                        }
                                      });
                                    },
                                    title: Text(
                                      kListCategory[index],
                                      style: TextStyle(
                                          color: kTextColor1,
                                          fontSize:
                                              getProportionateScreenWidth(18),
                                          fontWeight: FontWeight.w500),
                                    ),
                                    activeColor: kSelectedButtonColor,
                                  ),
                                ))
                      ]),
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
                          listCategorySelected.clear();
                          listCategorySelected.addAll(fakeListCategory);
                          values = fakeValues;
                          min = fakeValues.start;
                          max = fakeValues.end;
                          ratingGroup = rating;
                        });
                        await favoriteController.filterProduct(
                            rating, values, fakeListCategory);
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
        endDrawer: Drawer(
          child: Container(),
        ),
      );
    }, onLoading: const LoadingScreen());
  }
}

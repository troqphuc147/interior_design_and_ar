import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:interior_design_and_ar/components/home/popular_product_card.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import 'package:interior_design_and_ar/size_config.dart';

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
  final MainController homeController = Get.put(MainController());
  String ratingGroup = "All";
  List<String> rating = ["Exellent", "Very Good", "Good", "Satisfactory"];
  double min = 30;
  double max = 200;
  late RangeValues values;
  @override
  void initState() {
    super.initState();
    values = RangeValues(min, max);
  }

  @override
  Widget build(BuildContext context) {
    return homeController.obx(
      (state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kBackgroundColor,
            title: SizedBox(
              width: getProportionateScreenWidth(375),
              height: getProportionateScreenWidth(48),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                color: Colors.white,
                elevation: 5.0,
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
                      contentPadding: EdgeInsets.fromLTRB(24, 16, 12, 16),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      suffixIcon: Icon(
                        Icons.search,
                      ),
                    ),
                  ),
                ),
              ),
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
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                      icon: Icon(
                        Icons.filter_alt,
                        color: kTextColor1,
                        size: getProportionateScreenWidth(24),
                      )))
            ],
            elevation: 0,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24)),
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
                            return GestureDetector(
                              onTap: () async {
                                await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetail(
                                        product:
                                            homeController.listManyNew[index],
                                        isPopular: "true",
                                        isFavorite: false,
                                      ),
                                    ));
                              },
                              child: PopularProductCard(
                                product: homeController.listManyNew[index],
                                isFavorite: false,
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
              child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: getProportionateScreenWidth(10),
                ),
                Text(
                  "Filter",
                  style: TextStyle(
                      color: kTextColor1,
                      fontSize: getProportionateScreenWidth(24),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(20),
                ),
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
                  groupValue: ratingGroup,
                  onChanged: (value) => setState(() {
                    ratingGroup = value!;
                  }),
                  items: rating,
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
                  "Ratings",
                  style: TextStyle(
                      color: kTextColor2,
                      fontSize: getProportionateScreenWidth(16),
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(15),
                ),
                Padding(
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
                        ),
                      ),
                      Text(
                        "Max: \$" + max.toInt().toString(),
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                        ),
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
                  values: values,
                  onChanged: (RangeValues v) {
                    setState(() {
                      if (v.end - v.start >= 20) {
                        values = v;
                      } else {
                        if (v.start == values.start) {
                          values = RangeValues(values.start, values.start + 20);
                        } else {
                          values = RangeValues(values.end - 20, values.end);
                        }
                      }
                      min = values.start;
                      max = values.end;
                    });
                  },
                ),
                Divider(
                  thickness: getProportionateScreenWidth(1),
                ),
                const Spacer(),
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
                      onPressed: () {},
                      child: Text("Apply",
                          style: TextStyle(
                            color: kTextColor3,
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.w600,
                          ))),
                )
              ],
            ),
          )),
        );
      },
    );
  }
}

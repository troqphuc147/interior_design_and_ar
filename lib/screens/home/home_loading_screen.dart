import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../components/Custom_navigator_bar.dart';
import '../../components/home/product_category_button.dart';
import '../../constants.dart';
import '../../enums.dart';
import '../../size_config.dart';

class HomeLoadingScreen extends StatelessWidget {
  final int selected;
  const HomeLoadingScreen({Key? key, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                          iconData: Icons.widgets,
                          categoryName: 'All',
                          selected: selected == 1 ? true : false),
                      ProductCategoryButton(
                          iconData: Icons.weekend,
                          categoryName: 'Sofa',
                          selected: selected == 2 ? true : false),
                      ProductCategoryButton(
                          iconData: Icons.table_restaurant,
                          categoryName: 'Table',
                          selected: selected == 3 ? true : false),
                      ProductCategoryButton(
                          iconData: Icons.chair_alt_rounded,
                          categoryName: 'Light',
                          selected: selected == 4 ? true : false),
                      ProductCategoryButton(
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
                      padding:
                          EdgeInsets.only(right: getProportionateScreenWidth(10)),
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
                      child: const Center(
                        child: SpinKitPouringHourGlassRefined(
                          color: kSelectedButtonColor,
                          size: 40.0,
                        )
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
                      padding:
                          EdgeInsets.only(right: getProportionateScreenWidth(10)),
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
                      child: const Center(
                        child: SpinKitPouringHourGlassRefined(
                          color: kSelectedButtonColor,
                          size: 40.0,
                        )
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
  }
}

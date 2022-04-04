import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/components/Custom_navigator_bar.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/enums.dart';

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
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(selectedMenuState: MenuState.home,),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(30), getProportionateScreenWidth(30),
                0, 0),
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
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'For Your House',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(34),
                      color: kTextColor1,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: getProportionateScreenWidth(20),),

                Padding(
                  padding: const EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(250),
                        height: getProportionateScreenWidth(64),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Theme(
                            data: ThemeData(
                              colorScheme: ThemeData().colorScheme.copyWith(
                                primary: kSelectedButtonColor
                              ),
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
                                prefixIcon: Icon(Icons.search,),
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
                SizedBox(height: getProportionateScreenWidth(16),),

                SizedBox(
                  height: getProportionateScreenWidth(48),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(30)),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            minimumSize: Size(getProportionateScreenWidth(80), getProportionateScreenWidth(48)),
                            backgroundColor: kSelectedButtonColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.widgets,
                                color: Colors.white,
                                size: getProportionateScreenWidth(24),
                              ),
                              const Text(
                                '   All   ',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              minimumSize: Size(getProportionateScreenWidth(80), getProportionateScreenWidth(48)),
                              backgroundColor: kDefaultButtonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.weekend,
                                  color: Colors.grey,
                                  size: getProportionateScreenWidth(24),
                                ),
                                const Text(
                                  '   Sofa   ',
                                  style: TextStyle(
                                    color: kTextColor1,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              minimumSize: Size(getProportionateScreenWidth(80), getProportionateScreenHeight(48)),
                              backgroundColor: kDefaultButtonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.table_restaurant,
                                  color: Colors.grey,
                                  size: getProportionateScreenWidth(24),
                                ),
                                const Text(
                                  '   Table   ',
                                  style: TextStyle(
                                    color: kTextColor1,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              minimumSize: Size(getProportionateScreenWidth(80), getProportionateScreenHeight(48)),
                              backgroundColor: kDefaultButtonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.chair_alt_rounded,
                                  color: Colors.grey,
                                  size: getProportionateScreenWidth(24),
                                ),
                                const Text(
                                  '   Chair   ',
                                  style: TextStyle(
                                    color: kTextColor1,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              minimumSize: Size(getProportionateScreenWidth(80), getProportionateScreenHeight(48)),
                              backgroundColor: kDefaultButtonColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.king_bed_outlined,
                                  color: Colors.grey,
                                  size: getProportionateScreenWidth(24),
                                ),
                                const Text(
                                  '   Bed   ',
                                  style: TextStyle(
                                    color: kTextColor1,
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(10),),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
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
                                const Icon(Icons.arrow_right, color: Colors.grey,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(190),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              child: SizedBox(
                                width: getProportionateScreenWidth(140),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(10), 0, getProportionateScreenWidth(10)),
                                            child: Image.asset(
                                              'assets/images/sofa_model.png',
                                              height: getProportionateScreenHeight(110),
                                              width: getProportionateScreenWidth(110),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          // mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SizedBox(
                                              width: getProportionateScreenWidth(32),
                                              height: getProportionateScreenWidth(32),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.favorite_outline,
                                                  color: Colors.grey,
                                                  size: getProportionateScreenWidth(16),
                                                ),
                                                style: TextButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  primary: kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Light Grey Sofa Sofa Sofa',
                                                  style: TextStyle(
                                                    fontSize: getProportionateScreenWidth(12),
                                                    color: kTextColor1,
                                                    fontWeight: FontWeight.w700
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                ),
                                                SizedBox(height: getProportionateScreenHeight(4),),
                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.star, color: Colors.amber, size: getProportionateScreenWidth(14),),
                                                    Text(
                                                      '  4.9',
                                                      style: TextStyle(
                                                        fontSize: getProportionateScreenWidth(12),
                                                        color: kTextColor1,
                                                        fontWeight: FontWeight.w700
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(4), 0, getProportionateScreenWidth(4), 0),
                                            child: SizedBox(
                                              height: getProportionateScreenWidth(32),
                                              width: getProportionateScreenWidth(32),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: kPrimaryColor,
                                                  size: getProportionateScreenWidth(14),
                                                ),
                                                style: TextButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  // backgroundColor: kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),


                          Padding(
                            padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              child: Container(
                                width: getProportionateScreenWidth(140),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(10), 0, getProportionateScreenWidth(10)),
                                            child: Image.asset(
                                              'assets/images/sofa_model.png',
                                              height: getProportionateScreenHeight(110),
                                              width: getProportionateScreenWidth(110),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          // mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SizedBox(
                                              width: getProportionateScreenWidth(32),
                                              height: getProportionateScreenWidth(32),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.favorite_outline,
                                                  color: Colors.grey,
                                                  size: getProportionateScreenWidth(16),
                                                ),
                                                style: TextButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  primary: kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Light Grey Sofa Sofa Sofa',
                                                  style: TextStyle(
                                                      fontSize: getProportionateScreenWidth(12),
                                                      color: kTextColor1,
                                                      fontWeight: FontWeight.w700
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                ),
                                                SizedBox(height: getProportionateScreenHeight(4),),
                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.star, color: Colors.amber, size: getProportionateScreenWidth(14),),
                                                    Text(
                                                      '  4.9',
                                                      style: TextStyle(
                                                          fontSize: getProportionateScreenWidth(12),
                                                          color: kTextColor1,
                                                          fontWeight: FontWeight.w700
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(4), 0, getProportionateScreenWidth(4), 0),
                                            child: SizedBox(
                                              height: getProportionateScreenWidth(32),
                                              width: getProportionateScreenWidth(32),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: kPrimaryColor,
                                                  size: getProportionateScreenWidth(14),
                                                ),
                                                style: TextButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  // backgroundColor: kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              child: Container(
                                width: getProportionateScreenWidth(140),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(10), 0, getProportionateScreenWidth(10)),
                                            child: Image.asset(
                                              'assets/images/sofa_model.png',
                                              height: getProportionateScreenHeight(110),
                                              width: getProportionateScreenWidth(110),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          // mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SizedBox(
                                              width: getProportionateScreenWidth(32),
                                              height: getProportionateScreenWidth(32),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.favorite_outline,
                                                  color: Colors.grey,
                                                  size: getProportionateScreenWidth(16),
                                                ),
                                                style: TextButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  primary: kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Light Grey Sofa Sofa Sofa',
                                                  style: TextStyle(
                                                      fontSize: getProportionateScreenWidth(12),
                                                      color: kTextColor1,
                                                      fontWeight: FontWeight.w700
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                ),
                                                SizedBox(height: getProportionateScreenHeight(4),),
                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.star, color: Colors.amber, size: getProportionateScreenWidth(14),),
                                                    Text(
                                                      '  4.9',
                                                      style: TextStyle(
                                                          fontSize: getProportionateScreenWidth(12),
                                                          color: kTextColor1,
                                                          fontWeight: FontWeight.w700
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(4), 0, getProportionateScreenWidth(4), 0),
                                            child: SizedBox(
                                              height: getProportionateScreenWidth(32),
                                              width: getProportionateScreenWidth(32),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: kPrimaryColor,
                                                  size: getProportionateScreenWidth(14),
                                                ),
                                                style: TextButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  // backgroundColor: kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              child: Container(
                                width: getProportionateScreenWidth(140),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Center(
                                          child: Padding(
                                            padding: EdgeInsets.fromLTRB(0, getProportionateScreenHeight(10), 0, getProportionateScreenWidth(10)),
                                            child: Image.asset(
                                              'assets/images/sofa_model.png',
                                              height: getProportionateScreenHeight(110),
                                              width: getProportionateScreenWidth(110),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          // mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SizedBox(
                                              width: getProportionateScreenWidth(32),
                                              height: getProportionateScreenWidth(32),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.favorite_outline,
                                                  color: Colors.grey,
                                                  size: getProportionateScreenWidth(16),
                                                ),
                                                style: TextButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  primary: kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Padding(
                                      padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Light Grey Sofa Sofa Sofa',
                                                  style: TextStyle(
                                                      fontSize: getProportionateScreenWidth(12),
                                                      color: kTextColor1,
                                                      fontWeight: FontWeight.w700
                                                  ),
                                                  overflow: TextOverflow.clip,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                ),
                                                SizedBox(height: getProportionateScreenHeight(4),),
                                                Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Icon(Icons.star, color: Colors.amber, size: getProportionateScreenWidth(14),),
                                                    Text(
                                                      '  4.9',
                                                      style: TextStyle(
                                                          fontSize: getProportionateScreenWidth(12),
                                                          color: kTextColor1,
                                                          fontWeight: FontWeight.w700
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(4), 0, getProportionateScreenWidth(4), 0),
                                            child: SizedBox(
                                              height: getProportionateScreenWidth(32),
                                              width: getProportionateScreenWidth(32),
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: kPrimaryColor,
                                                  size: getProportionateScreenWidth(14),
                                                ),
                                                style: TextButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  // backgroundColor: kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(0),),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
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
                                const Icon(Icons.arrow_right, color: Colors.grey,),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      height: getProportionateScreenHeight(100),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              child: Container(
                                width: getProportionateScreenWidth(250),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        // color: Colors.amberAccent,
                                        child: Image.asset(
                                          'assets/images/sofa_model.png',
                                          width: getProportionateScreenWidth(100),
                                          height: getProportionateScreenHeight(100),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          // color: Colors.greenAccent,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  // color: Colors.redAccent,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            width: getProportionateScreenWidth(90),
                                                            child: Text(
                                                              'Light Grey Sofa Sofa Sofa',
                                                              style: TextStyle(
                                                                  fontSize: getProportionateScreenWidth(12),
                                                                  color: kTextColor1,
                                                                  fontWeight: FontWeight.w700
                                                              ),
                                                              overflow: TextOverflow.clip,
                                                              maxLines: 1,
                                                              softWrap: false,
                                                            ),
                                                          ),
                                                          SizedBox(height: getProportionateScreenHeight(4),),
                                                          Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Icon(Icons.star, color: Colors.amber, size: getProportionateScreenWidth(14),),
                                                              Text(
                                                                '  4.9',
                                                                style: TextStyle(
                                                                    fontSize: getProportionateScreenWidth(12),
                                                                    color: kTextColor1,
                                                                    fontWeight: FontWeight.w700
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.amberAccent,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: getProportionateScreenWidth(32),
                                                        height: getProportionateScreenWidth(32),
                                                        child: TextButton(
                                                          onPressed: () {},
                                                          child: Icon(
                                                            Icons.favorite_outline,
                                                            color: Colors.grey,
                                                            size: getProportionateScreenWidth(16),
                                                          ),
                                                          style: TextButton.styleFrom(
                                                            shape: const CircleBorder(),
                                                            primary: kPrimaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              child: Container(
                                width: getProportionateScreenWidth(250),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        // color: Colors.amberAccent,
                                        child: Image.asset(
                                          'assets/images/sofa_model.png',
                                          width: getProportionateScreenWidth(100),
                                          height: getProportionateScreenHeight(100),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          // color: Colors.greenAccent,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  // color: Colors.redAccent,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            width: getProportionateScreenWidth(90),
                                                            child: Text(
                                                              'Light Grey Sofa Sofa Sofa',
                                                              style: TextStyle(
                                                                  fontSize: getProportionateScreenWidth(12),
                                                                  color: kTextColor1,
                                                                  fontWeight: FontWeight.w700
                                                              ),
                                                              overflow: TextOverflow.clip,
                                                              maxLines: 1,
                                                              softWrap: false,
                                                            ),
                                                          ),
                                                          SizedBox(height: getProportionateScreenHeight(4),),
                                                          Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Icon(Icons.star, color: Colors.amber, size: getProportionateScreenWidth(14),),
                                                              Text(
                                                                '  4.9',
                                                                style: TextStyle(
                                                                    fontSize: getProportionateScreenWidth(12),
                                                                    color: kTextColor1,
                                                                    fontWeight: FontWeight.w700
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.amberAccent,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: getProportionateScreenWidth(32),
                                                        height: getProportionateScreenWidth(32),
                                                        child: TextButton(
                                                          onPressed: () {},
                                                          child: Icon(
                                                            Icons.favorite_outline,
                                                            color: Colors.grey,
                                                            size: getProportionateScreenWidth(16),
                                                          ),
                                                          style: TextButton.styleFrom(
                                                            shape: const CircleBorder(),
                                                            primary: kPrimaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              child: Container(
                                width: getProportionateScreenWidth(250),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        // color: Colors.amberAccent,
                                        child: Image.asset(
                                          'assets/images/sofa_model.png',
                                          width: getProportionateScreenWidth(100),
                                          height: getProportionateScreenHeight(100),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          // color: Colors.greenAccent,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  // color: Colors.redAccent,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            width: getProportionateScreenWidth(90),
                                                            child: Text(
                                                              'Light Grey Sofa Sofa Sofa',
                                                              style: TextStyle(
                                                                  fontSize: getProportionateScreenWidth(12),
                                                                  color: kTextColor1,
                                                                  fontWeight: FontWeight.w700
                                                              ),
                                                              overflow: TextOverflow.clip,
                                                              maxLines: 1,
                                                              softWrap: false,
                                                            ),
                                                          ),
                                                          SizedBox(height: getProportionateScreenHeight(4),),
                                                          Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Icon(Icons.star, color: Colors.amber, size: getProportionateScreenWidth(14),),
                                                              Text(
                                                                '  4.9',
                                                                style: TextStyle(
                                                                    fontSize: getProportionateScreenWidth(12),
                                                                    color: kTextColor1,
                                                                    fontWeight: FontWeight.w700
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.amberAccent,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: getProportionateScreenWidth(32),
                                                        height: getProportionateScreenWidth(32),
                                                        child: TextButton(
                                                          onPressed: () {},
                                                          child: Icon(
                                                            Icons.favorite_outline,
                                                            color: Colors.grey,
                                                            size: getProportionateScreenWidth(16),
                                                          ),
                                                          style: TextButton.styleFrom(
                                                            shape: const CircleBorder(),
                                                            primary: kPrimaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
                            child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                              child: Container(
                                width: getProportionateScreenWidth(250),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        // color: Colors.amberAccent,
                                        child: Image.asset(
                                          'assets/images/sofa_model.png',
                                          width: getProportionateScreenWidth(100),
                                          height: getProportionateScreenHeight(100),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          // color: Colors.greenAccent,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  // color: Colors.redAccent,
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        mainAxisSize: MainAxisSize.max,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          SizedBox(
                                                            width: getProportionateScreenWidth(90),
                                                            child: Text(
                                                              'Light Grey Sofa Sofa Sofa',
                                                              style: TextStyle(
                                                                  fontSize: getProportionateScreenWidth(12),
                                                                  color: kTextColor1,
                                                                  fontWeight: FontWeight.w700
                                                              ),
                                                              overflow: TextOverflow.clip,
                                                              maxLines: 1,
                                                              softWrap: false,
                                                            ),
                                                          ),
                                                          SizedBox(height: getProportionateScreenHeight(4),),
                                                          Row(
                                                            mainAxisSize: MainAxisSize.min,
                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                            children: [
                                                              Icon(Icons.star, color: Colors.amber, size: getProportionateScreenWidth(14),),
                                                              Text(
                                                                '  4.9',
                                                                style: TextStyle(
                                                                    fontSize: getProportionateScreenWidth(12),
                                                                    color: kTextColor1,
                                                                    fontWeight: FontWeight.w700
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  // color: Colors.amberAccent,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: getProportionateScreenWidth(32),
                                                        height: getProportionateScreenWidth(32),
                                                        child: TextButton(
                                                          onPressed: () {},
                                                          child: Icon(
                                                            Icons.favorite_outline,
                                                            color: Colors.grey,
                                                            size: getProportionateScreenWidth(16),
                                                          ),
                                                          style: TextButton.styleFrom(
                                                            shape: const CircleBorder(),
                                                            primary: kPrimaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          
                        ],
                      ),
                    )
                    
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }
}

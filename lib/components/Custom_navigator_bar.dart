import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interior_design_and_ar/enums.dart';
import 'package:interior_design_and_ar/screens/favorite/favorite_screen.dart';
import 'package:interior_design_and_ar/screens/profile/profile_screen.dart';

import '../constants.dart';
import '../screens/home/home_sceen.dart';
import '../size_config.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({Key? key, required this.selectedMenuState})
      : super(key: key);
  final MenuState selectedMenuState;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SafeArea(
          top: false,
          child: Container(
            height: getProportionateScreenHeight(68),
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -1),
                  color: kTextColor2,
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    icon: SvgPicture.asset(
                       MenuState.home == selectedMenuState
                          ? "assets/icons/home_selected.svg"
                          : "assets/icons/home.svg",
                      height: getProportionateScreenWidth(42),
                      width: getProportionateScreenWidth(30),
                      fit: BoxFit.fitHeight,
                    )),
                IconButton(
                  iconSize: getProportionateScreenWidth(46),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavoriteScreen()));
                    },
                    icon: SvgPicture.asset(
                      MenuState.favorite == selectedMenuState
                          ? "assets/icons/favorite.svg"
                          : "assets/icons/favorite_selected.svg",
                      height: getProportionateScreenWidth(42),
                      width: getProportionateScreenWidth(46),
                      fit: BoxFit.fitWidth,
                    )),
                IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                    icon: SvgPicture.asset(
                      MenuState.profile == selectedMenuState
                        ?  "assets/icons/profile_selected.svg"
                        :  "assets/icons/profile.svg",
                      height: getProportionateScreenWidth(42),
                      width: SizeConfig.screenWidth * 0.08,
                      fit: BoxFit.fitHeight,
                    )),
              ],
            ),
          )),
    );
  }
}
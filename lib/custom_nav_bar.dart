import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/screens/favorite/favorite_screen.dart';
import 'package:interior_design_and_ar/screens/home/home_sceen.dart';
import 'package:interior_design_and_ar/screens/profile/profile_screen.dart';
import 'package:interior_design_and_ar/size_config.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  List listScreen = [];
  int currentScreen = 0;
  @override
  void initState() {
    super.initState();
    listScreen.add(const HomeScreen());
    listScreen.add(const FavoriteScreen());
    listScreen.add(const ProfileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: listScreen[currentScreen],
      ),
      bottomNavigationBar: BottomNavyBar(
        itemCornerRadius: 30,
        containerHeight: getProportionateScreenWidth(60),
        selectedIndex: currentScreen,
        showElevation: true,
        iconSize: 30,
        items: [
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                color: currentScreen == 0 ? kSelectedButtonColor : kTextColor1,
              ),
              title: const Text(
                "Home",
                style: TextStyle(fontSize: 18),
              ),
              activeColor: kSelectedButtonColor,
              inactiveColor: kTextColor1),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: SvgPicture.asset(
                "assets/icons/favorite.svg",
                color: currentScreen == 1 ? kSelectedButtonColor : kTextColor1,
              ),
              title: const Text(
                "Favorites",
                style: TextStyle(fontSize: 18),
              ),
              activeColor: kSelectedButtonColor,
              inactiveColor: kTextColor1),
          BottomNavyBarItem(
              textAlign: TextAlign.center,
              icon: SvgPicture.asset(
                "assets/icons/profile.svg",
                color: currentScreen == 2 ? kSelectedButtonColor : kTextColor1,
              ),
              title: const Text(
                "Profiles",
                style: TextStyle(fontSize: 18),
              ),
              activeColor: kSelectedButtonColor,
              inactiveColor: kTextColor1)
        ],
        onItemSelected: (value) {
          setState(() {
            currentScreen = value;
          });
        },
      ),
    );
  }
}

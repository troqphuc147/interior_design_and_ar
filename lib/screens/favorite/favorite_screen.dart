import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/enums.dart';

import '../../components/Custom_navigator_bar.dart';
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedMenuState: MenuState.favorite,),
    );
  }
}

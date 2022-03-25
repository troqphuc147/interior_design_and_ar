import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/components/Custom_navigator_bar.dart';
import 'package:interior_design_and_ar/enums.dart';
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(selectedMenuState: MenuState.profile,),
    );
  }
}

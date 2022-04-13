import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/screens/home/home_sceen.dart';
import 'package:interior_design_and_ar/screens/loading_screen.dart';
import 'package:interior_design_and_ar/screens/product/product_detail.dart';
import 'package:interior_design_and_ar/screens/sign_in_screen.dart';

import '../screens/arcore_test.dart';

class Wrapper extends StatelessWidget {
  // biến lấy thông tin user từ wrapper_builder
  final AsyncSnapshot<User?> userSnapshot;
  const Wrapper({
    Key? key,
    required this.userSnapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // thông tin đã được lấy về
    if (userSnapshot.connectionState == ConnectionState.active) {
      if (userSnapshot.hasData) {
        // user đã có đầy đủ thông tin
        if (userSnapshot.data?.displayName != null &&
            userSnapshot.data?.displayName != '')
          return HomeScreen();
      }
      else
        return SignInScreen();
    }
    // thông tin đang được lấy về
    return LoadingScreen();
  }
}
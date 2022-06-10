import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/components/splash_screen.dart';
import 'package:interior_design_and_ar/screens/authentication/login_screen.dart';
import 'package:interior_design_and_ar/components/loading_screen.dart';
import 'package:interior_design_and_ar/screens/introduction/introduction_screen.dart';

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
            userSnapshot.data?.displayName != '') {
          return const CustomSplashScreen();
        }
      } else {
        return const IntroductionScreen();
      }
    }
    // thông tin đang được lấy về
    return const LoadingScreen();
  }
}

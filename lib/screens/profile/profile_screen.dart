import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/core/service/auth.dart';
import 'package:interior_design_and_ar/screens/authentication/login_screen.dart';
import 'package:interior_design_and_ar/size_config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AuthService authService = new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                authService.signout();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                "Exit",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenHeight(40)),
              ))
        ],
      ),
    );
  }
}

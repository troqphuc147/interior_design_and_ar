import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/core/service/auth.dart';
import 'package:interior_design_and_ar/size_config.dart';

import '../../constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authService = AuthService();
  String email = "";
  String password = "";
  bool isLoading = false;
  Future signInWithGoogleAccount() async {
    // hiển thị màn hình loading
    setState(() {
      isLoading = true;
    });
    var res = await authService.signInWithGoogleAccount();
    // giá trị trả về code của lỗi khi xuất hiện lỗi khi đăng nhập
    // trả về login-success khi đăng nhập thành công
    if (res != null && res != 'login-success') {
      print("error");
    }
    // tắt màn hình loading
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
          padding: EdgeInsets.symmetric(
              vertical: 0, horizontal: getProportionateScreenWidth(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: getProportionateScreenWidth(375),
                height: getProportionateScreenWidth(373),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/logo.png"),
                )),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Text(
                "Modern  Furnitures",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(45),
                  fontWeight: FontWeight.w700,
                  color: kTextColor1,
                ),
              ),
              Text(
                "For  Your  House",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(45),
                  fontWeight: FontWeight.w700,
                  color: kTextColor1,
                ),
              ),
              const Spacer(),
              Text(
                "Login with social account",
                style: TextStyle(
                    color: kTextColor4,
                    fontWeight: FontWeight.w500,
                    fontSize: getProportionateScreenWidth(20)),
              ),
              SizedBox(
                height: getProportionateScreenWidth(12),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: getProportionateScreenWidth(90),
                      height: getProportionateScreenWidth(72),
                      child: TextButton(
                        onPressed: () async {
                          await signInWithGoogleAccount();
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        child: Image.asset(
                          'assets/images/google_logo.png',
                          height: 32,
                        ),
                      )),
                  SizedBox(
                    width: getProportionateScreenWidth(16),
                  ),
                  SizedBox(
                      width: getProportionateScreenWidth(90),
                      height: getProportionateScreenWidth(72),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                        ),
                        child: Image.asset(
                          'assets/images/facebook-icon.jpg',
                          height: 40,
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(40),
              ),
            ],
          )),
    );
  }
}

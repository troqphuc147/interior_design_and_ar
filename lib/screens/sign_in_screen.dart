import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/screens/forgot_password_screen.dart';
import 'package:interior_design_and_ar/screens/sign_up_screen.dart';
import 'package:interior_design_and_ar/size_config.dart';

import '../constants.dart';
import 'home_sceen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 0, horizontal: getProportionateScreenWidth(16)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(14)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getProportionateScreenHeight(70),
                            ),
                            Text(
                              "ARFuNi",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(54),
                                fontWeight: FontWeight.bold,
                                color: kTextColor1,
                              ),
                            ),
                            Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(42),
                                fontWeight: FontWeight.bold,
                                color: kTextColor1,
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(32),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const TextField(
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 16,
                            ),
                            hintText: 'Your Email',
                            labelText: 'Email',
                            labelStyle: TextStyle(
                              fontSize: 16,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(8),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const TextField(
                          obscureText: true,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 16,
                            ),
                            hintText: 'Password',
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 16,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ForgotPasswordScreen()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: const [
                                Text(
                                  'Forgot your password?',
                                  style: TextStyle(color: kTextColor4),
                                ),
                                Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.redAccent,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(16),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                              primary: kSelectedButtonColor,
                              minimumSize: const Size.fromHeight(48),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24))),
                          child: Text(
                            'LOGIN',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenWidth(30),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: const Text(
                      "Create new account",
                      style: TextStyle(
                          color: kTextColor4,
                          decoration: TextDecoration.underline),
                    )),
                SizedBox(
                  height: getProportionateScreenWidth(64),
                ),
                Column(
                  children: [
                    const Text(
                      'Or login with social account',
                      style: TextStyle(color: kTextColor4),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(12),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                            width: getProportionateScreenWidth(92),
                            height: getProportionateScreenHeight(64),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                              ),
                              child: Image.asset(
                                'assets/images/google_logo.png',
                                height: 32,
                              ),
                            )),
                        SizedBox(
                          width: getProportionateScreenWidth(12),
                        ),
                        SizedBox(
                            width: getProportionateScreenWidth(92),
                            height: getProportionateScreenHeight(64),
                            child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24)),
                              ),
                              child: Image.asset(
                                'assets/images/facebook-icon.jpg',
                                height: 40,
                              ),
                            )),
                      ],
                    ),
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

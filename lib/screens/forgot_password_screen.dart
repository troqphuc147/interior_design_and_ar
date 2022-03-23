import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/screens/sign_in_screen.dart';
import 'package:interior_design_and_ar/size_config.dart';

import '../constants.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 0, horizontal: getProportionateScreenWidth(16)),
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
                        padding: EdgeInsets.symmetric(horizontal: 12),
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
                              'Forgot Password',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(42),
                                fontWeight: FontWeight.bold,
                                color: kTextColor1,
                              ),
                            ),
                            SizedBox(height: getProportionateScreenHeight(32),),
                          ],
                        ),
                      ),

                      Text(
                        'Please enter your email address. You will receive a link to create a new password via email',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(14),
                          color: kTextColor1,
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(16),),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:  BorderRadius.circular(12),
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
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                        ),
                      ),

                      SizedBox(height: getProportionateScreenWidth(20),),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignInScreen()));
                            },
                            child: const Text(
                              "Back to sign in",
                              style: TextStyle(
                                  color: kTextColor4,
                                  decoration: TextDecoration.underline),
                            )),
                      ),
                      SizedBox(height: getProportionateScreenWidth(40),),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              primary: kSelectedButtonColor,
                              minimumSize: Size.fromHeight(48),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))
                          ),
                          child: Container(
                            child: Text('SEND', style: TextStyle(fontSize: 16),),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),



              ],
            ),
          ),
        ],
      ),
    );
  }
}

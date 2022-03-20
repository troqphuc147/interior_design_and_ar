import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/size_config.dart';

import '../constants.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                      Column(
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
                            'Sign Up',
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(42),
                              fontWeight: FontWeight.bold,
                              color: kTextColor1,
                            ),
                          ),
                          SizedBox(height: getProportionateScreenHeight(32),),
                        ],
                      ),

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
                            hintText: 'Your Name',
                            labelText: 'Name',
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
                      SizedBox(
                        height: getProportionateScreenHeight(8),
                      ),
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
                      SizedBox(
                        height: getProportionateScreenHeight(8),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:  BorderRadius.circular(12),
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
                            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                          Container(
                            // width: getProportionateScreenWidth(180),
                            child: TextButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    'Forgot your password?',
                                    style: TextStyle(
                                        color: kTextColor4,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_right_alt,
                                    color: Colors.redAccent,
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      SizedBox(height: 16,),
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
                            child: Text('SIGN UP', style: TextStyle(fontSize: 16),),
                          ),
                        ),
                      ),



                    ],
                  ),
                ),

                SizedBox(height: getProportionateScreenHeight(16),),


                Container(
                  child: Column(
                    children: [
                      Text('Or login with social account', style: TextStyle(color: kTextColor4),),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            // color: Colors.amberAccent,
                              width: getProportionateScreenWidth(92),
                              height: getProportionateScreenHeight(64),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                                ),
                                child: Image.asset('assets/images/google_logo.png', height: 32,),
                              )
                          ),
                          SizedBox(width: 12,),
                          Container(
                            // color: Colors.amberAccent,
                              width: getProportionateScreenWidth(92),
                              height: getProportionateScreenHeight(64),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                                ),
                                child: Image.asset('assets/images/facebook-icon.jpg', height: 40,),
                              )
                          ),
                        ],
                      ),
                    ],
                  ),
                )



              ],
            ),
          ),
        ],
      ),
    );
  }
}

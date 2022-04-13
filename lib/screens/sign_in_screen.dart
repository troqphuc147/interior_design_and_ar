import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/screens/forgot_password_screen.dart';
import 'package:interior_design_and_ar/screens/sign_up_screen.dart';
import 'package:interior_design_and_ar/core/service/auth.dart';
import 'package:interior_design_and_ar/size_config.dart';

import '../constants.dart';
import 'home/home_sceen.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}


class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final authService = AuthService();
  String email = "";
  String password = "";
  bool isLoading = false;
  signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      final res = await authService.signInWithEmailAndPass(email, password);
      setState(() {
        isLoading = false;
      });
      if (res != 'sign in') {
       // await showAlertDialog(context, "Incorrect email or password");
        print("Incorrect email or password");
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    }
  }
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
    if (this.mounted)
      setState(() {
        isLoading = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
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
                            height: getProportionateScreenWidth(70),
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
                            height: getProportionateScreenWidth(32),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  TextFormField(
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        decoration: const InputDecoration(
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return  'Email not empty';
                          } else if (EmailValidator.validate(value) == false) {
                            return 'Email not valid';
                          }
                          return null;
                        },
                        onChanged: (value){
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(8),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  TextFormField(
                        obscureText: true,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                        decoration: const InputDecoration(
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
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Password is empty';
                          else if (value.length < 6)
                            return 'Password must longer than 6 digits';
                          return null;
                        },
                        onChanged: (value){
                          setState(() {
                            password = value;
                          });
                        }
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
                      height: getProportionateScreenWidth(12),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          await signIn();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        style: ElevatedButton.styleFrom(
                            primary: kSelectedButtonColor,
                            minimumSize: Size.fromHeight(getProportionateScreenWidth(44)),
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
                height: getProportionateScreenWidth(8),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: kTextColor4,
                          fontWeight: FontWeight.w400,
                          // decoration: TextDecoration.underline
                        ),
                      ),
                      Text(
                        "   Sign up",
                        style: TextStyle(
                          color: kTextColor4,
                          // decoration: TextDecoration.underline
                        ),
                      ),
                    ],
                  )
              ),
              SizedBox(
                height: getProportionateScreenWidth(40),
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
                          width: getProportionateScreenWidth(80),
                          height: getProportionateScreenWidth(48),
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
                        width: getProportionateScreenWidth(12),
                      ),
                      SizedBox(
                          width: getProportionateScreenWidth(80),
                          height: getProportionateScreenWidth(48),
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
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(16),),
            ],
          ),
        ),
      ),
    );
  }
}

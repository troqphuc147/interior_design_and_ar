import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/controller/favorite_controller.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(30)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
              Text(
                'Your Profile',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(34),
                    color: kTextColor1,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenWidth(32),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: getProportionateScreenWidth(32),
                    backgroundImage:
                        AssetImage("assets/images/default_user_avatar.jpg"),
                    // backgroundImage: NetworkImage(""),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(16),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(230),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hoang Dan Quang',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: kTextColor1,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          'hoangdanquang@gmail.com',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: kTextColor2,
                            fontWeight: FontWeight.w500,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(32),
              ),

              ListTile(
                onTap: () {},
                title: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(8)),
                  child: Text(
                    'Your information',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: kTextColor1,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                subtitle: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(8)),
                  child: Text(
                    'Your name and email',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: kTextColor2,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: getProportionateScreenWidth(16),
                ),
              ),
              Divider(
                height: getProportionateScreenWidth(0),
                thickness: getProportionateScreenWidth(1),
              ),

              ListTile(
                onTap: () {},
                title: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(8)),
                  child: Text(
                    'Your rating',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: kTextColor1,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                subtitle: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(8)),
                  child: Text(
                    'You rated for 15 products',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: kTextColor2,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: getProportionateScreenWidth(16),
                ),
              ),
              Divider(
                height: getProportionateScreenWidth(0),
                thickness: getProportionateScreenWidth(1),
              ),

              ListTile(
                onTap: () {},
                title: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(8)),
                  child: Text(
                    'Help',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: kTextColor1,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                subtitle: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(8)),
                  child: Text(
                    'Frequently asked questions',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: kTextColor2,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: getProportionateScreenWidth(16),
                ),
              ),
              Divider(
                height: getProportionateScreenWidth(0),
                thickness: getProportionateScreenWidth(1),
              ),

              ListTile(
                onTap: () {},
                title: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(8)),
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: kTextColor1,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                subtitle: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(8)),
                  child: Text(
                    'App introduction',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: kTextColor2,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: getProportionateScreenWidth(16),
                ),
              ),
              Divider(
                height: getProportionateScreenWidth(0),
                thickness: getProportionateScreenWidth(1),
              ),

              ListTile(
                onTap: () async {
                  await authService.signout();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                },
                title: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(8)),
                  child: Text(
                    'Sign out',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: kTextColor1,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                subtitle: Padding(
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(8)),
                  child: Text(
                    'You can sign in with another account',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: kTextColor2,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: getProportionateScreenWidth(16),
                ),
              ),
              // Divider(height: getProportionateScreenWidth(0), thickness: getProportionateScreenWidth(1),),

              // TextButton(
              //     onPressed: () {
              //       authService.signout();
              //       Navigator.pushReplacement(context,
              //           MaterialPageRoute(builder: (context) => LoginScreen()));
              //     },
              //     child: Text(
              //       "Exit",
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontSize: getProportionateScreenHeight(40)),
              //     ))
            ],
          ),
        ),
      ),
    );
  }
}

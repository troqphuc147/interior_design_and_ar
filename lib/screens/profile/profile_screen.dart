import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/controller/favorite_controller.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/controller/profile_controller.dart';
import 'package:interior_design_and_ar/core/service/auth.dart';
import 'package:interior_design_and_ar/main.dart';
import 'package:interior_design_and_ar/screens/authentication/login_screen.dart';
import 'package:interior_design_and_ar/screens/profile/components/button_data.dart';
import 'package:interior_design_and_ar/size_config.dart';
import 'package:page_transition/page_transition.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                      backgroundImage: NetworkImage(AuthService
                          .instance.getCurrentUser!.photoURL
                          .toString())
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
                          AuthService.instance.getCurrentUser!.displayName
                              .toString(),
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            color: kTextColor1,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        Text(
                          AuthService.instance.getCurrentUser!.email.toString(),
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
              ...List.generate(
                  listButtonData.length,
                  (int index) => Column(
                        children: [
                          ListTile(
                            dense: true,
                            onTap: () async {
                              if (index == listButtonData.length - 1) {
                                await AuthService.instance.signout();
                                Get.delete<MainController>();
                                Get.delete<FavoriteController>();
                                Get.delete<ProfileController>();
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            listButtonData[index].forcusScreen),
                                    (Route<dynamic> route) => false);
                                return;
                              }
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      child: listButtonData[index].forcusScreen,
                                      type: PageTransitionType.rightToLeft));
                            },
                            title: Padding(
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenWidth(8)),
                              child: Text(
                                listButtonData[index].title,
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
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenWidth(8)),
                              child: Text(
                                listButtonData[index].subScription,
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
                        ],
                      )),
            ],
          ),
        ),
      ),
    );
  }
}

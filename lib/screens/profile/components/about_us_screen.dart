import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../components/custom_alert.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      physics:
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),
                    getProportionateScreenWidth(16), 0, 0),
                child: SizedBox(
                  width: getProportionateScreenWidth(40),
                  height: getProportionateScreenWidth(40),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: getProportionateScreenWidth(20),
                    ),
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.only(left: getProportionateScreenWidth(8)),
                      shape: const CircleBorder(),
                      primary: kPrimaryColor,
                      backgroundColor: const Color(0xFFEBECF1),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20),
                    getProportionateScreenWidth(16), 0, 0),
                child: Text(
                  'About us',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(34),
                      color: kTextColor1,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(211),
              width: getProportionateScreenWidth(198),
              child: Image.asset(
                "assets/images/logo_app.png",
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
              child: Text(
                'Made by a group of sophomores of\nUniversity of Information Technology\nVNU-HCM',
                style: TextStyle(
                  color: kTextColor1,
                  fontWeight: FontWeight.w400,
                  fontSize: getProportionateScreenWidth(16),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text(
                'TEAM MEMBERS',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: getProportionateScreenWidth(24),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: false,
                aspectRatio: 1.8,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
              ),
              items: const [
                InfoCard(
                  name: 'Huỳnh Trọng Phục',
                  iconPath: 'assets/images/avatars/avatar_phuc.png',
                  avatarColor: Color(0xFFb5ffee),
                  quote: 'I am bad boy',
                  fbURL: 'https://www.facebook.com/huynhtrongphuc01/',
                  igURL: 'https://www.linkedin.com/in/troqphuc147/',
                  email: 'phuchuynh020601@gmail.com',
                ),
                InfoCard(
                  name: 'Hoàng Dận Quang',
                  iconPath: 'assets/images/avatars/avatar_quang.png',
                  avatarColor: Color(0xFFaef2fc),
                  quote: 'I am good boy',
                  fbURL:
                      'https://www.facebook.com/profile.php?id=100010715680968',
                  igURL:
                      'https://www.linkedin.com/in/dan-quang-hoang-78b053233/?fbclid=IwAR0depdtGUKNEB5XI8GVtu-A2wSzKSXwFZg7uyHwdICndNXW3RDtt0KtVJQ',
                  email: '19522092@gm.uit.edu.vn',
                ),
              ],
            ),
          ],
        )
      ],
    ));
  }
}

// Card về thông tin của thành viên, avt, tên và description
class InfoCard extends StatelessWidget {
  final String name; // Tên thành viên
  final String iconPath; // path đến icon chỉ định của thành viên
  final Color avatarColor; // màu chủ đạo của thành viên
  final String fbURL; // link đến fb cá nhân
  final String igURL; // link đến insta cá nhân
  final String email; // mail của thành viên
  final String quote; // trích dẫn mô tả thành viên

  const InfoCard({
    Key? key,
    required this.name,
    required this.iconPath,
    required this.avatarColor,
    required this.fbURL,
    required this.igURL,
    required this.email,
    required this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => InfoCardDetail(
                  name: name,
                  iconPath: iconPath,
                  avatarColor: avatarColor,
                  fbURL: fbURL,
                  igURL: igURL,
                  email: email,
                  quote: quote,
                )));
      },
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 177, 177, 177),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  backgroundColor: avatarColor,
                  radius: 45.0,
                  child: Image.asset(
                    iconPath,
                    width: getProportionateScreenHeight(60),
                    height: getProportionateScreenWidth(60),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                name,
                style: const TextStyle(
                  color: kTextColor1,
                  fontWeight: FontWeight.w700,
                  fontSize: 22.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                quote,
                style: TextStyle(
                  color: kTextColor1.withOpacity(0.54),
                  fontWeight: FontWeight.w400,
                  fontSize: getProportionateScreenWidth(16),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Thông tin chi tiết của thành viên
class InfoCardDetail extends StatelessWidget {
  final String name;
  final String iconPath; // icon được chỉ định của thành viên
  final Color avatarColor;
  final String fbURL;
  final String igURL;
  final String email;
  final String quote;

  const InfoCardDetail({
    Key? key,
    required this.name,
    required this.iconPath,
    required this.avatarColor,
    required this.fbURL,
    required this.igURL,
    required this.email,
    required this.quote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                CircleAvatar(
                    backgroundColor: avatarColor,
                    radius: 45.0,
                    child: Image.asset(
                      iconPath,
                      width: getProportionateScreenHeight(60),
                      height: getProportionateScreenWidth(60),
                    )),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: kTextColor1,
                    fontWeight: FontWeight.w700,
                    fontSize: 22.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  quote,
                  style: TextStyle(
                    color: kTextColor1.withOpacity(0.54),
                    fontWeight: FontWeight.w400,
                    fontSize: getProportionateScreenWidth(16),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 60.0),
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return kSelectedButtonColor;
                          }
                          return const Color(
                              0xff3c599b); // Use the component's default.
                        },
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return kSelectedButtonColor;
                          }
                          return Colors.white; // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      launchURL(fbURL, context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/facebook_icon.svg",
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Facebook",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              wordSpacing: 2.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 60.0),
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return kSelectedButtonColor;
                          }
                          return const Color(
                              0xff0096bc); // Use the component's default.
                        },
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return kSelectedButtonColor;
                          }
                          return Colors.white; // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      launchURL(igURL, context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/linkedin.svg",
                          width: 18,
                          height: 18,
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Linkedin",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              wordSpacing: 2.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 60.0),
                  width: double.infinity,
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return kSelectedButtonColor;
                          }
                          return Colors.black; // Use the component's default.
                        },
                      ),
                      foregroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return kSelectedButtonColor;
                          }
                          return Colors.white; // Use the component's default.
                        },
                      ),
                    ),
                    onPressed: () {
                      String emailLaunchUri =
                          'mailto:$email?subject=${Uri.encodeFull("[ARFurni]")}';
                      launchURL(emailLaunchUri, context);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.email_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Send Email",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              wordSpacing: 2.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // CloseButton(
          //   color: Colors.white,
          // ),
          Container(
            padding: EdgeInsets.only(top: getProportionateScreenWidth(30)),
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20), vertical: 14.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.close,
                  color: kSelectedButtonColor,
                  size: 28.0,
                )),
          ),
        ],
      ),
    );
  }

  void launchURL(String url, BuildContext context) async {
    try {
      await canLaunchUrl(Uri.parse(url))
          ? await launchUrlString(url)
          : throw 'Could not launch $url';
    } catch (e) {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        barrierColor: Colors.redAccent.withOpacity(0.45),
        builder: (BuildContext context) {
          return const CustomAlert(
            content: "Sorry can open it",
          );
        },
      );
    }
  }
}

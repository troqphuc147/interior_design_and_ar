import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/screens/authentication/login_screen.dart';
import 'package:interior_design_and_ar/screens/introduction/data_for_slide.dart';
import 'package:interior_design_and_ar/size_config.dart';
import 'package:page_transition/page_transition.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  int current = 0;
  final CarouselController controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(bottom: getProportionateScreenWidth(10)),
        child: Stack(
          children: [
            Column(mainAxisSize: MainAxisSize.max, children: [
              CarouselSlider(
                carouselController: controller,
                items: listSlide.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/backgroup_slide.jpg"),
                                      fit: BoxFit.fitHeight)),
                              child: Align(
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          scale: i.title.toString() ==
                                                  listSlide[0].title.toString()
                                              ? 0.1
                                              : 1.0,
                                          image: AssetImage(i.imagePath),
                                          fit: i.title.toString() ==
                                                  listSlide[0].title.toString()
                                              ? BoxFit.scaleDown
                                              : BoxFit.cover)),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenWidth(12),
                          ),
                          Text(
                            i.title.toString(),
                            style: TextStyle(
                                color: kTextColor1,
                                fontSize: getProportionateScreenWidth(24),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            i.content.toString(),
                            style: TextStyle(
                                color: kTextColor2,
                                fontSize: getProportionateScreenWidth(16),
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          )
                        ],
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                    height: getProportionateScreenWidth(700),
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        current = index;
                      });
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: listSlide.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => controller.animateToPage(entry.key),
                    child: Container(
                      width: 10.0,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.black)
                              .withOpacity(current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
            ]),
            Align(
              alignment: Alignment.bottomLeft,
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: const LoginScreen(),
                            type: PageTransitionType.rightToLeft));
                  },
                  child: Text(
                    'SKIP',
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      decoration: TextDecoration.underline,
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    if (current == 2) {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: const LoginScreen(),
                              type: PageTransitionType.rightToLeft));
                    }
                    setState(() {
                      if (current < 2) current += 1;
                      controller.nextPage();
                    });
                  },
                  child: current == 2
                      ? Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            decoration: TextDecoration.underline,
                          ),
                        )
                      : Icon(
                          Icons.navigate_next,
                          size: getProportionateScreenWidth(24),
                        )),
            ),
          ],
        ),
      ),
    );
  }
}

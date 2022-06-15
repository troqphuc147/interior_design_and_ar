import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/screens/profile/components/answer_screen.dart';
import 'package:interior_design_and_ar/screens/profile/components/guide_content.dart';
import 'package:page_transition/page_transition.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class HelpAndGuideScreen extends StatelessWidget {
  const HelpAndGuideScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: getProportionateScreenWidth(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        padding: EdgeInsets.only(
                            left: getProportionateScreenWidth(8)),
                        shape: const CircleBorder(),
                        primary: kPrimaryColor,
                        backgroundColor: const Color(0xFFEBECF1),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                    getProportionateScreenWidth(20),
                    getProportionateScreenWidth(16),
                    0,
                    getProportionateScreenWidth(20)),
                child: Text(
                  'Helps And Guides',
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(34),
                      color: kTextColor1,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(24)),
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceAround,
                  runAlignment: WrapAlignment.spaceAround,
                  spacing: getProportionateScreenWidth(24),
                  runSpacing: getProportionateScreenWidth(10),
                  children: [
                    ...List.generate(
                        listGuide.length,
                        (index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: AnswerTheQuestions(
                                            guide: listGuide[index]),
                                        type: PageTransitionType.bottomToTop));
                              },
                              child: ListTile(
                                title: Text(listGuide[index].question),
                              ),
                            ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

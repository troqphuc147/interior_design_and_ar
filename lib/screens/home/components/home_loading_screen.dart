import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:interior_design_and_ar/screens/home/components/category_line.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class HomeLoadingScreen extends StatelessWidget {
  const HomeLoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: getProportionateScreenWidth(230),
              width: getProportionateScreenWidth(375),
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(30),
                  vertical: getProportionateScreenWidth(15)),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/background_home.png",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getProportionateScreenWidth(15),
                  ),
                  Text(
                    'Best Furniture',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(34),
                        color: kTextColor1,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'For Your House',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(34),
                        color: kTextColor1,
                        fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: getProportionateScreenWidth(375),
                    height: getProportionateScreenWidth(48),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Theme(
                        data: ThemeData(
                          colorScheme: ThemeData()
                              .colorScheme
                              .copyWith(primary: kSelectedButtonColor),
                        ),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: const InputDecoration(
                            hintStyle: TextStyle(
                              fontSize: 16,
                            ),
                            hintText: 'Search furniture',
                            contentPadding: EdgeInsets.fromLTRB(24, 16, 12, 16),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: getProportionateScreenWidth(10),
                left: getProportionateScreenWidth(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(24),
                        fontWeight: FontWeight.w600,
                        color: kTextColor1),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(8),
                  ),
                  CategoryLine(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: getProportionateScreenWidth(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Popular',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(24),
                                  fontWeight: FontWeight.w600,
                                  color: kTextColor1),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    '  More',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(190),
                        child: const Center(
                            child: SpinKitPouringHourGlassRefined(
                          color: kSelectedButtonColor,
                          size: 40.0,
                        )),
                      )
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: getProportionateScreenWidth(10)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'New',
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(24),
                                  fontWeight: FontWeight.w600,
                                  color: kTextColor1),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Text(
                                    '  More',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.arrow_right,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenWidth(100),
                        child: const Center(
                            child: SpinKitPouringHourGlassRefined(
                          color: kSelectedButtonColor,
                          size: 40.0,
                        )),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

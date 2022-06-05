import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/controller/profile_controller.dart';
import 'package:interior_design_and_ar/screens/profile/components/rating_card.dart';

import '../../../size_config.dart';

class ListRatedProductsScreen extends StatelessWidget {
  const ListRatedProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.find<ProfileController>();
    return Scaffold(
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: getProportionateScreenWidth(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                        profileController.listRatingProduct.length,
                        (index) => RatingCard(
                            product: profileController.listRatingProduct[index],
                            star: profileController.listRating[index].star))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

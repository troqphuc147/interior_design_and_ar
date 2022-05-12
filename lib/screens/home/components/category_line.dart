import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/size_config.dart';

class CategoryLine extends StatelessWidget {
  CategoryLine({Key? key}) : super(key: key);
  final List images = [
    "assets/images/chair.png",
    "assets/images/table.png",
    "assets/images/lamp.png",
    "assets/images/bed.png"
  ];
  final List nameCategorys = ["Chair", "Table", "Lamp", "Bed"];
  final List colors = [
    const Color(0xFFDADADA),
    const Color(0xFFC4C4C4),
    const Color(0xFFE7DCCB),
    const Color(0xFFDADADA)
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(71),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(
                nameCategorys.length,
                (index) => Container(
                      margin: EdgeInsets.only(
                        right: getProportionateScreenWidth(15),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10),
                      ),
                      height: getProportionateScreenWidth(68),
                      width: getProportionateScreenWidth(110),
                      decoration: BoxDecoration(
                          color: colors[index],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.45),
                              offset: const Offset(0, 2),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            nameCategorys[index],
                            style: TextStyle(
                                color: kTextColor4,
                                fontWeight: FontWeight.w600,
                                fontSize: getProportionateScreenWidth(14)),
                          ),
                          SizedBox(
                            height: getProportionateScreenWidth(40),
                            width: getProportionateScreenWidth(50),
                            child: Image.asset(images[index]),
                          )
                        ],
                      ),
                    ))
          ],
        ),
      ),
    );
  }
}

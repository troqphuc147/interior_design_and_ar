import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/size_config.dart';

class PopularProductCard extends StatefulWidget {
  final Uint8List image;
  final String productName;
  final String rating;
  bool isFavorite = false;
  PopularProductCard({Key? key, required this.image, required this.productName, required this.rating, required this.isFavorite}) : super(key: key);

  @override
  State<PopularProductCard> createState() => _PopularProductCardState();
}

class _PopularProductCardState extends State<PopularProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
      child: SizedBox(
        width: getProportionateScreenWidth(150),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(getProportionateScreenWidth(14))),
                      child: Image.memory(
                        widget.image,
                        height: getProportionateScreenWidth(146),
                        width: getProportionateScreenWidth(146),
                        // color: Colors.red,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(32),
                        height: getProportionateScreenWidth(32),
                        child: TextButton(
                          onPressed: () {},
                          child: Icon(
                            widget.isFavorite ? Icons.favorite : Icons.favorite_outline,
                            color: widget.isFavorite ? Colors.red : Colors.grey,
                            size: getProportionateScreenWidth(16),
                          ),
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            primary: kPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                color: kTextColor1,
                                fontWeight: FontWeight.w700
                            ),
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            softWrap: false,
                          ),
                          SizedBox(height: getProportionateScreenWidth(4),),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: getProportionateScreenWidth(14),),
                              Text(
                                '  ' + widget.rating.toString(),
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(12),
                                    color: kTextColor1,
                                    fontWeight: FontWeight.w700
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(4), 0, getProportionateScreenWidth(4), 0),
                      child: SizedBox(
                        height: getProportionateScreenWidth(32),
                        width: getProportionateScreenWidth(32),
                        child: TextButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: kPrimaryColor,
                            size: getProportionateScreenWidth(14),
                          ),
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            // backgroundColor: kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenWidth(4),)
            ],
          ),
        ),
      ),
    );
  }
}

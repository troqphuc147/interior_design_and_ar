import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/size_config.dart';

class PopularProductCard extends StatefulWidget {
  Product product;
  bool isFavorite = false;
  PopularProductCard(
      {Key? key, required this.product, required this.isFavorite})
      : super(key: key);

  @override
  State<PopularProductCard> createState() => _PopularProductCardState();
}

class _PopularProductCardState extends State<PopularProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(150),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.product.linkImage + "true",
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                                getProportionateScreenWidth(14))),
                        child: CachedNetworkImage(
                          imageUrl: widget.product.linkImage,
                          height: getProportionateScreenWidth(146),
                          width: getProportionateScreenWidth(146),
                        )),
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
                        onPressed: () {
                          setState(() {
                            widget.isFavorite = !widget.isFavorite;
                          });
                        },
                        child: Icon(
                          widget.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_outline,
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
                          widget.product.name,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(12),
                              color: kTextColor1,
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          softWrap: false,
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(4),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: getProportionateScreenWidth(14),
                            ),
                            Text(
                              '  ' + widget.product.rating.toString(),
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(12),
                                  color: kTextColor1,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(4),
                        0, getProportionateScreenWidth(4), 0),
                    child: SizedBox(
                      height: getProportionateScreenWidth(32),
                      width: getProportionateScreenWidth(32),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: kPrimaryColor,
                          size: getProportionateScreenWidth(14),
                        ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenWidth(4),
            )
          ],
        ),
      ),
    );
  }
}

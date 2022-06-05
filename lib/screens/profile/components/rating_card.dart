import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/core/models/product.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class RatingCard extends StatelessWidget {
  final Product product;
  final int star;
  const RatingCard({Key? key, required this.product, required this.star})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(200),
      width: getProportionateScreenWidth(150),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: kBackgroundChipColor,
        elevation: 5.0,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Hero(
                  tag: product.linkImage + "rating",
                  child: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(
                                getProportionateScreenWidth(14))),
                        child: CachedNetworkImage(
                          imageUrl: product.linkImage,
                          height: getProportionateScreenWidth(145),
                          width: getProportionateScreenWidth(145),
                        )),
                  ),
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
                          product.name,
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              color: kTextColor1,
                              fontWeight: FontWeight.w700),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          softWrap: false,
                        ),
                        SizedBox(
                          height: getProportionateScreenWidth(4),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: getProportionateScreenWidth(14),
                            ),
                            Text(
                              '  ' + product.rating.toString(),
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
              height: getProportionateScreenWidth(8),
            )
          ],
        ),
      ),
    );
  }
}

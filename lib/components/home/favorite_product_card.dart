import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/size_config.dart';

class FavoriteProductCard extends StatefulWidget {
  final String imageUrlString;
  final String productName;
  final String rating;

  FavoriteProductCard({Key? key, required this.imageUrlString, required this.productName, required this.rating}) : super(key: key);

  @override
  State<FavoriteProductCard> createState() => _FavoriteProductCardState();
}

class _FavoriteProductCardState extends State<FavoriteProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
      child: SizedBox(
        width: getProportionateScreenWidth(315),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.horizontal(left: Radius.circular(getProportionateScreenWidth(14))),
                    child: Hero(
                      //TODO remove DateTime.now() from tag
                      tag: widget.imageUrlString + "false" + DateTime.now().toString(),
                      child: Image.network(
                        widget.imageUrlString,
                        height: getProportionateScreenWidth(110),
                        width: getProportionateScreenWidth(110),
                        // color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(140),
                              child: Text(
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
                            ),
                            SizedBox(height: getProportionateScreenWidth(8),),
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
                            ),
                            SizedBox(height: getProportionateScreenWidth(8),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                SizedBox(
                                  height: getProportionateScreenWidth(getProportionateScreenWidth(32)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Camera view',
                                      style: TextStyle(
                                        fontSize: getProportionateScreenWidth(12),
                                        color: kTextColor2,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenWidth(getProportionateScreenWidth(32)),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Icon(Icons.delete, color: kTextColor2, size: getProportionateScreenWidth(16),),
                                        Text(
                                          '  Delete',
                                          style: TextStyle(
                                            fontSize: getProportionateScreenWidth(12),
                                            color: kTextColor2,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

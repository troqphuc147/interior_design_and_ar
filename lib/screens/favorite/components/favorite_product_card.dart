import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/size_config.dart';

import '../../../controller/favorite_controller.dart';
import '../../../controller/main_controller.dart';

class FavoriteProductCard extends StatefulWidget {
  final Product product;
  const FavoriteProductCard({Key? key, required this.product})
      : super(key: key);

  @override
  State<FavoriteProductCard> createState() => _FavoriteProductCardState();
}

class _FavoriteProductCardState extends State<FavoriteProductCard> {
  MainController mainController = Get.find<MainController>();
  FavoriteController favoriteController = Get.find<FavoriteController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
      child: SizedBox(
        height: getProportionateScreenHeight(140),
        width: getProportionateScreenWidth(315),
        child: Stack(
          children: [
            Container(
              height: getProportionateScreenHeight(105),
              width: getProportionateScreenWidth(265),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(-1, 1),
                        color: Colors.grey.withOpacity(0.24),
                        blurRadius: 1.5,
                        spreadRadius: 2.0)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: getProportionateScreenWidth(8),
                            left: getProportionateScreenWidth(8)),
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
                                    widget.product.name,
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(14),
                                        color: kTextColor1,
                                        fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenWidth(8),
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
                                          fontSize:
                                              getProportionateScreenWidth(12),
                                          color: kTextColor1,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      height: getProportionateScreenWidth(
                                          getProportionateScreenWidth(32)),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Camera view',
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(12),
                                            color: kTextColor2,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenWidth(
                                          getProportionateScreenWidth(32)),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: kTextColor2,
                                              size: getProportionateScreenWidth(
                                                  16),
                                            ),
                                            Text(
                                              '  Delete',
                                              style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        12),
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
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  height: getProportionateScreenWidth(105),
                  width: getProportionateScreenWidth(105),
                  decoration: BoxDecoration(
                      color: Color(int.parse(
                          kCategoryColors[widget.product.nameCategory]
                              .toString())),
                      borderRadius: BorderRadius.circular(55),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(1, 1),
                            color: Colors.black.withOpacity(0.24),
                            blurRadius: 1.5,
                            spreadRadius: 2.0)
                      ]),
                  child: Center(
                    child: Hero(
                      tag: widget.product.linkImage + "yes",
                      child: CachedNetworkImage(
                        imageUrl: widget.product.linkImage,
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

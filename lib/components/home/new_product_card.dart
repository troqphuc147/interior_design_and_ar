import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/controller/favorite_controller.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/size_config.dart';
import '../../core/models/product.dart';

// ignore: must_be_immutable
class NewProductCard extends StatefulWidget {
  final Product product;
  final String category;
  bool isFavorite = false;
  NewProductCard(
      {Key? key,
      required this.product,
      required this.isFavorite,
      required this.category})
      : super(key: key);

  @override
  State<NewProductCard> createState() => _NewProductCardState();
}

class _NewProductCardState extends State<NewProductCard> {
  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    FavoriteController favoriteController = Get.find<FavoriteController>();
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
      child: SizedBox(
        width: getProportionateScreenWidth(250),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(getProportionateScreenWidth(14))),
                    child: Hero(
                      tag: widget.product.linkImage + widget.category,
                      child: Image.network(
                        widget.product.linkImage,
                        height: getProportionateScreenWidth(100),
                        width: getProportionateScreenWidth(100),
                        // color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: getProportionateScreenWidth(8)),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: getProportionateScreenWidth(100),
                                  child: Text(
                                    widget.product.name,
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(12),
                                        color: kTextColor1,
                                        fontWeight: FontWeight.w700),
                                    overflow: TextOverflow.clip,
                                    maxLines: 1,
                                    softWrap: false,
                                  ),
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
                                          fontSize:
                                              getProportionateScreenWidth(12),
                                          color: kTextColor1,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(32),
                              height: getProportionateScreenWidth(32),
                              child: TextButton(
                                onPressed: () async {
                                  setState(() {
                                    widget.isFavorite = !widget.isFavorite;
                                  });
                                  if (widget.isFavorite == true) {
                                    mainController
                                        .addToFavoriteList(widget.product.id);
                                    favoriteController
                                        .addItemsIntoList(widget.product);
                                  } else {
                                    mainController.deleteInFavoriteList(
                                        widget.product.id);
                                    favoriteController
                                        .deleteItemsInList(widget.product);
                                  }
                                },
                                child: Icon(
                                  widget.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: widget.isFavorite
                                      ? Colors.red
                                      : Colors.grey,
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

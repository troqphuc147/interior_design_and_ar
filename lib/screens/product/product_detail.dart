import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/components/default_button.dart';
import 'package:interior_design_and_ar/components/product/default_color_button.dart';
import 'package:interior_design_and_ar/components/product/selected_color_button.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/controller/favorite_controller.dart';
import 'package:interior_design_and_ar/core/models/product.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import 'package:interior_design_and_ar/screens/product/ar_view/ar_view_screen.dart';
import 'package:interior_design_and_ar/size_config.dart';
import '../../core/models/rating.dart';

class ProductDetail extends StatefulWidget {
  final String category;
  final Product product;
  bool isFavorite;
  ProductDetail(
      {Key? key,
      required this.product,
      required this.category,
      required this.isFavorite})
      : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  MainController mainController = Get.find<MainController>();
  FavoriteController favoriteController = Get.find<FavoriteController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(top: getProportionateScreenWidth(15)),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    0, getProportionateScreenWidth(30), 0, 0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: widget.product.linkImage + widget.category,
                        child: CachedNetworkImage(
                          imageUrl: widget.product.linkImage,
                          width: getProportionateScreenWidth(350),
                          height: getProportionateScreenWidth(350),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            getProportionateScreenWidth(16),
                            0,
                            getProportionateScreenWidth(30)),
                        child: Container(
                          width: getProportionateScreenWidth(315),
                          height: getProportionateScreenWidth(350),
                          decoration: const BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 7.0,
                              offset: Offset(1, 1),
                            ),
                          ]),
                          child: Card(
                            color: const Color(0xFFF6F6F9),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(28)),
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.only(
                                    top: getProportionateScreenHeight(7)),
                                children: [
                                  SizedBox(
                                    height: getProportionateScreenWidth(18),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: getProportionateScreenWidth(170),
                                        child: Text(
                                          widget.product.nameCategory,
                                          style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(14),
                                            color: kTextColor2,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          overflow: TextOverflow.clip,
                                          maxLines: 1,
                                          softWrap: false,
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size:
                                                getProportionateScreenWidth(24),
                                          ),
                                          Text(
                                            '  ' + widget.product.rating,
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        18),
                                                color: kTextColor1,
                                                fontWeight: FontWeight.w700),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenWidth(8),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        widget.product.name,
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(24),
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor1,
                                        ),
                                      ),
                                      Text(
                                        '\$ ' + widget.product.cost,
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(18),
                                            color: kTextColor1,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenWidth(12),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenWidth(80),
                                    child: Text(
                                      widget.product.description,
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(12),
                                        color: kTextColor2,
                                        fontWeight: FontWeight.w500,
                                        height:
                                            getProportionateScreenWidth(1.5),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                      softWrap: true,
                                    ),
                                  ),
                                  const Spacer(),
                                  Row(
                                    children: [
                                      Text(
                                        'Color: ',
                                        style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(14),
                                          color: kTextColor2,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(12),
                                      ),
                                      SelectedColorButton(
                                          color: Colors.blueAccent),
                                      DefaultColorButton(
                                          color: Colors.amberAccent),
                                      DefaultColorButton(
                                          color: Colors.redAccent),
                                      DefaultColorButton(
                                          color: Colors.greenAccent),
                                      DefaultColorButton(color: Colors.grey),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenWidth(24),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          if (widget.isFavorite == false) {
                                            mainController.addToFavoriteList(
                                                widget.product.id);
                                            favoriteController.addItemsIntoList(
                                                widget.product);
                                          } else {
                                            mainController.deleteInFavoriteList(
                                                widget.product.id);
                                            favoriteController
                                                .deleteItemsInList(
                                                    widget.product);
                                          }
                                          setState(() {
                                            widget.isFavorite =
                                                !widget.isFavorite;
                                          });
                                        },
                                        child: Icon(
                                          widget.isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: widget.isFavorite
                                              ? Colors.redAccent
                                              : Colors.grey,
                                          size: getProportionateScreenWidth(24),
                                        ),
                                        style: TextButton.styleFrom(
                                          shape: const CircleBorder(),
                                          primary: kPrimaryColor,
                                          backgroundColor: Colors.white,
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ARViewScreen(
                                                          linkAR: widget.product
                                                              .linkAr)));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            primary: const Color(0xFFFC7566),
                                            fixedSize: Size(
                                                getProportionateScreenWidth(
                                                    170),
                                                getProportionateScreenWidth(
                                                    48)),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(16))),
                                        child: Text(
                                          'View on camera',
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      18)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Center(
                                    child: TextButton(
                                      onPressed: () {
                                        show(context);
                                      },
                                      child: Text(
                                        'Rating for product',
                                        style: TextStyle(
                                          color: kTextColor2,
                                          fontSize:
                                              getProportionateScreenWidth(16),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenWidth(20),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
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
                      padding:
                          EdgeInsets.only(left: getProportionateScreenWidth(8)),
                      shape: const CircleBorder(),
                      primary: kPrimaryColor,
                      backgroundColor: const Color(0xFFEBECF1),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  show(BuildContext context) {
    int rate = 1;
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: getProportionateScreenWidth(200),
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              decoration: const BoxDecoration(
                  color: Color(0xfff5f4f4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: ButtonTheme(
                  height: getProportionateScreenWidth(280),
                  child: FutureBuilder<Rating>(
                    future: mainController.firebase
                        .checkUserVoted(widget.product.id),
                    builder: (context, snapshot) {
                      Rating? isVoted = snapshot.data;
                      return isVoted?.star == 0
                          ? Column(
                              children: [
                                Container(
                                  width: getProportionateScreenWidth(60),
                                  height: getProportionateScreenWidth(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: kSelectedButtonColor,
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenWidth(15),
                                ),
                                Text(
                                  "What is your rate?",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(18),
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: getProportionateScreenWidth(8),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    RatingBar(
                                      initialRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      minRating: 1,
                                      itemSize:
                                          getProportionateScreenHeight(40),
                                      ratingWidget: RatingWidget(
                                          full: const Icon(
                                            Icons.star,
                                            color: Color(0xffFFBA49),
                                          ),
                                          half: const Icon(
                                            Icons.star_half,
                                            color: Color(0xffFFBA49),
                                          ),
                                          empty: const Icon(
                                            Icons.star_outline,
                                            color: Color(0xffFFBA49),
                                          )),
                                      onRatingUpdate: (value) {
                                        rate = value.toInt();
                                      },
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                DefaultButton(
                                    content: "Rating",
                                    onPressed: () async {
                                      setState(() {
                                        widget.product.rating = (((double.parse(
                                                                widget.product
                                                                    .rating) *
                                                            double.parse(widget
                                                                .product
                                                                .numVote) +
                                                        rate) /
                                                    (double.parse(widget
                                                            .product.numVote) +
                                                        1))
                                                .toStringAsFixed(1))
                                            .toString();
                                        widget.product.numVote =
                                            (int.parse(widget.product.numVote) +
                                                    1)
                                                .toString();
                                        mainController.ratingProduct(
                                            widget.product, rate);
                                        favoriteController
                                            .updateItemInList(widget.product);
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        //width: MediaQuery.of(context).size.width ,
                                        backgroundColor: kSelectedButtonColor,
                                        content: Text(
                                          "Cảm ơn bạn đã đánh giá sản phẩm",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        duration: Duration(milliseconds: 1500),
                                      ));
                                      Navigator.pop(context);
                                    })
                              ],
                            )
                          : Column(
                              children: [
                                Container(
                                  width: getProportionateScreenWidth(60),
                                  height: getProportionateScreenWidth(6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: kSelectedButtonColor,
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenWidth(15),
                                ),
                                Text(
                                  "You rated for this product",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(18),
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: getProportionateScreenWidth(8),
                                ),
                                RatingBar(
                                  initialRating: isVoted?.star.toDouble() ?? 0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  itemSize: getProportionateScreenHeight(24),
                                  ratingWidget: RatingWidget(
                                      full: const Icon(
                                        Icons.star,
                                        color: Color(0xffFFBA49),
                                      ),
                                      half: const Icon(
                                        Icons.star_half,
                                        color: Color(0xffFFBA49),
                                      ),
                                      empty: const Icon(
                                        Icons.star_outline,
                                        color: Color(0xffFFBA49),
                                      )),
                                  onRatingUpdate: (value) {},
                                ),
                                const Spacer(),
                                DefaultButton(
                                    content: "Oke",
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                              ],
                            );
                    },
                  )));
        });
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/components/home/FavoriteIconButton.dart';
import 'package:interior_design_and_ar/components/product/default_color_button.dart';
import 'package:interior_design_and_ar/components/product/selected_color_button.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/size_config.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, getProportionateScreenWidth(30), 0, 0),
              child: Column(
                children: [
                  Image.network(
                    'https://sage-shop.com/WebRoot/Sage2/Shops/SageShop09/5C65/76B2/3C10/B652/F377/0A0C/05BC/F3AE/sessel_m.jpg',
                    width: getProportionateScreenWidth(375),
                    height: getProportionateScreenWidth(375),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0,
                        getProportionateScreenWidth(16),
                        0,
                        getProportionateScreenWidth(30)
                    ),
                    child: SizedBox(
                      width: getProportionateScreenWidth(315),
                      height: getProportionateScreenWidth(360),
                      child: Card(
                        color: Color(0xFFF6F6F9),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(28)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: getProportionateScreenWidth(18),),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: getProportionateScreenWidth(170),
                                    child: Text(
                                      'Armchair',
                                      style: TextStyle(
                                        fontSize: getProportionateScreenWidth(14),
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
                                      Icon(Icons.star, color: Colors.amber, size: getProportionateScreenWidth(24),),
                                      Text(
                                        '  4.9',
                                        style: TextStyle(
                                            fontSize: getProportionateScreenWidth(18),
                                            color: kTextColor1,
                                            fontWeight: FontWeight.w700
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),

                              SizedBox(height: getProportionateScreenWidth(8),),

                              Text(
                                'Light Grey Sofa',
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(24),
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor1,
                                ),
                              ),

                              SizedBox(height: getProportionateScreenWidth(12),),

                              SizedBox(
                                height: getProportionateScreenWidth(80),
                                child: Text(
                                  'Đây là 1 cái ghế nhé. Ngồi nó cảm giác ra sao thì mình không có biết, nghèo quá mà. Bạn có mua đươc thì cho mình ngồi ké với nhé... Thân yêu yêu yêu yêu yêu yêu yêu yêu yêu yêu yêu yêu yêu yêu yêu yêu yêu.',
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(12),
                                    color: kTextColor2,
                                    fontWeight: FontWeight.w500,
                                    height: getProportionateScreenWidth(1.5),
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 4,
                                  softWrap: true,
                                ),
                              ),

                              SizedBox(height: getProportionateScreenWidth(24),),

                              Row(
                                children: [
                                  Text(
                                    'Color: ',
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      color: kTextColor2,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(width: getProportionateScreenWidth(12),),

                                  SelectedColorButton(color: Colors.blueAccent),
                                  DefaultColorButton(color: Colors.amberAccent),
                                  DefaultColorButton(color: Colors.redAccent),
                                  DefaultColorButton(color: Colors.greenAccent),
                                  DefaultColorButton(color: Colors.grey),
                                ],
                              ),

                              SizedBox(height: getProportionateScreenWidth(24),),

                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FavoriteIconButton(isFavorite: true),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        primary: Color(0xFFFC7566),
                                        fixedSize: Size(getProportionateScreenWidth(170), getProportionateScreenWidth(48)),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(16))),
                                    child: Text(
                                      'View on camera',
                                      style: TextStyle(
                                          fontSize: getProportionateScreenWidth(18)),
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: getProportionateScreenWidth(18),),

                              Center(
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(''
                                      'Rating for product',
                                    style: TextStyle(
                                      color: kTextColor2,
                                      fontSize: getProportionateScreenWidth(16),
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),



                            ],

                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(getProportionateScreenWidth(20), getProportionateScreenWidth(16), 0, 0),
              child: SizedBox(
                width: getProportionateScreenWidth(40),
                height: getProportionateScreenWidth(40),
                child: TextButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: getProportionateScreenWidth(20),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.only(left: getProportionateScreenWidth(8)),
                    shape: const CircleBorder(),
                    primary: kPrimaryColor,
                    backgroundColor: Color(0xFFEBECF1),
                  ),
                ),
              ),
            ),

            // Container(
            //     color: Colors.amberAccent,
            //     child: Column(
            //       mainAxisSize: MainAxisSize.max,
            //       mainAxisAlignment: MainAxisAlignment.end,
            //       children: [
            //         SizedBox(
            //           width: getProportionateScreenWidth(375),
            //           height: getProportionateScreenWidth(280),
            //           child: Card(
            //             child: Column(
            //               children: [
            //                 Text('asd'),
            //               ],
            //             ),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),

            // Container(
            //   height: MediaQuery.of(context).size.height,
            //   child: Column(
            //     children: [
            //       Expanded(
            //         child: Align(
            //           alignment: Alignment.bottomCenter,
            //             child: Text('asd')),
            //       ),
            //
            //     ],
            //   ),
            // ),

            Visibility(
              visible: true,
              child: Positioned(
                bottom: 0,
                child: SizedBox(
                  height: getProportionateScreenWidth(280),
                  width: getProportionateScreenWidth(375),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(getProportionateScreenWidth(24)))),
                    child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenWidth(30)),
                      child: Column(
                        children: [
                          SizedBox(
                            width: getProportionateScreenWidth(60),
                            height: getProportionateScreenWidth(8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFF9B9B9B),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),



          ],
        )
      ),
    );
  }
}

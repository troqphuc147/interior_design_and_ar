import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interior_design_and_ar/controller/main_controller.dart';
import '../constants.dart';
import '../core/models/product.dart';
import '../screens/product/product_detail.dart';
import '../size_config.dart';

// ignore: must_be_immutable
class SearchBar extends StatelessWidget {
  final List<Product>? listProduct;
  List<String>? listOptions;
  final double width;
  SearchBar(
      {Key? key,
      required this.listProduct,
      required this.listOptions,
      required this.width})
      : super(key: key);
  final ScrollController scrollController = ScrollController();
  final MainController homeController = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    if (listOptions!.isEmpty) {
      listOptions = homeController.getListOption(listProduct!);
    }
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
          data: ThemeData(
            colorScheme:
                ThemeData().colorScheme.copyWith(primary: kSelectedButtonColor),
          ),
          child: Autocomplete<String>(
            fieldViewBuilder:
                (context, controller, focusNode, onEditingComplete) {
              return TextFormField(
                controller: controller,
                focusNode: focusNode,
                onEditingComplete: onEditingComplete,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 16,
                  ),
                  hintText: 'Search furniture',
                  contentPadding: EdgeInsets.fromLTRB(24, 16, 12, 16),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                  ),
                ),
                onChanged: (String text) {},
                onFieldSubmitted: (String text) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
              );
            },
            optionsMaxHeight: getProportionateScreenWidth(200),
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text.isEmpty) {
                return const Iterable<String>.empty();
              }
              return listOptions!.where((String option) {
                return option
                    .toLowerCase()
                    .contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selection) {
              debugPrint('You just selected $selection');
              FocusScope.of(context).unfocus();
            },
            optionsViewBuilder: (context, onSelected, options) {
              return Align(
                alignment: Alignment.topLeft,
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    margin:
                        EdgeInsets.only(top: getProportionateScreenWidth(5)),
                    width: getProportionateScreenWidth(width),
                    height: getProportionateScreenWidth(200),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(1, 1),
                              blurRadius: 4.0,
                              color: Colors.grey.withOpacity(0.45)),
                          BoxShadow(
                              offset: const Offset(-1, 0),
                              blurRadius: 4.0,
                              color: Colors.grey.withOpacity(0.45))
                        ]),
                    child: Scrollbar(
                      controller: scrollController,
                      isAlwaysShown: true,
                      child: ListView.builder(
                        controller: scrollController,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);

                          return GestureDetector(
                            onTap: () {
                              onSelected(option);

                              Product product =
                                  homeController.getSeachedProduct(option);
                              if (product.id == "") {
                                return;
                              }
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetail(
                                          product: product,
                                          category: "non",
                                          isFavorite: homeController
                                              .listFavoriteId
                                              .contains(product.id))));
                              FocusScope.of(context).unfocus();
                            },
                            child: ListTile(
                              title: Text(option,
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(14),
                                      color: kTextColor1,
                                      fontWeight: FontWeight.w700)),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}

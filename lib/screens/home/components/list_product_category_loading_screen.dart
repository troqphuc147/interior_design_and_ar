import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ListProductCategoryLoadingScreen extends StatelessWidget {
  final String category;
  const ListProductCategoryLoadingScreen({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          title: Container(
            width: getProportionateScreenWidth(375),
            height: getProportionateScreenWidth(58),
            padding: EdgeInsets.only(
                top: getProportionateScreenWidth(5),
                bottom: getProportionateScreenWidth(3)),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              elevation: 3.5,
              child: Theme(
                data: ThemeData(
                  colorScheme: ThemeData()
                      .colorScheme
                      .copyWith(primary: kSelectedButtonColor),
                ),
                child: TextFormField(
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
                    suffixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                ),
              ),
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: kTextColor1,
              size: getProportionateScreenWidth(24),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Builder(
                builder: (context) => IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt,
                      color: kTextColor1,
                      size: getProportionateScreenWidth(24),
                    )))
          ],
          elevation: 0,
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(24)),
            child: Column(children: [
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        category,
                        style: TextStyle(
                            color: kTextColor1,
                            fontSize: getProportionateScreenWidth(34),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Center(
                child: Image.asset(
                  "assets/images/loadingList.gif",
                  width: 150,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ))
            ])));
  }
}

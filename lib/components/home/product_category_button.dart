import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/size_config.dart';

import '../../constants.dart';

class ProductCategoryButton extends StatefulWidget {
  final IconData iconData;
  final String categoryName;
  final bool selected;
  final Function()? onTap;
  const ProductCategoryButton(
      {Key? key,
      required this.iconData,
      required this.categoryName,
      required this.selected,
      this.onTap})
      : super(key: key);

  @override
  State<ProductCategoryButton> createState() => _ProductCategoryButtonState();
}

class _ProductCategoryButtonState extends State<ProductCategoryButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
      child: TextButton(
          onPressed: widget.onTap,
          style: TextButton.styleFrom(
            minimumSize: Size(getProportionateScreenWidth(80),
                getProportionateScreenWidth(48)),
            backgroundColor:
                widget.selected ? kSelectedButtonColor : kDefaultButtonColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                widget.iconData,
                color: widget.selected ? Colors.white : Colors.grey,
                size: getProportionateScreenWidth(24),
              ),
              Text(
                '   ' + widget.categoryName + '   ',
                style: TextStyle(
                  color: widget.selected ? Colors.white : kTextColor1,
                ),
              ),
            ],
          )),
    );
  }
}

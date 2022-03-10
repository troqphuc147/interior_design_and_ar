import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/size_config.dart';

class CategoryButton extends StatefulWidget {
  final String content;
  final Function() onPress;
  final String linkImage;
  final bool isSelected;
  const CategoryButton(
      {Key? key,
      required this.content,
      required this.onPress,
      required this.linkImage,
      required this.isSelected})
      : super(key: key);

  @override
  _CategoryButtonState createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: SizedBox(
        height: getProportionateScreenWidth(30),
        child: Chip(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(7),
              vertical: getProportionateScreenWidth(12)),
          avatar: SvgPicture.asset(widget.linkImage,
              color: widget.isSelected ? Colors.white : kTextColor2),
          label: Text(
            widget.content,
            style: TextStyle(
              color: widget.isSelected ? Colors.white : kTextColor2,
            ),
          ),
          backgroundColor:
              widget.isSelected ? kSelectedButtonColor : kDefaultButtonColor,
        ),
      ),
    );
  }
}

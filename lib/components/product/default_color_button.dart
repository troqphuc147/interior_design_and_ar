import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/size_config.dart';

class DefaultColorButton extends StatefulWidget {
  Color color;

  DefaultColorButton({Key? key, required this.color}) : super(key: key);

  @override
  State<DefaultColorButton> createState() => _DefaultColorButtonState();
}

class _DefaultColorButtonState extends State<DefaultColorButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
      child: GestureDetector(
        onTap: () {

        },
        child: SizedBox(
          width: getProportionateScreenWidth(18),
          height: getProportionateScreenWidth(18),
          child: CircleAvatar(
            backgroundColor: widget.color,
          ),
        ),
      ),
    );
  }
}

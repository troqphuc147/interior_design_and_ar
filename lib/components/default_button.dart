import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatefulWidget {
  final String content;
  final Function()? onPressed;
  const DefaultButton(
      {Key? key, required this.content, required this.onPressed})
      : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
      ),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
            primary: kSelectedButtonColor,
            minimumSize: Size.fromHeight(getProportionateScreenWidth(44)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24))),
        child: Text(
          widget.content,
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
      ),
    );
  }
}

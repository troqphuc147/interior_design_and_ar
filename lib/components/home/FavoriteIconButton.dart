import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/size_config.dart';

class FavoriteIconButton extends StatefulWidget {
  bool isFavorite;
  FavoriteIconButton({Key? key, required this.isFavorite}) : super(key: key);

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(48),
      height: getProportionateScreenWidth(48),
      child: TextButton(
        onPressed: () {},
        child: Icon(
          widget.isFavorite ? Icons.favorite : Icons.favorite_outline,
          color: widget.isFavorite ? Colors.redAccent : Colors.grey,
          size: getProportionateScreenWidth(24),
        ),
        style: TextButton.styleFrom(
          shape: const CircleBorder(),
          primary: kPrimaryColor,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}

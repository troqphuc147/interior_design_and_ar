import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/size_config.dart';

class SelectedColorButton extends StatefulWidget {
  final Color color;

  const SelectedColorButton({Key? key, required this.color}) : super(key: key);

  @override
  State<SelectedColorButton> createState() => _SelectedColorButtonState();
}

class _SelectedColorButtonState extends State<SelectedColorButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
      child: GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: getProportionateScreenWidth(24),
          height: getProportionateScreenWidth(24),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.5,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: getProportionateScreenWidth(18),
                      height: getProportionateScreenWidth(18),
                      child: CircleAvatar(
                        backgroundColor: widget.color,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

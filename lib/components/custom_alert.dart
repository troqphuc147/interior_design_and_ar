import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:interior_design_and_ar/constants.dart';

import '../size_config.dart';

// Dialog hiển thị cảnh báo
class CustomAlert extends StatefulWidget {
  final iconPath; // path(đường dẫn) của icon cảnh báo
  final title; // tiêu đề của icon cảnh báo
  final content; // nội dung của icon cảnh báo

  //Khởi tạo các thuộc tính mặc định của class
  const CustomAlert({
    Key? key,
    this.iconPath = 'assets/images/alert.svg',
    this.title = 'Oops...',
    this.content = "Something was wrong!",
  }) : super(key: key);

  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert>
    with SingleTickerProviderStateMixin {
  //Tạo controller animation cho animation
  late AnimationController controller;
  //Tạo animation
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
            margin: EdgeInsets.only(top: 20, left: 20, right: 20.0),
            width: 315,
            decoration: BoxDecoration(),
            child: ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        widget.iconPath,
                        height: 50.0,
                        width: 50.0,
                        alignment: Alignment.center,
                      ),
                      SizedBox(height: 15.0),
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: kTextColor1,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        widget.content,
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          color: kTextColor1,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  //SizedBox(height: 10.0),
                  Container(
                    //height: 150.0,
                    margin: EdgeInsets.only(top: 10.0),
                    decoration: BoxDecoration(
                        border: Border(
                            top: BorderSide(
                      width: 1,
                      color: Colors.red.withOpacity(0.12),
                    ))),
                    width: double.infinity,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            color: kTextColor1,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        )),
                  )
                ])),
      ),
    );
  }
}

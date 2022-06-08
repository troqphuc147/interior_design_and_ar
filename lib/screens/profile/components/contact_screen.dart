import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:http/http.dart' as http;
import 'package:interior_design_and_ar/core/service/auth.dart';
import '../../../components/custom_alert.dart';
import '../../../size_config.dart';

class SendQuestionScreen extends StatefulWidget {
  const SendQuestionScreen({Key? key}) : super(key: key);

  @override
  _SendQuestionScreenState createState() => _SendQuestionScreenState();
}

class _SendQuestionScreenState extends State<SendQuestionScreen> {
  bool isSending = false;
  String content = "";
  String subject = "";

  sendMail() async {
    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    String serviceID = "service_0muhjng";
    String userID = "YWV-AxP68uDrgs7xT";
    String templateID = "template_736105v";

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "service_id": serviceID,
          "template_id": templateID,
          "user_id": userID,
          "template_params": {
            "user_name": AuthService.instance.getCurrentUser?.displayName,
            "subject": subject,
            "message": content,
            "user_email": AuthService.instance.getCurrentUser?.email,
          }
        }));
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const CloseButton(
          color: kSelectedButtonColor,
        ),
        title: Text(
          'Contact us',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(24),
            color: kTextColor1,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              setState(() {
                isSending = true;
              });
              if (content == "") {
                _showAlertDialog('Please type your message!', 'Alert');
              } else {
                var result = await sendMail();
                if (result == 200) {
                  _showAlertDialog('Sent email!', 'Success');
                }
              }
              setState(() {
                isSending = false;
              });
            },
            child: Container(
              padding: const EdgeInsets.only(right: 10),
              child: const Center(
                child: Icon(
                  Icons.send,
                  color: kSelectedButtonColor,
                ),
              ),
            ),
          )
        ],
      ),
      // Nếu đang gửi thì sẽ hiển thị xoay xoay
      body: isSending
          ? const Center(
              child: CircularProgressIndicator(
                  backgroundColor: kSelectedButtonColor),
            )
          // Nếu không phải đang gửi thì hiển thị giao diện chính gồm 2 text form field
          : Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(20)),
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  // Nhập tiêu đề tại đây
                  TextFormField(
                    onChanged: (val) {
                      subject = val;
                    },
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(20),
                      color: kTextColor1,
                      fontWeight: FontWeight.w600,
                    ),
                    cursorColor: kSelectedButtonColor,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: kSelectedButtonColor.withOpacity(0.54)),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.5,
                          ),
                        ),
                        hintText: "Subject",
                        hintStyle: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w300,
                        )),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(10),
                  ),
                  // Nhập nội dung tại đây
                  TextFormField(
                    onChanged: (val) {
                      content = val;
                    },
                    maxLines: 35,
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(16),
                      color: kTextColor1,
                      fontWeight: FontWeight.w700,
                    ),
                    cursorColor: kSelectedButtonColor,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Type your message",
                        hintStyle: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.w300,
                        )),
                  )
                ],
              ),
            ),
    );
  }

// Hiển thị dialog thông báo việc gửi mail thành công/ thất bại/ cảnh báo nhập liệu
  Future<void> _showAlertDialog(String content, String title) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      barrierColor: title == 'Alert'
          ? Colors.redAccent.withOpacity(0.45)
          : kSelectedButtonColor.withOpacity(0.54),
      builder: (BuildContext context) {
        if (title == 'Alert') {
          return CustomAlert(
            content: content,
          );
        } else {
          return CustomAlert(
            content: content,
            title: title,
            iconPath: 'assets/images/success.svg',
          );
        }
      },
    );
  }
}

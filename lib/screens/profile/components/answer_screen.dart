import 'package:flutter/material.dart';
import 'package:interior_design_and_ar/constants.dart';
import 'package:interior_design_and_ar/screens/profile/components/guide_content.dart';

import '../../../size_config.dart';

class AnswerTheQuestions extends StatelessWidget {
  const AnswerTheQuestions({Key? key, required this.guide}) : super(key: key);
  final Guide guide;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CloseButton(
          color: kSelectedButtonColor,
        ),
        centerTitle: true,
        title: Text(
          'Our Answer',
          style: TextStyle(
            fontSize: getProportionateScreenWidth(24),
            color: kTextColor1,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 0,
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 15,
          ),
          //Câu hỏi được in đậm, xuất hiện ở trên
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              guide.question,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          //Câu trả lời được đặt ở dưới, chữ bình thường
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              guide.content,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(20),
                color: kTextColor1,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

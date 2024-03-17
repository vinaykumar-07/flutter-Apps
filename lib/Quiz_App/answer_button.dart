import 'package:brand_assignment/widgets/small_text.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.onTap, required this.answertext});
  final String answertext;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            backgroundColor: const Color.fromARGB(66, 94, 45, 119),
            shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
        onPressed: onTap,
        child: SmallText(
          text: answertext,
          color: Colors.white,
        ),
      ),
    );
  }
}

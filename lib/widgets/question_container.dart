import 'package:flutter/material.dart';
import '../constants.dart';
import '../model/question_model.dart';

class QuestionContainer extends StatelessWidget {
  const QuestionContainer({super.key, required this.currentQuestionNumber, required this.num, required this.statusList});

  final int num;
  final int currentQuestionNumber;
  final List statusList;

  @override
  Widget build(BuildContext context) {

    Color color = kLightBlueColor;
      int temp = num - 1;
      int size = questionList.length;
      if (temp == currentQuestionNumber) {
        if (temp == size - 1 && statusList[temp] != 0) {
          if (statusList[temp] == true) {
            color = kLightGreenColor;
          } //
          else if (statusList[temp] == false) {
            color = kLightRedColor;
          } //
          else {}
        } //
        else {
          color = Colors.white;
        }
      } //
      else {
        if (statusList[temp] == true) {
          color = kLightGreenColor;
        } //
        else if (statusList[temp] == false) {
          color = kLightRedColor;
        } //
        else {}
      }

    return Container(
      height: temp == currentQuestionNumber ? 80 : 60,
      width: temp == currentQuestionNumber ? 80 : 60,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: Center(
        child: Text(
          '$num',
          style: TextStyle(
            fontSize: temp == currentQuestionNumber ? 45 : 30,
            fontWeight: FontWeight.bold,
            color: temp == currentQuestionNumber ? Colors.blue : Colors.white,
          ),
        ),
      ),
    );
  }
}

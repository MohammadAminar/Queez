import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/question_container.dart';
import '../model/question_model.dart';

class QuestionListRow extends StatelessWidget {
  const QuestionListRow(
      {super.key,
      required this.scrollController,
      required this.currentQuestionNumber,
      required this.statusList});

  final int currentQuestionNumber;
  final List statusList;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    for (int i = 0; i < questionList.length; i++) {
      list.add(
        QuestionContainer(
          currentQuestionNumber: currentQuestionNumber,
          num: i + 1,
          statusList: statusList,
        ),
      );
    }

    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(children: list),
    );
  }
}

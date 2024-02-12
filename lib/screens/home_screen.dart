// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/result_screen.dart';
import 'package:quiz_app/widgets/answer_container.dart';
import 'package:quiz_app/widgets/base_widget.dart';
import 'package:quiz_app/widgets/progress_bar.dart';
import 'package:quiz_app/widgets/question_list_row.dart';

import '../model/question_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController controller;

  late Animation animation;

  ScrollController scrollController = ScrollController();

  late Size size;

  int currentQuestionNumber = 0;

  bool isOnePressed = true;

  List statusList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < questionList.length; i++) {
      statusList.add(0);
    }
    print(statusList);

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 10,
      ),
    );
    animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(controller)
      ..addListener(() {
        setState(
              () {
            if ((animation.value * 100).round() >= 98) {
              onNextPressed(true);
              if (controller.isAnimating) {
                controller.reset();
                controller.forward();
              }
            }
          },
        );
      });
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return BaseWidget(
      children: [
        const SizedBox(
          height: 80,
        ),
        ProgressBar(animation: animation),
        const SizedBox(
          height: 20,
        ),
        QuestionListRow(
          currentQuestionNumber: currentQuestionNumber,
          scrollController: scrollController,
          statusList: statusList,
        ),
        SizedBox(
          height: size.height - 295,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width - 160,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 70,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  width: size.width - 110,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(35),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 70,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 90,
                height: size.height - 428,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: size.width - 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.white,
                        kLightBlueColor,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 70,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 150,
                      ),
                      SizedBox(
                        height: 190,
                        child: Text(
                          textAlign: TextAlign.center,
                          questionList[currentQuestionNumber].question,
                          style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Kalameh_Bold',
                            color: kDarkBlueColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AnswerContainer(
                            answer: questionList[currentQuestionNumber].answer1,
                            num: 1,
                            isOnePressed: isOnePressed,
                            onTapped: () {
                              onAnswerPressed(1);
                            },
                          ),
                          AnswerContainer(
                            answer: questionList[currentQuestionNumber].answer2,
                            num: 2,
                            isOnePressed: isOnePressed,
                            onTapped: () {
                              onAnswerPressed(2);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                child: Image.asset(
                  questionList[currentQuestionNumber].imageAddress,
                  height: 250,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Material(
              color: kNextButtonColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(15),
                ),
                onTap: () {
                  onNextPressed(false);
                },
                child: Container(
                  width: 200,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Material(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
              child: InkWell(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
                onTap: () {
                  myNavigator();
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: const BoxDecoration(
                    color: kPurpleColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.flag,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  myNavigator() {
    controller.reset();
    controller.dispose();

    List<int> resultList = grader();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(
          resultList: resultList,
        ),
      ),
    );
  }

  void onNextPressed(bool isFromTimer) {
    scrollController.animateTo(
      currentQuestionNumber * 70,
      duration: const Duration(microseconds: 500),
      curve: Curves.easeInOut,
    );
    if (isFromTimer) {
      statusList[currentQuestionNumber] = false;
    } //
    else {
      checkAnswer();
    }
    if (currentQuestionNumber >= 9) {
      myNavigator();
    } //
    else {
      currentQuestionNumber++;
      controller.reset();
      controller.forward();
      setState(() {});
    }
  }

  onAnswerPressed(int num) {
    if (num == 1) {
      setState(() {
        isOnePressed = true;
      });
    } //
    else {
      setState(() {
        isOnePressed = false;
      });
    }
  }

  checkAnswer() {
    int myAnswer = isOnePressed ? 1 : 2;
    bool status = questionList[currentQuestionNumber].isRight(myAnswer);
    statusList[currentQuestionNumber] = status;
  }

  List<int> grader() {
    int rightAnswer = 0;
    int wrongAnswer = 0;
    int whiteAnswer = 0;

    for (var item in statusList) {
      if (item == true) {
        rightAnswer++;
      } //
      else if (item == false) {
        wrongAnswer++;
      } //
      else {
        whiteAnswer++;
      }
    }

    return [rightAnswer, wrongAnswer, whiteAnswer];
  }
}

// ignore_for_file: must_be_immutable, avoid_print

import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:quiz_app/screens/point_screen.dart';
import 'package:quiz_app/widgets/base_widget.dart';
import 'package:quiz_app/widgets/custom_alert.dart';
import 'package:quiz_app/widgets/custom_button.dart';
import 'package:quiz_app/widgets/point_row.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.resultList});

  TextEditingController controller = TextEditingController();

  final List<int> resultList;

  late Size size;

  String status = '';

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    if (resultList[0] > resultList[1]) {
      status = 'winner';
    } //
    else {
      status = 'loser';
    }
    return BaseWidget(
      children: [
        const SizedBox(
          height: 60,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                status == 'winner' ? kLightGreenColor : kLightRedColor,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.center,
            ),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: size.height - 300,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 60,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        width: size.width - 80,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(50),
                            bottom: Radius.circular(50),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 120,
                            ),
                            Text(
                              'you are ${status == 'winner' ? 'winner!' : 'loser!'}',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: status == 'winner'
                                    ? Colors.green
                                    : Colors.red,
                                fontSize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            const Divider(
                              height: 2,
                              thickness: 3,
                              color: Colors.green,
                              indent: 10,
                              endIndent: 10,
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            PointRow(
                              color: Colors.green,
                              text: 'correct',
                              icon: Icons.done_outline_outlined,
                              point: '${resultList[0]}',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PointRow(
                              point: '${resultList[1]}',
                              icon: Icons.highlight_remove,
                              text: 'wrong',
                              color: Colors.red,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            PointRow(
                              color: Colors.grey,
                              text: 'white',
                              icon: Icons.check_box_outline_blank,
                              point: '${resultList[2]}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Image.asset(
                        'assets/images/correct.png',
                        width: 300,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              width: 170,
              onTap: () {
                onPLayAgainPressed(context);
              },
              color: Colors.yellowAccent,
              text: 'Play again',
            ),
            CustomButton(
              text: 'Results',
              color: Colors.white,
              onTap: () {
                AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.infoReverse,
                  headerAnimationLoop: false,
                  body: Column(
                    children: [
                      TextField(
                        controller: controller,
                        maxLength: 10,
                        decoration: InputDecoration(
                          label: const Text('Name'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  btnOkOnPress: () {
                    onOkPressed(context);
                  },
                  btnCancelOnPress: () {},
                ).show();
              },
              width: 170,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  void onPLayAgainPressed(context) {
    showDialog(
      context: context,
      builder: (context) => CustomAlert(
        onYesPressed: () {
          onYesPressed(context);
        },
        onNoPressed: () {
          onNoPressed(context);
        },
      ),
    );
  }

  void onYesPressed(context) {
    Phoenix.rebirth(context);
  }

  void onNoPressed(context) {
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    } //
    else if (Platform.isIOS) {
      exit(0);
    } //
    else {
      Navigator.pop(context);
    }
  }

  void onOkPressed(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = prefs.getStringList('scores') ?? [];
    list.add('${controller.text} / ${resultList[0]} / ${resultList[1]} / ${resultList[2]}');
    await prefs.setStringList('scores', list);
    print(prefs.getStringList('scores'));

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PointScreen(),
      ),
    );

    controller.clear();
  }
}

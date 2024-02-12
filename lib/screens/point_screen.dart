// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/widgets/base_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PointScreen extends StatelessWidget {
  PointScreen({super.key});

  String status = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            kLightBlueBackgroundColor,
            kDarkBlueBackgroundColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FutureBuilder(
            future: loadData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                print(snapshot.data);
                List<String> resultList = snapshot.data;
                return bodyMaker(resultList);
              } //
              else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }

  bodyMaker(List<String> resultList) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 40,
        ),
        Center(
          child: Image.asset(
            'assets/images/point.png',
            height: 250,
          ),
        ),
        const Spacer(),
        Container(
          height: 450,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 22,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'User',
                        style: TextStyle(fontSize: 22),
                      ),
                      Spacer(),
                      Icon(
                        Icons.done_outline_outlined,
                        size: 40,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.highlight_remove,
                        size: 40,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.check_box_outline_blank,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: resultList.length,
                  itemBuilder: (context, index) {
                    String name = resultList[index].split('/')[0];
                    int right = int.parse(resultList[index].split('/')[1]);
                    int wrong = int.parse(resultList[index].split('/')[2]);
                    if (right > wrong) {
                      status = 'winner';
                    } //
                    else {
                      status = 'loser';
                    }
                    return Container(
                      height: 60,
                      margin: const EdgeInsets.only(
                        left: 5,
                        top: 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.horizontal(
                          left: Radius.circular(30),
                        ),
                        gradient: LinearGradient(
                          colors: [
                            status == 'winner'
                                ? kLightGreenColor
                                : kLightRedColor,
                            Colors.white,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Text(
                            name,
                            style: const TextStyle(fontSize: 22),
                          ),
                          const Spacer(),
                          Text(
                            resultList[index].split('/')[1],
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            resultList[index].split('/')[2],
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            resultList[index].split('/')[3],
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<List<String>> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('scores') ?? [];
    // return [];
  }
}

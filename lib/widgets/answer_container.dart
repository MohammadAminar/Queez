import 'package:flutter/material.dart';
import '../constants.dart';

class AnswerContainer extends StatelessWidget {
  const AnswerContainer(
      {super.key,
      required this.isOnePressed,
      required this.num,
      required this.answer,
      required this.onTapped});

  final bool isOnePressed;
  final int num;
  final String answer;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: isOnePressed && num == 1 || !isOnePressed && num == 2
                  ? kPurpleShadowColor
                  : kBlueShadowColor,
              offset: const Offset(-4, -4),
            ),
            BoxShadow(
              color: isOnePressed && num == 1 || !isOnePressed && num == 2
                  ? kPurpleColor
                  : kLightBlueColor,
            ),
          ],
        ),
        child: Text(
          answer,
          style: const TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontFamily: 'Kalameh_Regular',
          ),
        ),
      ),
    );
  }
}

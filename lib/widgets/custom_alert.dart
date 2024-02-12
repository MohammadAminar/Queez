import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/widgets/custom_button.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert(
      {super.key, required this.onYesPressed, required this.onNoPressed});

  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Would you like to play again?',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: CustomButton(
                  width: 70,
                  onTap: () {
                    onYesPressed();
                  },
                  color: kLightGreenColor,
                  text: 'Yes',
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: CustomButton(
                  text: 'No',
                  color: kLightRedColor,
                  onTap: () {
                    onNoPressed();
                  },
                  width: 70,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

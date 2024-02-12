import 'package:flutter/material.dart';
import '../constants.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key, required this.animation});

  final Animation animation;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kLightBlueColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: LinearProgressIndicator(
          value: animation.value,
          backgroundColor: kLightBlueColor,
          valueColor: const AlwaysStoppedAnimation(Colors.white),
        ),
      ),
    );
  }
}

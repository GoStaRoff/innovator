import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/text_styles.dart';

class IntroductionScreen extends StatelessWidget {
  final Widget child;
  final String title;
  final String description;

  const IntroductionScreen({
    Key? key,
    required this.child,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: Get.width,
          height: Get.height / 1.9,
          child: child,
        ),
        const SizedBox(
          height: 24.0,
        ),
        Text(
          title,
          style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 14.0,
        ),
        Text(
          description,
          style: MAIN_TEXT_STYLE_BLACK,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

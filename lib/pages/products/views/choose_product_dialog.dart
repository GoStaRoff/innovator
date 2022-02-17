import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';

class ChooseProductDialog extends StatelessWidget {
  const ChooseProductDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {},
          child: RoundedContainer(
            width: Get.width / 2,
            height: 60,
            color: VIOLET_COLOR,
            borderRadius: 40,
            child: Center(
              child: Text(
                "Технология",
                style: TITLE_TEXT_STYLE_WHITE,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () {},
          child: RoundedContainer(
            width: Get.width / 2,
            height: 60,
            color: VIOLET_COLOR,
            borderRadius: 40,
            child: Center(
              child: Text(
                "Цифровой",
                style: TITLE_TEXT_STYLE_WHITE,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () {},
          child: RoundedContainer(
            width: Get.width / 2,
            height: 60,
            color: VIOLET_COLOR,
            borderRadius: 40,
            child: Center(
              child: Text(
                "Интернет",
                style: TITLE_TEXT_STYLE_WHITE,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () {},
          child: RoundedContainer(
            width: Get.width / 2,
            height: 60,
            color: VIOLET_COLOR,
            borderRadius: 40,
            child: Center(
              child: Text(
                "Физический",
                style: TITLE_TEXT_STYLE_WHITE,
              ),
            ),
          ),
        ),
        SizedBox(
          height: Get.height / 9,
        ),
      ],
    );
  }
}

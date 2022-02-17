import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';
import 'package:innovator/pages/profile/components/dragable_container.dart';

class AdviceDialog extends StatelessWidget {
  const AdviceDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableContainer(
      height: Get.height / 1.6,
      children: [
        const Text(
          "Подсказка",
          style: TITLE_TEXT_STYLE_BLACK,
        ),
        const SizedBox(
          height: 26,
        ),
        Text(
          "Используя наш опыт, мы подготовили четыре алгоритма по созданию новых продуктов",
          style:
              MAIN_TEXT_STYLE_BLACK.copyWith(color: Colors.black, fontSize: 16),
        ),
        const SizedBox(
          height: 16,
        ),
        RoundedContainer(
          color: LIGHT_GREY_COLOR,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Физический продукт",
                  style: MAIN_TEXT_STYLE_BLACK.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Любой продукт, который можно потрогать. Например, стул, телефон или детская игрушка",
                  style: MAIN_TEXT_STYLE_BLACK.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        RoundedContainer(
          color: LIGHT_GREY_COLOR,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Интернет-продукт",
                  style: MAIN_TEXT_STYLE_BLACK.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Сайт, мобильное приложение, игра или программа",
                  style: MAIN_TEXT_STYLE_BLACK.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        RoundedContainer(
          color: LIGHT_GREY_COLOR,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Цифровой продукт",
                  style: MAIN_TEXT_STYLE_BLACK.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Фото, видео или звуковой файл",
                  style: MAIN_TEXT_STYLE_BLACK.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        RoundedContainer(
          color: LIGHT_GREY_COLOR,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Технология",
                  style: MAIN_TEXT_STYLE_BLACK.copyWith(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Способ что-то создать, получить или произвести. Например, технология шифрования информации",
                  style: MAIN_TEXT_STYLE_BLACK.copyWith(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

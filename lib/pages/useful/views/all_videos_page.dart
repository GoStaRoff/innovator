import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/header.dart';
import 'package:innovator/pages/global_components/page_wrapper.dart';
import 'package:innovator/pages/useful/components/useful_video_widget.dart';

class AllVideosPage extends StatelessWidget {
  const AllVideosPage({Key? key}) : super(key: key);
  static String id = "/allVideos";

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      header: Header(),
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Все видео",
          style: TITLE_TEXT_STYLE_BLACK.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 26,
        ),
        Column(
          children: List.generate(
            10,
            (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: UsefulVideoWidget(
                width: Get.width,
                title: "Как пользоваться этим приложением?",
                imageUrl:
                    "https://lifehacker.ru/wp-content/uploads/2017/11/Robo_1511871743.jpg",
              ),
            ),
          ),
        )
      ],
    );
  }
}

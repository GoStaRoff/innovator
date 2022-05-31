import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/functions.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/useful/views/article_dialog.dart';

class UsefulArticleWidget extends StatelessWidget {
  UsefulArticleWidget({Key? key, required this.title, required this.imageUrl})
      : super(key: key);
  String imageUrl;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppDialog(ArticleDialog());
      },
      child: Stack(
        children: [
          Container(
            width: Get.width,
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: Get.width,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
            ),
          ),
          Positioned(
            top: 24,
            left: 24,
            child: Container(
              decoration: BoxDecoration(
                  color: VIOLET_COLOR,
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Text(
                  "Статья",
                  style: MAIN_TEXT_STYLE_WHITE,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            child: Container(
              height: 40,
              width: Get.width / 1.5,
              child: AutoSizeText(
                title,
                maxLines: 2,
                style: TITLE_TEXT_STYLE_WHITE.copyWith(fontSize: 16.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

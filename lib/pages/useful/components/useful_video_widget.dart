import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';

class UsefulVideoWidget extends StatelessWidget {
  UsefulVideoWidget(
      {Key? key,
      required String this.imageUrl,
      required this.title,
      required this.width})
      : super(key: key);
  String imageUrl;
  double width;
  String title;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.toNamed(NewsPage.id, arguments: i);
      },
      child: Stack(
        children: [
          Container(
            width: width,
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
            width: width,
            height: 180,
            decoration: BoxDecoration(
              color: VIOLET_COLOR.withOpacity(0.75),
              borderRadius: BorderRadius.all(Radius.circular(13.0)),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 24.5,
                  backgroundColor: Colors.transparent,
                  child: SvgPicture.asset("assets/icons/play_icon.svg"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  width: Get.width / 1.5,
                  child: AutoSizeText(
                    title,
                    maxLines: 2,
                    style: TITLE_TEXT_STYLE_WHITE.copyWith(fontSize: 16.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/functions.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/header.dart';
import 'package:innovator/pages/global_components/page_wrapper.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';
import 'package:innovator/pages/profile/components/item_button.dart';
import 'package:innovator/pages/profile/views/about_dialog.dart' as about;
import 'package:innovator/pages/profile/views/politic_dialog.dart';
import 'package:innovator/pages/profile/views/recommendation_dialog.dart';
import 'package:innovator/pages/profile/views/recommendation_news_dialog.dart';
import 'package:innovator/pages/profile/views/report_error_dialog.dart';

class ProfilePage extends StatelessWidget {
  static String id = "/profile";
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      header: Header(),
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Профиль",
          style: TITLE_TEXT_STYLE_BLACK.copyWith(
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 26,
        ),
        RoundedContainer(
          width: Get.width,
          height: 88.0,
          color: VIOLET_COLOR,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 32.0,
                  child: CircleAvatar(
                    backgroundColor: VIOLET_COLOR,
                    radius: 30.0,
                    child: CircleAvatar(
                      radius: 26,
                      backgroundImage:
                          AssetImage("assets/images/user_example_image.png"),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sergey Moskvin",
                      style: TITLE_TEXT_STYLE_WHITE.copyWith(fontSize: 16),
                    ),
                    const Text(
                      "s.moskvin@innovator.com",
                      style: MAIN_TEXT_STYLE_WHITE,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        ItemButton(
          iconData: "assets/icons/user_icon.svg",
          text: "О приложении",
          onTap: () {
            AppDialog(const about.AboutDialog());
          },
        ),
        ItemButton(
          iconData: "assets/icons/thumb_icon.svg",
          text: "Оценить приложение",
          onTap: () {},
        ),
        ItemButton(
          iconData: "assets/icons/alert_triangle_icon.svg",
          text: "Сообщить об ошибке",
          onTap: () {
            AppDialog(ReportErrorDialog());
          },
        ),
        ItemButton(
          iconData: "assets/icons/award_icon.svg",
          text: "Порекомендовать улучшение",
          onTap: () {
            AppDialog(RecommendationDialog());
          },
        ),
        ItemButton(
          iconData: "assets/icons/news_icon.svg",
          text: "Порекомендовать новость",
          onTap: () {
            AppDialog(RecommendationNewsDialog());
          },
        ),
        ItemButton(
          iconData: "assets/icons/book_open_icon.svg",
          text: "Политика конфиденциальности",
          onTap: () {
            AppDialog(const PoliticDialog());
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/header.dart';
import 'package:innovator/pages/global_components/page_padding.dart';
import 'package:innovator/pages/global_components/page_wrapper.dart';
import 'package:innovator/pages/useful/components/useful_article_widget.dart';
import 'package:innovator/pages/useful/components/useful_video_widget.dart';
import 'package:innovator/pages/useful/views/all_articles_page.dart';
import 'package:innovator/pages/useful/views/all_videos_page.dart';

class UsefulScreeen extends StatelessWidget {
  const UsefulScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      withPagePadding: false,
      header: PagePadding(
        child: Header(
          leftWidget: Text(
            "Полезное",
            style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 20),
          ),
        ),
      ),
      children: [
        PagePadding(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Видео",
                style: TITLE_TEXT_STYLE_BLACK,
              ),
              InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                onTap: () {
                  Get.toNamed(AllVideosPage.id);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                  child: Text(
                    "Все видео",
                    style: MAIN_TEXT_STYLE_BLACK,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 0,
                width: 0,
              );
            },
            itemCount: 3,
            itemBuilder: (_, i) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: UsefulVideoWidget(
                width: Get.width / 1.2,
                title: "Как пользоваться этим приложением?",
                imageUrl:
                    "https://lifehacker.ru/wp-content/uploads/2017/11/Robo_1511871743.jpg",
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        PagePadding(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Статьи",
                    style: TITLE_TEXT_STYLE_BLACK,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    onTap: () {
                      Get.toNamed(AllArticlesPage.id);
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      child: Text(
                        "Все статьи",
                        style: MAIN_TEXT_STYLE_BLACK,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: UsefulArticleWidget(
                      imageUrl: "https://i.work.ua/article/2173b.jpg",
                      title: "Сложно ли открыть свою компанию?",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

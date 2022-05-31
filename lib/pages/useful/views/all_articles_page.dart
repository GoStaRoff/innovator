import 'package:flutter/material.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/header.dart';
import 'package:innovator/pages/global_components/page_wrapper.dart';
import 'package:innovator/pages/useful/components/useful_article_widget.dart';

class AllArticlesPage extends StatelessWidget {
  const AllArticlesPage({Key? key}) : super(key: key);
  static String id = "/allArticles";

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      header: Header(),
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          "Все статьи",
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
              child: UsefulArticleWidget(
                imageUrl: "https://i.work.ua/article/2173b.jpg",
                title: "Сложно ли открыть свою компанию?",
              ),
            ),
          ),
        )
      ],
    );
  }
}

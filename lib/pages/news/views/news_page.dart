import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/custom_list_view.dart';
import 'package:innovator/pages/news/controllers/news_controller.dart';
import 'package:innovator/pages/video/views/video_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  static String id = "/news_page";
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsController newsController = Get.find();
  var newsObject;
  @override
  void initState() {
    newsObject = newsController.news[Get.arguments];
    print(newsObject);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomListView(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width,
                    child: Image.network(
                      newsObject["pictureUrl"],
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                                VideoScreen(videoUrl: newsObject["videoUrl"]));
                          },
                          child: CircleAvatar(
                            radius: 24.5,
                            backgroundColor: Colors.transparent,
                            child:
                                SvgPicture.asset("assets/icons/play_icon.svg"),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          newsObject["title"],
                          style: TITLE_TEXT_STYLE_WHITE.copyWith(
                            fontSize: 20.0,
                            shadows: <Shadow>[
                              const Shadow(
                                blurRadius: 20.0,
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          newsObject["subtitle"],
                          style: MAIN_TEXT_STYLE_WHITE.copyWith(
                            shadows: <Shadow>[
                              const Shadow(
                                blurRadius: 20.0,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            newsObject["text"],
                            style: MAIN_TEXT_STYLE_BLACK.copyWith(
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Text(
                                "Источник:",
                                style: TITLE_TEXT_STYLE_BLACK.copyWith(
                                    color: Color(0xFF8D8D8D), fontSize: 14),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                onTap: () async {
                                  final url = newsObject["sourceUrl"];
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child: Text(
                                  "ссылка",
                                  style: TITLE_TEXT_STYLE_BLACK.copyWith(
                                      color: VIOLET_COLOR, fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            left: 20,
            top: 20,
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  Get.back(closeOverlays: true);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.black26,
                  radius: 20.0,
                  child: SvgPicture.asset(
                    "assets/icons/arrow_left_icon.svg",
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

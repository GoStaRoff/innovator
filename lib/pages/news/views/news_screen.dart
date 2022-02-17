import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/header.dart';
import 'package:innovator/pages/global_components/page_padding.dart';
import 'package:innovator/pages/global_components/page_wrapper.dart';
import 'package:innovator/pages/news/controllers/news_controller.dart';
import 'package:innovator/pages/news/views/news_page.dart';
import 'package:innovator/pages/profile/views/profile_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  NewsController newsController = Get.put(NewsController());

  onRefresh() {
    newsController.loadNews();
    refreshController.refreshCompleted();
  }

  onLoading() {
    newsController.loadNews();
    refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageWrapper(
          withListView: false,
          children: [
            const SizedBox(
              height: 110,
            ),
            Obx(
              () => Expanded(
                child: SmartRefresher(
                  controller: refreshController,
                  enablePullDown: true,
                  onRefresh: onRefresh,
                  onLoading: onLoading,
                  header: const MaterialClassicHeader(
                    color: Colors.white,
                    backgroundColor: GREEN_COLOR,
                  ),
                  child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 0,
                      );
                    },
                    itemCount: newsController.news.length,
                    itemBuilder: (_, i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(NewsPage.id, arguments: i);
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: Get.width,
                              height: Get.width - 40,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(13.0)),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      newsController.news[i]["pictureUrl"]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 40.0,
                                      spreadRadius: -20.0,
                                      offset: Offset(0.0, Get.width - 80))
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 24,
                              left: 24,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    newsController.news[i]["title"],
                                    style: TITLE_TEXT_STYLE_WHITE.copyWith(
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    newsController.news[i]["subtitle"],
                                    style: MAIN_TEXT_STYLE_WHITE.copyWith(
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
        PagePadding(
          child: Container(
            height: 100,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Header(
                  leftWidget: Text(
                    "Innovator",
                    style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 26),
                  ),
                  rightWidget: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundColor: GREY_COLOR,
                        child: SvgPicture.asset("assets/icons/share_icon.svg"),
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(ProfilePage.id);
                        },
                        child: CircleAvatar(
                          radius: 20.0,
                          backgroundColor: GREY_COLOR,
                          child: SvgPicture.asset("assets/icons/user_icon.svg"),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

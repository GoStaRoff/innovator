import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/header.dart';
import 'package:innovator/pages/global_components/page_wrapper.dart';
import 'package:innovator/pages/profile/views/profile_page.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
        header: Header(
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
        children: [
          ...List<Widget>.generate(
            5,
            (int itemIndex) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.width - 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(13.0)),
                      image: DecorationImage(
                        image: AssetImage("assets/images/example_image.png"),
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
                    bottom: 28,
                    left: 28,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Wireless & Portable charger",
                          style:
                              TITLE_TEXT_STYLE_WHITE.copyWith(fontSize: 20.0),
                        ),
                        const Text(
                          "Wireless & Portable charger",
                          style: MAIN_TEXT_STYLE_WHITE,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
        ]);
  }
}

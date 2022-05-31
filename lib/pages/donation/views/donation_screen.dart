import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/functions.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/donation/views/advice_dialog.dart';
import 'package:innovator/pages/global_components/header.dart';
import 'package:innovator/pages/global_components/page_padding.dart';
import 'package:innovator/pages/global_components/page_wrapper.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';

class DonationScreen extends StatelessWidget {
  const DonationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      withPagePadding: false,
      withListView: false,
      header: PagePadding(
        child: Header(
          leftWidget: Text(
            "Пожертвования",
            style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 20),
          ),
          rightWidget: InkWell(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            onTap: () {
              AppDialog(AdviceDialog());
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              child: Text(
                "Подробнее",
                style: MAIN_TEXT_STYLE_BLACK,
              ),
            ),
          ),
        ),
      ),
      children: [
        Container(
          height: Get.height - 90,
          width: Get.width,
          color: Colors.purple[200],
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: Get.height / 6,
                child: SvgPicture.asset("assets/icons/smile.svg"),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PagePadding(
                    child: RoundedContainer(
                      height: 220,
                      child: Container(),
                    ),
                  ),
                  SizedBox(
                    height: 86,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

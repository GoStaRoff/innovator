import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';

class ItemButton extends StatelessWidget {
  final String iconData;
  final String text;
  final onTap;
  const ItemButton({
    Key? key,
    required this.iconData,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: Get.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(iconData),
                    const SizedBox(
                      width: 18.0,
                    ),
                    Expanded(
                      child: AutoSizeText(
                        text,
                        style: TITLE_TEXT_STYLE_BLACK.copyWith(
                            fontWeight: FontWeight.w500),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 1.0,
                width: Get.width,
                color: GREY_COLOR,
              )
            ],
          ),
        ),
      ),
    );
  }
}

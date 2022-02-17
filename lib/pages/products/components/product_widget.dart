import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget(
      {Key? key,
      required this.text,
      required this.editMode,
      required this.toggleSelect,
      required this.selected})
      : super(key: key);
  final String text;
  final bool selected;
  final bool editMode;
  final toggleSelect;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: LIGHT_GREY_COLOR,
      width: Get.width / 2.4,
      height: Get.width / 2.4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: editMode,
              child: GestureDetector(
                onTap: toggleSelect,
                child: CircleAvatar(
                  backgroundColor: selected
                      ? VIOLET_COLOR
                      : Color(0xFF8E8E8E).withOpacity(0.17),
                  radius: 8,
                  child: selected
                      ? Icon(
                          Icons.check,
                          size: 10,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
            ),
            Text(
              text,
              style: MAIN_TEXT_STYLE_BLACK.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}

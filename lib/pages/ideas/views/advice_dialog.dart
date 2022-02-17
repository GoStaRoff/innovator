import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/profile/components/dragable_container.dart';

class AdviceDialog extends StatelessWidget {
  const AdviceDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableContainer(
      height: Get.height / 1.6,
      children: [
        const Text(
          "Советы",
          style: TITLE_TEXT_STYLE_BLACK,
        ),
        const SizedBox(
          height: 26,
        ),
        Text(
          "Sed interdum accumsan odio nec varius. Sed id sapien malesuada, suscipit erat id, pulvinar massa. Vestibulum neque sapien, ultricies a laoreet vel, posuere ac augue. Pellentesque magna sem, tincidunt sed est a, feugiat tincidunt dui. Aliquam gravida placerat sapien vestibulum semper. In tincidunt elementum ultrices. Sed venenatis massa neque, eget condimentum libero ultricies eu. Etiam dignissim nibh non tincidunt suscipit. Vivamus consectetur volutpat vulputate. Suspendisse venenatis turpis ante, ac fermentum est dignissim ut. Integer mi nulla, aliquet ac odio quis, placerat fermentum tortor. Nulla dignissim dapibus leo ut congue.Sed interdum accumsan odio nec varius. Sed id sapien malesuada, suscipit erat id, pulvinar massa. Vestibulum neque sapien, ultricies a laoreet vel, posuere ac augue. Pellentesque magna sem, tincidunt sed est a, feugiat tincidunt dui. ",
          style:
              MAIN_TEXT_STYLE_BLACK.copyWith(color: Colors.black, fontSize: 14),
        ),
      ],
    );
  }
}

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
          "О пожертвовании",
          style: TITLE_TEXT_STYLE_BLACK,
        ),
        const SizedBox(
          height: 26,
        ),
        Text(
          "Все денежные средства будут направлены на продвижение этого приложения с целью улучшения развития в области инноваций.\n\nМы хотим, чтобы приложение «Инноватор» помогло как можно большему числу людей поверить в себя и придумать что-то новое — что-то, что принесет пользу людям и даже изменит мир. Мы в любом случае продолжим работать над приложением, но твое пожертвование поможет нам с его развитием и продвижением. Любой донат — это вклад в создание инноваций и приближение будущего, в котором будут править смелые и интересные идеи.Спасибо за поддержку!",
          style:
              MAIN_TEXT_STYLE_BLACK.copyWith(color: Colors.black, fontSize: 14),
        ),
      ],
    );
  }
}

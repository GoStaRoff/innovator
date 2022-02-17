import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/profile/components/dragable_container.dart';

class AboutDialog extends StatelessWidget {
  const AboutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableContainer(
      height: Get.height / 1.6,
      children: [
        const Text(
          "О приложении",
          style: TITLE_TEXT_STYLE_BLACK,
        ),
        const SizedBox(
          height: 26,
        ),
        Text(
          "Это приложение было создано Innovatione — компанией, которая занимается разработками инновационных продуктов. Мы верим, что придумать по-настоящему революционную идею может каждый, но делают это лишь единицы. Почему? Потому что у нас нет профессии разработчика, потому что Илон Маск и Стив Джобс кажутся совершенно недостижимыми, потому что нас учат сдаваться раньше, чем мы попробуем. На самом деле хотя бы одна гениальная идея есть внутри любого человека, нужно только научиться верить в себя и начать создавать из них продукты.\n\n«Инноватор» — приложение, которое расскажет, как это сделать. Следуй нашим алгоритмам и у тебя обязательно получится что-то классное. Начни сегодня, чтобы уже завтра придумать продукт, который перевернет мир. Потому что ты можешь больше, чем тебе кажется.",
          style:
              MAIN_TEXT_STYLE_BLACK.copyWith(color: Colors.black, fontSize: 14),
        ),
      ],
    );
  }
}

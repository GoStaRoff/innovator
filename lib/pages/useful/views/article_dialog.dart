import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/profile/components/dragable_container.dart';

class ArticleDialog extends StatelessWidget {
  const ArticleDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableContainer(
      height: Get.height / 1.2,
      children: [
        Container(
          width: Get.width,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(13.0)),
            image: DecorationImage(
              image: NetworkImage("https://i.work.ua/article/2173b.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Сложно ли открыть свою компанию?",
          style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 20),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus diam neque, pellentesque eu elit non, cursus interdum est. Nunc quis leo purus. Aliquam vel mi imperdiet, sodales dolor eu, elementum nisl. In iaculis tellus ut est bibendum, sed faucibus ligula tincidunt. Aenean id bibendum ipsum. Donec mollis ac libero quis elementum. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed purus lectus, auctor bibendum lorem et, finibus ultrices ipsum. Ut ac volutpat ex.\n\nProin aliquet tristique magna, a malesuada erat consequat a. Sed iaculis egestas libero nec tincidunt. Pellentesque elementum tortor quis purus varius, sit amet maximus orci ultricies. Duis diam metus, ornare eget magna quis, tristique sollicitudin augue. Sed vel viverra nulla, eget imperdiet massa. Praesent non ex sapien. Vestibulum sed orci rhoncus, tristique massa eu, ultricies nisi. Integer suscipit libero at ligula tempor sagittis. Nullam fermentum posuere erat vitae vestibulum. Nam augue lectus, ullamcorper nec nisi eget, viverra rutrum urna. Maecenas facilisis consequat vehicula. Suspendisse eleifend vulputate est ac maximus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam dolor purus, suscipit sed egestas a, pharetra ac lectus.",
          style: MAIN_TEXT_STYLE_BLACK,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

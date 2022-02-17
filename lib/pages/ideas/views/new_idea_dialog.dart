import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/app_button.dart';
import 'package:innovator/pages/global_components/custom_input.dart';
import 'package:innovator/pages/ideas/controllers/idea_controller.dart';
import 'package:innovator/pages/profile/components/dragable_container.dart';

class NewIdeaDialog extends StatefulWidget {
  NewIdeaDialog({Key? key}) : super(key: key);

  @override
  State<NewIdeaDialog> createState() => _NewIdeaDialogState();
}

class _NewIdeaDialogState extends State<NewIdeaDialog> {
  IdeaController ideaController = Get.find();
  bool showHelp = false;
  TextEditingController ideaTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SingleChildScrollView(
          reverse: true,
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: DraggableContainer(
            height: Get.height / 2.1,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Новая идея",
                    style: TITLE_TEXT_STYLE_BLACK,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showHelp = !showHelp;
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor: const Color(0xFF8D8D8D),
                      radius: 10,
                      child: CircleAvatar(
                        radius: 9,
                        backgroundColor: Colors.white,
                        child: Text(
                          "i",
                          style: MAIN_TEXT_STYLE_BLACK.copyWith(
                              color: const Color(0xFF8D8D8D)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 22,
              ),
              CustomInput(
                height: 160,
                width: Get.width,
                hintText: "Добавь свою идею",
                maxLength: 200,
                controller: ideaTextController,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Align(
                alignment: Alignment.center,
                child: AppButton(
                  // color:
                  //     ideaTextController.text.isEmpty ? GREY_COLOR : VIOLET_COLOR,
                  text: "Сохранить",
                  onTap: () {
                    if (ideaTextController.text.isEmpty) {
                      Get.snackbar("Добавление не удалось",
                          "Минимальное количество символов - 1 символ");
                    } else {
                      ideaController.addIdea(ideaTextController.text);
                      Get.back();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 8.0, left: Get.width / 4),
          child: Column(
            children: [
              SizedBox(
                height: Get.height / 2.3,
              ),
              Material(
                color: Colors.transparent,
                child: Visibility(
                  visible: showHelp,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Bubble(
                        padding: const BubbleEdges.symmetric(
                            horizontal: 16, vertical: 24),
                        alignment: Alignment.center,
                        nip: BubbleNip.no,
                        color: const Color(0xFFF5F5F5),
                        child: Text(
                            'После сохранения идея не будет доступна для редактирования, ее можно только удалить',
                            textAlign: TextAlign.center,
                            style: MAIN_TEXT_STYLE_BLACK),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset("assets/icons/nip_icon.svg"),
                          const SizedBox(
                            width: 14,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/app_button.dart';
import 'package:innovator/pages/global_components/custom_input.dart';
import 'package:innovator/pages/profile/components/dragable_container.dart';
import 'package:innovator/pages/profile/controllers/profile_controller.dart';

class RecommendationDialog extends StatefulWidget {
  RecommendationDialog({Key? key}) : super(key: key);

  @override
  State<RecommendationDialog> createState() => _RecommendationDialogState();
}

class _RecommendationDialogState extends State<RecommendationDialog> {
  TextEditingController recommendationMessageController =
      TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  bool sended = false;
  ProfileController profileController = Get.find();

  @override
  void initState() {
    emailTextController.text = profileController.mainController.user.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableContainer(
        height: Get.height / 1.6,
        children: sended
            ? [
                SizedBox(height: Get.height / 12),
                SvgPicture.asset("assets/icons/result_icon.svg"),
                const SizedBox(height: 24),
                Text(
                  "Сообщение успешно отправлено!",
                  textAlign: TextAlign.center,
                  style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 22),
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.center,
                  child: AppButton(
                    text: "Закрыть",
                    color: Colors.white,
                    style: MAIN_TEXT_STYLE_BLACK.copyWith(color: Colors.black),
                    borderEnabled: true,
                    onTap: () {
                      Get.back();
                    },
                  ),
                ),
              ]
            : [
                const Text(
                  "Порекомендовать",
                  style: TITLE_TEXT_STYLE_BLACK,
                ),
                const SizedBox(
                  height: 26,
                ),
                Text(
                  "Если у тебя есть рекомендация для разработчиков, оставь ее здесь — мы хотим становиться лучше :)",
                  style: MAIN_TEXT_STYLE_BLACK.copyWith(
                      color: Colors.black, fontSize: 14),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomInput(
                  controller: emailTextController,
                  height: 52.0,
                  hintText: "Ваша почта",
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomInput(
                  controller: recommendationMessageController,
                  height: 160.0,
                  hintText: "Введите Ваше сообщение",
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                  alignment: Alignment.center,
                  child: AppButton(
                    text: "Отправить",
                    onTap: () async {
                      sended = await profileController.sendRecommendation(
                        recommendationMessageController.text,
                        emailTextController.text,
                      );
                      setState(() {});
                    },
                  ),
                )
              ],
      ),
    );
  }
}

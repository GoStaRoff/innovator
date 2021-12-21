import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/global_components/app_button.dart';
import 'package:innovator/pages/global_components/custom_input.dart';
import 'package:innovator/pages/profile/components/dragable_container.dart';

class ReportErrorDialog extends StatefulWidget {
  ReportErrorDialog({Key? key}) : super(key: key);

  @override
  State<ReportErrorDialog> createState() => _ReportErrorDialogState();
}

class _ReportErrorDialogState extends State<ReportErrorDialog> {
  TextEditingController reportMessageController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  bool sended = false;

  @override
  void initState() {
    emailTextController.text = "s.moskvin@innovator.com";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableContainer(
      height: Get.height / 1.7,
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
                "Сообщить об ошибке",
                style: TITLE_TEXT_STYLE_BLACK,
              ),
              const SizedBox(
                height: 26,
              ),
              Text(
                "Нашел ошибку? Расскажи нам, чтобы мы могли все поправить :)",
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
                controller: reportMessageController,
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
                  onTap: () {
                    setState(() {
                      sended = true;
                    });
                  },
                ),
              )
            ],
    );
  }
}

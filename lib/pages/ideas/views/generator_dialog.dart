import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/ideas/controllers/idea_controller.dart';
import 'package:innovator/pages/profile/components/dragable_container.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class GeneratorDialog extends StatefulWidget {
  const GeneratorDialog({Key? key}) : super(key: key);

  @override
  State<GeneratorDialog> createState() => _GeneratorDialogState();
}

class _GeneratorDialogState extends State<GeneratorDialog> {
  IdeaController ideaController = Get.find();
  bool showHelp = false;

  String ideaDuration(int milliseconds) {
    String daysCount = Duration(milliseconds: milliseconds).inDays.toString();
    String daysString = "";
    switch (daysCount) {
      case "2":
      case "3":
      case "4":
        daysString = "дня";
        break;
      case "5":
      case "6":
      case "0":
      case "7":
        daysString = "дней";
        break;
      default:
        daysString = "день";
        break;
    }
    Duration hours = Duration(milliseconds: milliseconds) -
        Duration(days: int.parse(daysCount));
    return "$daysCount $daysString ${StopWatchTimer.getDisplayTime(hours.inMilliseconds, milliSecond: false)}";
  }

  @override
  Widget build(BuildContext context) {
    return DraggableContainer(
      height: Get.height / 1.6,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Stack(
            children: [
              Obx(
                () => Column(
                  children: [
                    Text(
                      "Генератор идей",
                      style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(
                      "Придумай не имеющий аналога продукт за 7 дней",
                      textAlign: TextAlign.center,
                      style:
                          MAIN_TEXT_STYLE_BLACK.copyWith(color: Colors.black),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: ideaController.switchNotification,
                      child: ideaController
                              .mainController.notificationEnabled.value
                          ? CircleAvatar(
                              backgroundColor: VIOLET_COLOR,
                              radius: 50,
                              child: SvgPicture.asset(
                                  "assets/icons/stop_icon.svg"),
                            )
                          : CircleAvatar(
                              backgroundColor: GREEN_COLOR,
                              radius: 50,
                              child: SvgPicture.asset(
                                  "assets/icons/play_outlined_icon.svg"),
                            ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Obx(
                      () => Text(
                        ideaDuration(
                            ideaController.mainController.ideaTimerValue.value),
                        style: TITLE_TEXT_STYLE_BLACK.copyWith(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showHelp = !showHelp;
                        });
                      },
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF8D8D8D),
                        radius: 10,
                        child: CircleAvatar(
                          radius: 9,
                          backgroundColor: Colors.white,
                          child: Text(
                            "i",
                            style: MAIN_TEXT_STYLE_BLACK.copyWith(
                                color: Color(0xFF8D8D8D)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: showHelp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 180,
                    ),
                    Bubble(
                      padding: const BubbleEdges.symmetric(
                          horizontal: 16, vertical: 24),
                      alignment: Alignment.center,
                      nip: BubbleNip.no,
                      color: const Color(0xFFF5F5F5),
                      child: Text(
                          'Генератор идей - это напоминание, которое поможет не забыть придумать свой новый продукт',
                          textAlign: TextAlign.center,
                          style: MAIN_TEXT_STYLE_BLACK),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/nip_icon.svg"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/auth/views/auth_page.dart';
import 'package:innovator/pages/global_components/rounded_container.dart';
import 'package:innovator/pages/introduction_page/components/introduction_screen.dart';

class IntroductionPage extends StatefulWidget {
  static String id = "/introduction";

  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  int pageIndex = 0;
  double buttonKof = 0.0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      if (_pageController.page! >= 3) {
        setState(() {
          buttonKof = _pageController.page! - 3;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: _pageController,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (int _pageIndex) {
              setState(() {
                pageIndex = _pageIndex;
              });
            },
            children: [
              IntroductionScreen(
                child: SvgPicture.asset(
                  "assets/images/ribbons.svg",
                  fit: BoxFit.fitWidth,
                ),
                title: "Добро пожаловать\nв Инноватор :)",
                description: "Приложение для создания\nновых продуктов",
              ),
              IntroductionScreen(
                child: Container(
                  color: Color(0xFFFE7D87),
                ),
                title: "Придумывай\nи записывай идеи",
                description: "Тебе помогут наши советы и\nгенератор идей",
              ),
              IntroductionScreen(
                child: Container(
                  color: VIOLET_COLOR,
                ),
                title: "Создавай новые\nпродукты",
                description:
                    "С помощью наших алгоритмов это\nсможет сделать каждый",
              ),
              IntroductionScreen(
                child: Container(
                  color: Color(0xFF52ED6B),
                ),
                title: "Вдохновляйся\nи узнавай новое",
                description:
                    "Самые свежие новости, полезные\nстатьи и крутые советы",
              ),
              IntroductionScreen(
                child: Container(
                  color: Color(0xFFF0F040),
                ),
                title: "Сделай продукт,\nкоторый изменит мир",
                description:
                    "Если ты мечтал создать свой продукт,\nмы тебе в этом поможем!",
              ),
            ],
          ),
          Positioned(
            bottom: Get.height / 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                5,
                (int itemIndex) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor:
                        pageIndex == itemIndex ? VIOLET_COLOR : GREY_COLOR,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: Get.height / 12,
            child: Visibility(
              visible: buttonKof > 0 && pageIndex >= 3,
              child: RoundedContainer(
                onTap: () {
                  Get.offAllNamed(AuthPage.id);
                },
                color: const Color(0xFF1F1C28),
                width: 160 * buttonKof,
                height: 56 * buttonKof,
                borderRadius: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Visibility(
                        visible: buttonKof > 0.37,
                        child: Text(
                          "Начать",
                          style: MAIN_TEXT_STYLE_WHITE.copyWith(
                            fontSize: 16 * buttonKof,
                          ),
                        ),
                      ),
                      Visibility(
                        visible: buttonKof > 0.6,
                        child: SvgPicture.asset(
                            "assets/icons/arrow_right_icon.svg"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

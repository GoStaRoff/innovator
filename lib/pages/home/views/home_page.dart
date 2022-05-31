import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:innovator/main_controller.dart';
import 'package:innovator/pages/donation/views/donation_screen.dart';
import 'package:innovator/pages/home/components/bottom_nav_bar.dart';
import 'package:innovator/pages/ideas/views/idea_screen.dart';
import 'package:innovator/pages/news/views/news_screen.dart';
import 'package:innovator/pages/products/views/products_screen.dart';
import 'package:innovator/pages/useful/views/useful_screen.dart';

class HomePage extends StatefulWidget {
  static String id = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  MainController mainController = Get.find();
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            IndexedStack(
              index: _pageIndex,
              children: [
                NewsScreen(),
                Column(
                  children: [
                    Expanded(
                      child: ProductsScreen(),
                    ),
                    const SizedBox(
                      height: 72,
                    )
                  ],
                ),
                Column(
                  children: const [
                    Expanded(
                      child: IdeaScreen(),
                    ),
                    SizedBox(
                      height: 72,
                    )
                  ],
                ),
                Column(
                  children: const [
                    Expanded(
                      child: UsefulScreeen(),
                    ),
                    SizedBox(
                      height: 72,
                    )
                  ],
                ),
                DonationScreen(),
              ],
            ),
            // _list[_page],
            Obx(
              () => FABBottomAppBar(
                onTabSelected: (int newPageIndex) {
                  setState(() {
                    _pageIndex = newPageIndex;
                  });
                },
                items: [
                  FABBottomAppBarItem(iconData: "assets/icons/home_icon.svg"),
                  FABBottomAppBarItem(
                    iconData: "assets/icons/box_icon.svg",
                  ),
                  FABBottomAppBarItem(
                      iconData: "assets/icons/lamp_icon.svg",
                      notifEnabled: mainController.notificationEnabled.value),
                  FABBottomAppBarItem(iconData: "assets/icons/book_icon.svg"),
                  FABBottomAppBarItem(iconData: "assets/icons/smile_icon.svg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:innovator/pages/home/components/bottom_nav_bar.dart';
import 'package:innovator/pages/news/views/news_screen.dart';

class HomePage extends StatefulWidget {
  static String id = "/home";
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                Center(
                  child: Text("2"),
                ),
                Center(
                  child: Text("3"),
                ),
                Center(
                  child: Text("4"),
                ),
                Center(
                  child: Text("5"),
                ),
              ],
            ),
            // _list[_page],
            FABBottomAppBar(
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
                FABBottomAppBarItem(iconData: "assets/icons/lamp_icon.svg"),
                FABBottomAppBarItem(iconData: "assets/icons/book_icon.svg"),
                FABBottomAppBarItem(iconData: "assets/icons/smile_icon.svg"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

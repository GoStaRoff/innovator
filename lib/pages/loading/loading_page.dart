import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/colors.dart';
import 'package:innovator/main_controller.dart';

class LoadingPage extends StatelessWidget {
  static String id = "/loading";

  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircularProgressIndicator(
          color: VIOLET_COLOR,
        ),
      ),
    );
  }
}

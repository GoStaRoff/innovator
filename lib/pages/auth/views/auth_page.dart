import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:innovator/constants/text_styles.dart';
import 'package:innovator/pages/auth/components/auth_button.dart';
import 'package:innovator/pages/auth/controllers/auth_controller.dart';

class AuthPage extends GetView<AuthController> {
  static String id = "/auth";
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Авторизация",
              style: TITLE_TEXT_STYLE_BLACK.copyWith(fontSize: 24),
            ),
            const SizedBox(
              height: 80,
            ),
            const AuthButton(
              iconAsset: "assets/icons/apple_icon.svg",
              text: "Sign in with Apple ID",
            ),
            const SizedBox(
              height: 16,
            ),
            AuthButton(
              iconAsset: "assets/icons/google_icon.svg",
              text: "Sign in with Google",
              onTap: controller.signInGoogle,
            ),
          ],
        ),
      ),
    );
  }
}

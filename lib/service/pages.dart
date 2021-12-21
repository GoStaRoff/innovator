import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:innovator/pages/auth/views/auth_page.dart';
import 'package:innovator/pages/home/views/home_page.dart';
import 'package:innovator/pages/introduction_page/views/introduction_page.dart';
import 'package:innovator/pages/profile/views/profile_page.dart';
import 'package:innovator/service/bindings.dart';
import 'package:innovator/service/views/not_found_page.dart';

String initialRoute = GetStorage().read('first_launch') == null
    ? IntroductionPage.id
    : GetStorage().read('id') == null
        ? AuthPage.id
        : HomePage.id;

GetPage unknownRoute =
    GetPage(name: NotFoundPage.id, page: () => const NotFoundPage());

List<GetPage<dynamic>> appPages = [
  GetPage(name: HomePage.id, page: () => const HomePage()),
  GetPage(
    name: AuthPage.id,
    page: () => const AuthPage(),
    binding: AuthBinding(),
  ),
  GetPage(name: IntroductionPage.id, page: () => const IntroductionPage()),
  GetPage(name: ProfilePage.id, page: () => const ProfilePage()),
];

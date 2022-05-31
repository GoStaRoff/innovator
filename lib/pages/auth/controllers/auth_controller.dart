import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:innovator/main_controller.dart';
import 'package:innovator/models/user.dart';
import 'package:innovator/pages/home/views/home_page.dart';
import 'package:innovator/pages/loading/loading_page.dart';
import 'package:innovator/service/innovator_api.dart';

class AuthController extends GetxController {
  final MainController mainController =
      Get.find(); //Инициализация главного контроллера
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'profile',
      'email',
    ],
  ); //Переменная для контроля аворизации с помощью Google

//""""""""""""""""""""""""""Авторизация с помощью Google""""""""""""""""""""""""""
  Future<void> signInGoogle() async {
    //
    // Get.toNamed(HomePage.id);
    // return;
    _googleSignIn
        .disconnect(); // Выход из аккаунта Google усли он не был выполнен
    var user; // Инициализация переменной 'user'
    try {
      user = await _googleSignIn.signIn().then((value) async {
        if (value == null) {
        } else {
          Get.offAllNamed(LoadingPage.id);
          var result = await InnovatorApi.socialAuth(
              email: value.email,
              fullName: value.displayName!,
              photoUrl: value
                  .photoUrl!); // Вызов функии api-сервиса и запись в переменную 'result'
          print(result);
          print(value.email);
          if (result.data["message"] == "Authentication successful") {
            mainController.user = User(
                email: value.email,
                fullName: value.displayName,
                photoUrl: result.data["photo"],
                clientId: result.data["clientId"]);

            mainController.saveClient();
            Get.offAllNamed(HomePage.id);
          }
          // if (!result.data[0]['error']) {
          //   // Проверка на ошибку api-запроса
          //   int id = int.parse(
          //       result.data[0]['id']); // Запись id пользователя в переменную 'id'
          //   mainController.box.write("id", id);
          //   Get.offAllNamed(LoadingPage
          //       .id); // Переход на домашнюю страницу без возможности вернуться назад
          //   mainController
          //       .initProfile(); // Сохранение id в локальное хранилище Get
          //   Get.snackbar(
          //       "Message".tr,
          //       result.data[0]
          //           ["description"]); // Вывод уведомления об авторизации
          // }
        }
      }); // Выполнение входа в Goggle аккаунт
      if (user.email == null) return;
    } catch (error) {
      print(error);
      return; // Выход из функции
    }
  }
}

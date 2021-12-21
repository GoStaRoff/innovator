import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:innovator/main_controller.dart';

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
    _googleSignIn
        .disconnect(); // Выход из аккаунта Google усли он не был выполнен
    var user; // Инициализация переменной 'user'
    try {
      user = await _googleSignIn.signIn();
      print(user);
      // user = await _googleSignIn.signIn().then((value) async {
      //   var result = await OriApi.socialAuth(
      //       value!.email,
      //       value.displayName!,
      //       value
      //           .photoUrl!); // Вызов функии api-сервиса и запись в переменную 'result'
      //   if (!result.data[0]['error']) {
      //     // Проверка на ошибку api-запроса
      //     int id = int.parse(
      //         result.data[0]['id']); // Запись id пользователя в переменную 'id'
      //     box.write("id", id);
      //     Get.offAllNamed(LoadingPage
      //         .id); // Переход на домашнюю страницу без возможности вернуться назад
      //     mainController
      //         .initProfile(); // Сохранение id в локальное хранилище Get
      //     Get.snackbar(
      //         "Message".tr,
      //         result.data[0]
      //         ["description"]); // Вывод уведомления об авторизации
      //   }
      // }); // Выполнение входа в Goggle аккаунт
      // if (user.email == null) return;
    } catch (error) {
      print(error);
      return; // Выход из функции
    }
  }
}

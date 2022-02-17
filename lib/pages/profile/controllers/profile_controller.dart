import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:innovator/main_controller.dart';
import 'package:innovator/service/innovator_api.dart';

class ProfileController extends GetxController {
  MainController mainController = Get.find();

  Future<bool> reportError(String messageText, String customEmail) async {
    var response = await InnovatorApi.reportError(
      clientId: mainController.user.clientId!,
      customEmail: customEmail,
      messageText: messageText,
    );
    return response.statusCode == 200;
  }

  Future<bool> sendRecommendation(
      String messageText, String customEmail) async {
    var response = await InnovatorApi.sendRecommendation(
      clientId: mainController.user.clientId!,
      customEmail: customEmail,
      messageText: messageText,
    );
    return response.statusCode == 200;
  }

  Future<bool> sendRecommendationNews(
      String messageText, String customEmail) async {
    var response = await InnovatorApi.sendRecommendationNews(
      clientId: mainController.user.clientId!,
      customEmail: customEmail,
      messageText: messageText,
    );
    return response.statusCode == 200;
  }

  Future setAvatar() async {
    PickedFile avatar;
    try {
      avatar = await ImagePicker().getImage(source: ImageSource.gallery)
          as PickedFile;
    } catch (e) {
      return;
    }
    await InnovatorApi.setProfileAvatar(
      clientId: mainController.user.clientId!,
      clientAvatar: File(avatar.path),
    ).then((value) => mainController.updateUserAvatar(value.data["photoUrl"]));
    // if (result.data[0]['error'].toString() != "true") {
    //   // Проверка ответа на обработаную ошибку
    //   mainController.profileAvatarLink.value = result.data[0]["client_avatar"];
    //   Get.snackbar("Message".tr, result.data[0]['description']);
    // } else {
    //   Get.snackbar("Error".tr,
    //       result.data[0]['description']); // Вывод на ошибку корректности данных
    // }
  }
}

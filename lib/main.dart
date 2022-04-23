// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:innovator/main_controller.dart';
import 'package:innovator/service/pages.dart';

void main() async {
  // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  // await Firebase.initializeApp();
  Get.put(MainController());
  runApp(
    GetMaterialApp(
      initialRoute: initialRoute,
      unknownRoute: unknownRoute,
      getPages: appPages,
    ),
  );
  // }
}

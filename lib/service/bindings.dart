import 'package:get/get.dart';
import 'package:innovator/pages/auth/controllers/auth_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}

// class InitialBinding implements Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<MainController>(() => MainController());
//   }
// }

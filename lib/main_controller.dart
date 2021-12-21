import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:innovator/service/innovator_api.dart';

import 'models/user.dart';

class MainController extends GetxController {
  late User user;
  final GetStorage box = GetStorage();
  final InnovatorApi api = InnovatorApi();

  getUserID() => user.clientId;

  @override
  void onInit() {
    super.onInit();
  }
}

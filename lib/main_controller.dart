import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:innovator/pages/auth/views/auth_page.dart';
import 'package:innovator/pages/home/views/home_page.dart';
import 'package:innovator/service/innovator_api.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'models/user.dart';

class MainController extends GetxController {
  late User user;
  final GetStorage box = GetStorage();
  final InnovatorApi api = InnovatorApi();
  var notificationEnabled = false.obs;
  late StopWatchTimer ideaTimer;
  Rx<int> ideaTimerValue = 0.obs;

  int? getClientId() => user.clientId;

  void saveClient() => box.write("user", user.toJson());

  bool isAuthorized() => box.read("user") != null;

  void updateUserAvatar(String url) {
    user.photoUrl = url;
    saveClient();
  }

  void startIdeaGeneration({duration}) {
    if (duration != null) {
      notificationEnabled.value = true;
    }
    ideaTimer = StopWatchTimer(
      mode: StopWatchMode.countUp,
    );
    ideaTimer.rawTime.listen((value) {
      Duration startDuration = duration ?? Duration(days: 7);
      if (Duration(milliseconds: value) == startDuration) {
        stopIdeaGeneration();
      }

      ideaTimerValue.value = startDuration.inMilliseconds - value;
    });
    ideaTimer.onExecute.add(StopWatchExecute.start);
  }

  stopIdeaGeneration() {
    ideaTimer.onExecute.add(StopWatchExecute.stop);
    ideaTimerValue.value = Duration(days: 7).inMilliseconds;
    box.write("generationDate", null);
  }

  void switchNotification() {
    notificationEnabled.value = !notificationEnabled.value;
    if (notificationEnabled.value) {
      startIdeaGeneration();
      box.write("generationDate", DateTime.now().toIso8601String());
    } else {
      stopIdeaGeneration();
    }
  }

  void exitUser() {
    box.write("user", null);
    Get.offAllNamed(AuthPage.id);
  }

  void initProfile() async {
    await new Future.delayed(const Duration(seconds: 2));
    var _user = box.read("user");
    print(_user);
    if (_user != null) {
      user = User.fromJson(_user);
      Get.offAllNamed(HomePage.id);
    }
    // exitUser();
  }

  void initIdeaGeneration() async {
    ideaTimerValue.value = Duration(days: 7).inMilliseconds;
    var generationDate = await box.read("generationDate");

    if (generationDate != null) {
      startIdeaGeneration(
          duration: (Duration(days: 7) -
              (DateTime.now().difference(Jiffy(generationDate).dateTime))));
    }
  }

  @override
  void onInit() {
    initProfile();
    initIdeaGeneration();
    super.onInit();
  }
}

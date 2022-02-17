import 'package:get/get.dart';
import 'package:innovator/main_controller.dart';
import 'package:innovator/service/innovator_api.dart';

class NewsController extends GetxController {
  MainController mainController = Get.find();
  var news = [].obs;

  @override
  void onInit() {
    super.onInit();
    print(1);
    loadNews();
  }

  loadNews() async {
    var result = await InnovatorApi.getNews();
    if (result.data != null) {
      news.value = result.data;
    }
    print(news.value);
  }
}

import 'package:get/get.dart';
import 'package:innovator/main_controller.dart';

class ProductsController extends GetxController {
  MainController mainController = Get.find();
  Rx<int> openedIdeaIndex = Rx<int>(-1);

  var editMode = false.obs;
  var selectedCount = 0.obs;
  var products = [].obs;

  void changeSelectedIdeaIndex(int newIndex) {
    if (newIndex != openedIdeaIndex.value) {
      openedIdeaIndex.value = newIndex;
    } else {
      openedIdeaIndex.value = -1;
    }
  }

  void disposeEditMode() {
    editMode.value = false;
    for (int i = 0; i < products.length; i++) {
      (products[i]["isChecked"] as RxBool).value = false;
    }
    selectedCount.value = 0;
  }

  void deleteSelected() {
    products.removeWhere((idea) => (idea["isChecked"] as RxBool).value);
    disposeEditMode();
  }

  void switchNotification() => mainController.switchNotification();

  void selectAll() {
    for (int i = 0; i < products.length; i++) {
      (products[i]["isChecked"] as RxBool).value = true;
    }
    var counter = 0;
    products.forEach((idea) {
      if ((idea["isChecked"] as RxBool).value) {
        counter++;
      }
    });
    selectedCount.value = counter;
  }

  void toggleSelect(int index) {
    (products[index]["isChecked"] as RxBool).value =
        !(products[index]["isChecked"] as RxBool).value;
    var counter = 0;
    products.forEach((idea) {
      if ((idea["isChecked"] as RxBool).value) {
        counter++;
      }
    });
    selectedCount.value = counter;
  }

  updateproductsLists() {
    var tempFavproducts = [];
    var tempproducts = [];
    products.forEach((idea) {
      if ((idea["isFavourite"] as RxBool).value) {
        tempFavproducts.add(idea);
      } else {
        tempproducts.add(idea);
      }
    });
    products.value = [...tempFavproducts, ...tempproducts];
  }

  void reorderData(int oldindex, int newindex) {
    print(oldindex);
    print(newindex);
    final items = products.removeAt(oldindex);
    products.insert(newindex, items);
    // updateproductsLists();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    updateproductsLists();
    products.value = [
      {
        "name": "Froster",
        "isChecked": false.obs,
      },
      {
        "name": "Pro",
        "isChecked": false.obs,
      },
      {
        "name": "Pro",
        "isChecked": false.obs,
      },
      {
        "name": "New school",
        "isChecked": false.obs,
      },
      {
        "name": "C.H.",
        "isChecked": false.obs,
      },
      {
        "name": "Pro",
        "isChecked": false.obs,
      },
      {
        "name": "New school",
        "isChecked": false.obs,
      },
      {
        "name": "Froster",
        "isChecked": false.obs,
      },
    ];
    super.onInit();
  }
}

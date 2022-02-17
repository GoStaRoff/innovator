import 'package:get/get.dart';
import 'package:innovator/main_controller.dart';

class IdeaController extends GetxController {
  MainController mainController = Get.find();
  Rx<int> openedIdeaIndex = Rx<int>(-1);

  var editMode = false.obs;
  var selectedCount = 0.obs;
  var ideas = [
    {
      "text": "1",
      "isFavourite": true.obs,
      "isChecked": false.obs,
    },
    {
      "text":
          "isFavouriteisFavouriteisFavouriteisFavouriteisFavouriteisFavouriteisFavouriteisFavouriteisFavouriteisFavouriteisFavouriteisFavouriteisFavouriteisFavouriteisFavourite2",
      "isFavourite": false.obs,
      "isChecked": false.obs,
    },
    {
      "text": "3",
      "isFavourite": false.obs,
      "isChecked": false.obs,
    },
    {
      "text": "4",
      "isFavourite": true.obs,
      "isChecked": false.obs,
    },
    {
      "text": "5",
      "isFavourite": false.obs,
      "isChecked": false.obs,
    },
    {
      "text": "6",
      "isFavourite": false.obs,
      "isChecked": false.obs,
    },
    {
      "text": "7",
      "isFavourite": true.obs,
      "isChecked": false.obs,
    },
    {
      "text": "8",
      "isFavourite": false.obs,
      "isChecked": false.obs,
    },
  ].obs;

  void changeSelectedIdeaIndex(int newIndex) {
    if (newIndex != openedIdeaIndex.value) {
      openedIdeaIndex.value = newIndex;
    } else {
      openedIdeaIndex.value = -1;
    }
  }

  void disposeEditMode() {
    editMode.value = false;
    for (int i = 0; i < ideas.length; i++) {
      (ideas[i]["isChecked"] as RxBool).value = false;
    }
    selectedCount.value = 0;
  }

  void deleteSelected() {
    ideas.removeWhere((idea) => (idea["isChecked"] as RxBool).value);
    disposeEditMode();
  }

  void switchNotification() => mainController.switchNotification();

  void selectAll() {
    for (int i = 0; i < ideas.length; i++) {
      (ideas[i]["isChecked"] as RxBool).value = true;
    }
    var counter = 0;
    ideas.forEach((idea) {
      if ((idea["isChecked"] as RxBool).value) {
        counter++;
      }
    });
    selectedCount.value = counter;
  }

  void toggleSelect(int index) {
    (ideas[index]["isChecked"] as RxBool).value =
        !(ideas[index]["isChecked"] as RxBool).value;
    var counter = 0;
    ideas.forEach((idea) {
      if ((idea["isChecked"] as RxBool).value) {
        counter++;
      }
    });
    selectedCount.value = counter;
  }

  void toggleFavourite(int index) {
    (ideas[index]["isFavourite"] as RxBool).value =
        !(ideas[index]["isFavourite"] as RxBool).value;
    updateIdeasLists();
  }

  updateIdeasLists() {
    var tempFavIdeas = [];
    var tempIdeas = [];
    ideas.forEach((idea) {
      if ((idea["isFavourite"] as RxBool).value) {
        tempFavIdeas.add(idea);
      } else {
        tempIdeas.add(idea);
      }
    });
    ideas.value = [...tempFavIdeas, ...tempIdeas];
  }

  void reorderData(int oldindex, int newindex) {
    if (newindex > oldindex) {
      newindex -= 1;
    }
    final items = ideas.removeAt(oldindex);
    ideas.insert(newindex, items);
    updateIdeasLists();
  }

  void addIdea(String ideaText) {
    ideas.add({
      "text": ideaText,
      "isFavourite": false.obs,
      "isChecked": false.obs,
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    updateIdeasLists();
    super.onInit();
  }
}

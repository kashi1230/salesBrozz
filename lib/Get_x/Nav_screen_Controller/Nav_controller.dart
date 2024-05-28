import 'package:get/get.dart';

class MenuController extends GetxController {
  var isExpanded = false.obs;
  var isExpanded2 = false.obs;
  var isExpanded3 = false.obs;
  var isExpanded4 = false.obs;
  var isExpanded5 = false.obs;
  var selectedTileIndex = 0.obs;

  void toggleExpanded(int index) {
    switch (index) {
      case 0:
        isExpanded.value = !isExpanded.value;
        break;
      case 1:
        isExpanded2.value = !isExpanded2.value;
        break;
      case 2:
        isExpanded3.value = !isExpanded3.value;
        break;
      case 3:
        isExpanded4.value = !isExpanded4.value;
        break;
      case 4:
        isExpanded5.value = !isExpanded5.value;
        break;
    }
  }

  void selectTile(int index) {
    selectedTileIndex.value = index;
  }
}

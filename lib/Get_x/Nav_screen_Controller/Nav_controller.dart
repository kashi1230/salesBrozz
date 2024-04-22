import 'package:get/get.dart';

class SalesController extends GetxController {
  var selectedTileIndex = 0.obs;
  var expanded = <int, bool>{}.obs;

  bool isExpanded(int index) => expanded[index] ?? false;

  void setExpanded(int index, bool value) {
    expanded[index] = value;
    update();
  }
}
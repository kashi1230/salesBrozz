import 'package:get/get.dart';

import '../../imports.dart';

class AddModelController extends GetxController {
  // Controllers for the form fields
  final BrandController = TextEditingController().obs;
  final ModelController = TextEditingController().obs;
  final ColorsController = TextEditingController().obs;
  final DpController = TextEditingController().obs;
  final MopController = TextEditingController().obs;
  final MRpController = TextEditingController().obs;
  final HsnController = TextEditingController().obs;
  final TaxController = TextEditingController().obs;

  var Data = <Map<String, String>>[].obs;

  // Function to add a customer
  void addModel() {
    Data.add({
      'Brand': BrandController.value.text,
      'ModelName': ModelController.value.text,
      'Dp': DpController.value.text,
      'Mop': MopController.value.text,
      'MRP': MRpController.value.text,
      'Hsn': HsnController.value.text,
      'Tax':TaxController.value.text,
      'Color' : ColorsController.value.text
    });
    clearFormFields();
  }

  // Function to clear form fields
  void clearFormFields() {
     BrandController.value.clear();
    ModelController.value.clear();
    DpController.value.clear();
    MopController.value.clear();
    MRpController.value.clear();
    HsnController.value.clear();
    TaxController.value.clear();
    ColorsController.value.clear();
  }
}
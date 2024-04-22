import 'package:get/get.dart';

import 'package:flutter/material.dart';


class CustomerController extends GetxController {
  // Controllers for the form fields
  final nameController = TextEditingController().obs;
  final contactNumberController = TextEditingController().obs;
  final typeController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  var customers = <Map<String, String>>[].obs;

  // Function to add a customer
  void addCustomer() {
    customers.add({
      'Name': nameController.value.text,
      'Contact Number': contactNumberController.value.text,
      'Type': typeController.value.text,
      'City': cityController.value.text,
    });
    clearFormFields();
  }

  // Function to clear form fields
  void clearFormFields() {
    nameController.value.clear();
    contactNumberController.value.clear();
    typeController.value.clear();
    cityController.value.clear();
  }
}
class DistriButorController extends GetxController {
  // Controllers for the form fields
  final nameController = TextEditingController().obs;
  final contactNumberController = TextEditingController().obs;
  final typeController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  var distributor = <Map<String, String>>[].obs;

  // Function to add a customer
  void addDistibutor() {
    distributor.add({
      'Name': nameController.value.text,
      'Contact Number': contactNumberController.value.text,
      'Type': typeController.value.text,
      'City': cityController.value.text,
    });
    clearFormFields();
  }

  // Function to clear form fields
  void clearFormFields() {
    nameController.value.clear();
    contactNumberController.value.clear();
    typeController.value.clear();
    cityController.value.clear();
  }
}


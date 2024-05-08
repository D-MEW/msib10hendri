import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void onInit() {
    usernameController = TextEditingController();
    nameController = TextEditingController();
    addressController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    usernameController.dispose();
    nameController.dispose();
    addressController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void register() {
    final username = usernameController.text;
    final name = nameController.text;
    final address = addressController.text;
    final phoneNumber = phoneNumberController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
  }
}

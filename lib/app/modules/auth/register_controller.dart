import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/auth_states_enum.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';

class RegisterController extends GetxController {
  final UserService userService = Get.find<UserService>();

  Rx<AuthStates> state = AuthStates.idle.obs;

  late TextEditingController prontuarioController;
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController numberController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    prontuarioController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    numberController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    prontuarioController.dispose();
    nameController.dispose();
    emailController.dispose();
    numberController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

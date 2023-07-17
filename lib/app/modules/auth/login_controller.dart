import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/auth_states_enum.dart';
import 'package:smartlock_app/app/data/interfaces/user_respository.dart';
import 'package:smartlock_app/app/data/services/local_storage_service.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';
import 'package:smartlock_app/app/widgets/snackbars/error_snackbar.dart';
import 'package:smartlock_app/routes/pages.dart';

class LoginController extends GetxController {
  final UserRepository _userRepository;
  final LocalStorageService _localStorageService;

  LoginController(
    this._userRepository,
    this._localStorageService,
  );

  final UserService userService = Get.find<UserService>();

  Rx<AuthStates> state = AuthStates.idle.obs;

  late TextEditingController prontuarioController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    prontuarioController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    prontuarioController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    state.value = AuthStates.loging;

    final response = await _userRepository.loginWithCodeAndPassword(
      prontuarioController.text,
      passwordController.text,
    );

    response.fold((loginError) {
      state.value = AuthStates.error;
      showErrorSnackbar(message: loginError.details);
    }, (user) async {
      userService.user = user;

      await _localStorageService.save(
        key: 'user-id',
        value: userService.user!.id,
      );

      state.value = AuthStates.success;

      Get.toNamed(Routes.home);
    });
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/auth_states_enum.dart';
import 'package:smartlock_app/app/data/interfaces/user_repository.dart';
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

  late FocusNode prontuarioNode;
  late FocusNode passwordNode;

  @override
  void onInit() {
    prontuarioController = TextEditingController();
    passwordController = TextEditingController();
    prontuarioNode = FocusNode();
    passwordNode = FocusNode();
    super.onInit();
  }

  @override
  void onClose() {
    prontuarioController.dispose();
    passwordController.dispose();
    prontuarioNode.dispose();
    passwordNode.dispose;
    super.onClose();
  }

  Future<void> login() async {
    state.value = AuthStates.loging;

    prontuarioNode.unfocus();
    passwordNode.unfocus();

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

      Get.offAllNamed(Routes.home);
    });
  }
}

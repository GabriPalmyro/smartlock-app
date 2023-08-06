import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/auth_states_enum.dart';
import 'package:smartlock_app/app/data/interfaces/user_repository.dart';
import 'package:smartlock_app/app/data/services/local_storage_service.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';
import 'package:smartlock_app/app/widgets/snackbars/error_snackbar.dart';
import 'package:smartlock_app/routes/pages.dart';

class SplashController extends GetxController {
  final UserRepository _userRepository;
  final LocalStorageService _localStorageService;

  SplashController(
    this._userRepository,
    this._localStorageService,
  ) {
    refreshLogin();
  }

  final UserService userService = Get.find<UserService>();

  Rx<AuthStates> state = AuthStates.idle.obs;
  Rx<AuthPage> page = AuthPage.login.obs;

  Future<void> refreshLogin() async {
    state.value = AuthStates.loging;
    String? userId;

    userId = await _localStorageService.get(key: 'user-id');

    if (userId == null) {
      Get.offAllNamed(Routes.login);
      showErrorSnackbar(
          message: 'Ocorreu um problema ao buscar as suas informações');
      return;
    }

    await Future.delayed(1.seconds);

    final response = await _userRepository.getUserById(userId);

    response.fold((loginError) {
      state.value = AuthStates.error;
      showErrorSnackbar(message: loginError.details);
      Get.offAllNamed(Routes.login);
    }, (user) async {
      userService.user = user;

      state.value = AuthStates.success;

      Get.offAllNamed(Routes.home);
    });
  }
}

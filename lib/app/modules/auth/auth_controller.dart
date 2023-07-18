import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/auth_states_enum.dart';
import 'package:smartlock_app/app/data/interfaces/user_repository.dart';
import 'package:smartlock_app/app/data/services/local_storage_service.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';

class AuthController extends GetxController {
  final UserRepository _userRepository;
  final LocalStorageService _localStorageService;

  AuthController(
    this._userRepository,
    this._localStorageService,
  );

  final UserService userService = Get.find<UserService>();

  Rx<AuthStates> state = AuthStates.idle.obs;
  Rx<AuthPage> page = AuthPage.login.obs;
}

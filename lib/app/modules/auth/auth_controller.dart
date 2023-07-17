import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/auth_states_enum.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';

class AuthController extends GetxController {

  final UserService userService = Get.find<UserService>();


  Rx<AuthStates> state = AuthStates.idle.obs;
  Rx<AuthPage> page = AuthPage.login.obs;
}

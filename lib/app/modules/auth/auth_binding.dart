import 'package:get/get.dart';
import 'package:smartlock_app/app/data/repositories/user_repository_i.dart';
import 'package:smartlock_app/app/data/services/local_storage_service.dart';
import 'package:smartlock_app/app/modules/auth/auth_controller.dart';
import 'package:smartlock_app/app/modules/auth/login_controller.dart';
import 'package:smartlock_app/app/modules/auth/register_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepositoryImpl());
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => LoginController(
          Get.find<UserRepositoryImpl>(),
          Get.find<LocalStorageService>(),
        ));
    Get.lazyPut(() => RegisterController());
  }
}

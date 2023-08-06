import 'package:get/get.dart';
import 'package:smartlock_app/app/data/repositories/user_repository_i.dart';
import 'package:smartlock_app/app/data/services/local_storage_service.dart';
import 'package:smartlock_app/app/modules/auth/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepositoryImpl());
    Get.lazyPut(() => LoginController(
        Get.find<UserRepositoryImpl>(), Get.find<LocalStorageService>()));
  }
}

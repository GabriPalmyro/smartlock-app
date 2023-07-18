import 'package:get/get.dart';
import 'package:smartlock_app/app/data/repositories/user_repository_i.dart';
import 'package:smartlock_app/app/data/services/local_storage_service.dart';
import 'package:smartlock_app/app/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepositoryImpl());
    Get.lazyPut(() => SplashController(
          Get.find<UserRepositoryImpl>(),
          Get.find<LocalStorageService>(),
        ));
  }
}

import 'package:get/get.dart';
import 'package:smartlock_app/app/data/services/local_storage_service.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get
    ..put(LocalStorageService())
    ..put(UserService(Get.find<LocalStorageService>()));
  }
}

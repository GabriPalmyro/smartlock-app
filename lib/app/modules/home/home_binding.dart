import 'package:get/get.dart';
import 'package:smartlock_app/app/data/repositories/class_repository_i.dart';
import 'package:smartlock_app/app/modules/home/classes/classes_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClassRepositoryImpl());
    Get.lazyPut(() => ClassController(Get.find<ClassRepositoryImpl>()));
  }
}

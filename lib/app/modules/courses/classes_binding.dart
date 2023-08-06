import 'package:get/get.dart';
import 'package:smartlock_app/app/data/repositories/class_repository_i.dart';
import 'package:smartlock_app/app/modules/courses/classes_controller.dart';

class ClassesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClassRepositoryImpl());
    Get.put(() => ClassController(Get.find<ClassRepositoryImpl>()));
  }
}

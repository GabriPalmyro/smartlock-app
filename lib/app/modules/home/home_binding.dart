import 'package:get/get.dart';
import 'package:smartlock_app/app/data/repositories/class_repository_i.dart';
import 'package:smartlock_app/app/modules/classroom/classroom_controller.dart';
import 'package:smartlock_app/app/modules/courses/classes_controller.dart';
import 'package:smartlock_app/app/modules/home/home_controller.dart';

import '../../data/repositories/classroom_repository_i.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClassRepositoryImpl());
    Get.lazyPut(() => ClassroomRepositoryImpl());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ClassController(Get.find<ClassRepositoryImpl>()));
    Get.lazyPut(() => ClassroomController(Get.find<ClassroomRepositoryImpl>()));
  }
}

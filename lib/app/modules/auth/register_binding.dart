import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/auth/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}

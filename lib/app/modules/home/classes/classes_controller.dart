import 'dart:developer';

import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/auth_states_enum.dart';
import 'package:smartlock_app/app/data/interfaces/class_repository.dart';
import 'package:smartlock_app/app/data/model/class.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';
import 'package:smartlock_app/app/widgets/snackbars/error_snackbar.dart';

class ClassController extends GetxController {
  final ClassRepository _classRepository;

  ClassController(
    this._classRepository,
  );

  final UserService userService = Get.find<UserService>();

  final RxList<Course> classesFromToday = RxList<Course>.empty();
  Rx<AuthStates> state = AuthStates.idle.obs;

  @override
  void onInit() {
    getClassesForToday();
    super.onInit();
  }

  void getClassesForToday() async {
    
    final response =
        await _classRepository.getTodayClassessFromUser(userService.user!.id);

    response.fold((l) {
      state.value = AuthStates.error;
      showErrorSnackbar(message: l.details);
    }, (classes) {
      log(classes.toString(), name: 'Classes');
      classesFromToday.value = classes;
      state.value = AuthStates.success;
    });
  }
}

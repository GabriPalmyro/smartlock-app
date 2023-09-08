import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/class_states_enum.dart';
import 'package:smartlock_app/app/data/interfaces/class_repository.dart';
import 'package:smartlock_app/app/data/model/class.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';
import 'package:smartlock_app/app/modules/home/widgets/bottomSheet/open_class_home_bottom_sheet.dart';
import 'package:smartlock_app/app/widgets/snackbars/error_snackbar.dart';

class ClassController extends GetxController {
  final ClassRepository _classRepository;

  ClassController(
    this._classRepository,
  );

  final UserService userService = Get.find<UserService>();

  final RxList<Course> classesFromToday = RxList<Course>.empty();
  final RxList<Course> allClasses = RxList<Course>.empty();
  Rx<ClassStates> state = ClassStates.idle.obs;

  @override
  void onInit() {
    getClassesForToday();
    getAllClasses();
    super.onInit();
  }

  void getAllClasses() async {
    final response =
        await _classRepository.getAllTeacherClasses(userService.user!.id);

    response.fold((l) {
      log(l.details, name: 'Error Get All Classes');
    }, (classes) {
      allClasses.value = classes;
      allClasses.sort((a, b) => a.dayOfTheWeek.compareTo(b.dayOfTheWeek));
    });
  }

  void getClassesForToday() async {
    final response =
        await _classRepository.getTodayClassessFromUser(userService.user!.id);

    response.fold((l) {
      state.value = ClassStates.error;
      showErrorSnackbar(message: l.details);
    }, (classes) {
      log(classes.toString(), name: 'Classes');
      classesFromToday.value = classes;
      state.value = ClassStates.success;
    });
  }

  void openBottomSheetForOpenClassFromHomeView(Course course) {
    state.value = ClassStates.idle;
    // Get.bottomSheet(
    //   OpenClassFromHomeBottomSheet(course: course),
    //   enterBottomSheetDuration: const Duration(milliseconds: 250),
    // );

    showModalBottomSheet(
      context: Get.context!,
      builder: (context) => OpenClassFromHomeBottomSheet(course: course),
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
    );
  }

  Future<void> openClassById(String idClass) async {
    state.value = ClassStates.openingClass;
    await Future.delayed(const Duration(seconds: 3));
    state.value = ClassStates.classOpened;
  }
}

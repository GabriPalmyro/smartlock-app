import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/lock_states_enum.dart';
import 'package:smartlock_app/app/data/interfaces/classroom_repository.dart';
import 'package:smartlock_app/app/data/model/classroom.dart';
import 'package:smartlock_app/app/data/model/classroom_infos.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';
import 'package:smartlock_app/app/modules/blocks/widgets/list_of_classrooms_modal.dart';
import 'package:smartlock_app/app/widgets/snackbars/error_snackbar.dart';

class ClassroomController extends GetxController {
  final ClassroomRepository _classroomRepository;

  ClassroomController(this._classroomRepository);

  final RxList<Classroom> listOfClassroomByBlock = RxList.empty();
  Rx<ClassroomInfos?> classroomInfos = Rx<ClassroomInfos?>(null);

  RxBool loading = RxBool(false);
  RxBool isProcessingLock = RxBool(false);

  Future<void> getClassroomByBlock(String block) async {
    final response = await _classroomRepository.getClassroomFromBlock(block);

    response.fold((l) {
      showErrorSnackbar(message: l.details);
    }, (classrooms) {
      listOfClassroomByBlock.value = classrooms;
      listOfClassroomByBlock.refresh();

      Get.bottomSheet(ListOfClassroomsModal(block: block),
          isScrollControlled: true);
    });
  }

  Future<void> getClassroomInfosById(String classroomId) async {
    loading.value = true;

    classroomInfos.value = null;

    final response =
        await _classroomRepository.getClassroomInfosById(classroomId);

    response.fold((l) async {
      loading.value = false;
      showErrorSnackbar(message: l.details);
      await Future.delayed(const Duration(milliseconds: 350));
      Get.back();
    }, (classroomInfosResponse) async {
      classroomInfos.value = classroomInfosResponse;
      classroomInfos.refresh();
      await Future.delayed(const Duration(milliseconds: 250));
      loading.value = false;
    });
  }

  Future<void> openClassroomLock() async {
    if (classroomInfos.value!.lock == null) {
      throw 'Essa sala de aula não possuí uma fechadura, portanto não pode ser aberta';
    } else if (classroomInfos.value!.lock!.state == LockState.open) {
      throw 'Essa sala de aula já se encontra aberta no momento';
    } else if (isProcessingLock.value) {
      return;
    }

    isProcessingLock.value = true;

    await Future.delayed(const Duration(seconds: 1));

    final userId = Get.find<UserService>().user!.id;

    final responseOpen = await _classroomRepository.openLockFromClassroom(
        classroomInfos.value!.id, userId);

    return responseOpen.fold((l) {
      isProcessingLock.value = false;
      throw l.details;
    }, (r) async {
      final responseClassroom = await _classroomRepository
          .getClassroomInfosById(classroomInfos.value!.id);

      responseClassroom.fold((l) async {
        showErrorSnackbar(message: l.details);
        isProcessingLock.value = false;
        Get.back();
      }, (classroomInfosResponse) async {
        classroomInfos.value = classroomInfosResponse;
        classroomInfos.refresh();
        isProcessingLock.value = false;
      });
    });
  }

  Future<void> closeClassroomLock() async {
    if (classroomInfos.value!.lock == null) {
      throw 'Essa sala de aula não possuí uma fechadura, portanto não pode ser fechada';
    } else if (classroomInfos.value!.lock!.state == LockState.close) {
      throw 'Essa sala de aula já se encontra fechada no momento';
    } else if (isProcessingLock.value) {
      return;
    }

    isProcessingLock.value = true;

    await Future.delayed(const Duration(seconds: 1));

    final responseOpen = await _classroomRepository
        .closeLockFromClassroom(classroomInfos.value!.id);

    return responseOpen.fold((l) {
      isProcessingLock.value = false;
      throw l.details;
    }, (r) async {
      final responseClassroom = await _classroomRepository
          .getClassroomInfosById(classroomInfos.value!.id);

      responseClassroom.fold((l) async {
        showErrorSnackbar(message: l.details);
        isProcessingLock.value = false;
        Get.back();
      }, (classroomInfosResponse) async {
        classroomInfos.value = classroomInfosResponse;
        classroomInfos.refresh();
        isProcessingLock.value = false;
      });
    });
  }
}

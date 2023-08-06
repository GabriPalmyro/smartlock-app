import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/lock_states_enum.dart';
import 'package:smartlock_app/app/data/interfaces/classroom_repository.dart';
import 'package:smartlock_app/app/data/model/classroom.dart';
import 'package:smartlock_app/app/data/model/classroom_infos.dart';
import 'package:smartlock_app/app/modules/blocks/widgets/list_of_classrooms_modal.dart';
import 'package:smartlock_app/app/widgets/snackbars/error_snackbar.dart';

class ClassroomController extends GetxController {
  final ClassroomRepository _classroomRepository;

  ClassroomController(this._classroomRepository);

  final RxList<Classroom> listOfClassroomByBlock = RxList.empty();
  Rx<ClassroomInfos?> classroomInfos = Rx<ClassroomInfos?>(null);

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
    final response =
        await _classroomRepository.getClassroomInfosById(classroomId);

    response.fold((l) {
      showErrorSnackbar(message: l.details);
    }, (classroomInfosResponse) {
      classroomInfos.value = classroomInfosResponse;
    });
  }

  Future<void> openClassroomLock() async {
    if (classroomInfos.value!.lock == null) {
      throw 'Essa sala de aula não possuí uma fechadura, portanto não pode ser aberta';
    } else if(classroomInfos.value!.lock!.state == LockState.open) {
      throw 'Essa sala de aula já se encontra aberta no momento';
    }

    await Future.delayed(const Duration(seconds: 2));

    classroomInfos.value!.lock!.state = LockState.open;
    classroomInfos.refresh();

    return;
  }
}

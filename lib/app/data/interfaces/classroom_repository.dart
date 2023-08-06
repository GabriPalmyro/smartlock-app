import 'package:dartz/dartz.dart';
import 'package:smartlock_app/app/data/model/classroom_infos.dart';
import 'package:smartlock_app/app/data/provider/network/api_provider.dart';

import '../model/classroom.dart';

abstract class ClassroomRepository {
  Future<Either<AppException, List<Classroom>>> getClassroomFromBlock(
      String block);
  Future<Either<AppException, ClassroomInfos>> getClassroomInfosById(
      String classroomId);
}

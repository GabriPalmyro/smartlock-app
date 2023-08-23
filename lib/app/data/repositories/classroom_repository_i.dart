import 'package:dartz/dartz.dart';
import 'package:smartlock_app/app/data/interfaces/classroom_repository.dart';
import 'package:smartlock_app/app/data/model/classroom.dart';
import 'package:smartlock_app/app/data/model/classroom_infos.dart';
import 'package:smartlock_app/app/data/provider/network/api_provider.dart';
import 'package:smartlock_app/app/data/provider/network/apis/classroom_api.dart';

class ClassroomRepositoryImpl extends ClassroomRepository {
  @override
  Future<Either<AppException, List<Classroom>>> getClassroomFromBlock(
      String block) async {
    final response = await ClassroomAPI.getClassroomsFromBlock(block).request();

    return response.fold((exception) {
      return Left(exception);
    }, (data) {
      try {
        final List<dynamic> jsonList = data;
        final List<Classroom> classrooms =
            jsonList.map((json) => Classroom.fromJson(json)).toList();
        return Right(classrooms);
      } catch (e) {
        return Left(FetchDataException(
            'Ocorreu um problema. Tente novamente mais tarde, ou entre em contato com o suporte'));
      }
    });
  }

  @override
  Future<Either<AppException, ClassroomInfos>> getClassroomInfosById(
      String classroomId) async {
    final response =
        await ClassroomAPI.getClassroomInfosById(classroomId).request();

    return response.fold((exception) {
      return Left(exception);
    }, (data) {
      try {
        final ClassroomInfos classroomInfos = ClassroomInfos.fromJson(data);
        return Right(classroomInfos);
      } catch (e) {
        return Left(FetchDataException(
            'Ocorreu um problema. Tente novamente mais tarde, ou entre em contato com o suporte'));
      }
    });
  }

  @override
  Future<Either<AppException, String>> openLockFromClassroom(
      String lockId, String userId) async {
    final response =
        await ClassroomAPI.openLockFromClassroom(lockId, userId).request();

    return response.fold((exception) {
      return Left(exception);
    }, (data) {
      return const Right('Louco e sonhado');
    });
  }
}

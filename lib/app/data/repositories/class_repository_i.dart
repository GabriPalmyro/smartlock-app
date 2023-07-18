import 'package:dartz/dartz.dart';
import 'package:smartlock_app/app/data/interfaces/class_repository.dart';
import 'package:smartlock_app/app/data/model/class.dart';
import 'package:smartlock_app/app/data/provider/network/api_provider.dart';
import 'package:smartlock_app/app/data/provider/network/apis/class_api.dart';

class ClassRepositoryImpl extends ClassRepository {
  @override
  Future<Either<AppException, List<Course>>> getTodayClassessFromUser(
      String id) async {
    final response = await ClassAPI.getClassesForTeacherFromToday(id).request();

    return response.fold((exception) {
      return Left(exception);
    }, (data) {
      try {
        final List<dynamic> jsonList = data;
        final List<Course> courses =
            jsonList.map((json) => Course.fromJson(json)).toList();
        return Right(courses);
      } catch (e) {
        return Left(FetchDataException(
            'Ocorreu um problema. Tente novamente mais tarde, ou entre em contato com o suporte'));
      }
    });
  }
}

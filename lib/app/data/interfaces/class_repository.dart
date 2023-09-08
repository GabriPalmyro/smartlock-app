import 'package:dartz/dartz.dart';
import 'package:smartlock_app/app/data/model/class.dart';
import 'package:smartlock_app/app/data/provider/network/api_provider.dart';

abstract class ClassRepository {
  Future<Either<AppException, List<Course>>> getTodayClassessFromUser(
      String id);
  Future<Either<AppException, List<Course>>> getAllTeacherClasses(
      String id);
}

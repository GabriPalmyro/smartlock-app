import 'package:dartz/dartz.dart';
import 'package:smartlock_app/app/data/model/user.dart';
import 'package:smartlock_app/app/data/provider/network/api_provider.dart';

abstract class UserRepository {
  Future<Either<AppException, User>> loginWithCodeAndPassword(
      String code, String password);

  Future<Either<AppException, User>> getUserById(String id);
}

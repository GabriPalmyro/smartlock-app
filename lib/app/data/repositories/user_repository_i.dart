import 'package:dartz/dartz.dart';
import 'package:smartlock_app/app/data/interfaces/user_respository.dart';
import 'package:smartlock_app/app/data/model/user.dart';
import 'package:smartlock_app/app/data/provider/network/api_provider.dart';
import 'package:smartlock_app/app/data/provider/network/apis/user_api.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<Either<AppException, User>> getUserById(String id) async {
    final response = await UserAPI.getById(id).request();

    return response.fold((exception) {
      return Left(exception);
    }, (data) {
      try {
        final user = User.fromJson(data as Map<String, dynamic>);
        return Right(user);
      } catch (e) {
        return Left(FetchDataException(
            'Ocorreu um problema. Tente novamente mais tarde, ou entre em contato com o suporte'));
      }
    });
  }

  @override
  Future<Either<AppException, User>> loginWithCodeAndPassword(
      String code, String password) async {
    final response =
        await UserAPI.login({'code': code, 'password': password}).request();

    return response.fold((exception) {
      return Left(exception);
    }, (data) {
      try {
        final user = User.fromJson(data as Map<String, dynamic>);
        return Right(user);
      } catch (e) {
        return Left(FetchDataException(
            'Ocorreu um problema. Tente novamente mais tarde, ou entre em contato com o suporte'));
      }
    });
  }
}

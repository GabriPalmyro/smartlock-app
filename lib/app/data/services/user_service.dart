import 'package:get/get.dart';
import 'package:smartlock_app/app/data/model/user.dart';
import 'package:smartlock_app/app/data/services/local_storage_service.dart';
import 'package:smartlock_app/routes/pages.dart';

class UserService extends GetxService {
  final LocalStorageService _localStorageService;

  UserService(
    this._localStorageService,
  );

  final Rx<User?> _user = Rx<User?>(null);
  User? get user => _user.value;

  set user(User? user) {
    _user.value = user;
  }

  void updateUser(User newUser) {
    user = newUser;
  }

  Future<void> logout() async {
    _localStorageService.delete(key: 'user-id');
    Get.offAllNamed(Routes.login);
    user = null;
  }
}

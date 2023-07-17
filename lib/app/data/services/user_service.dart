import 'package:get/get.dart';
import 'package:smartlock_app/app/data/model/user.dart';

class UserService extends GetxService {
  final Rx<User?> _user = Rx<User?>(null);
  User? get user => _user.value;

  set user(User? user) {
    _user.value = user;
  }

  void updateUser(User newUser) {
    user = newUser;
  }
}

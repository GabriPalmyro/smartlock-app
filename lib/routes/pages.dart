import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/auth/login_binding.dart';
import 'package:smartlock_app/app/modules/auth/pages/auth_login_page.dart';
import 'package:smartlock_app/app/modules/auth/pages/auth_register_page.dart';
import 'package:smartlock_app/app/modules/auth/register_binding.dart';
import 'package:smartlock_app/app/modules/classroom/classroom_infos_page.dart';
import 'package:smartlock_app/app/modules/home/home_binding.dart';
import 'package:smartlock_app/app/modules/home/home_view.dart';
import 'package:smartlock_app/app/modules/splash/splash_binding.dart';
import 'package:smartlock_app/app/modules/splash/splash_view.dart';

part 'routes.dart';

///  This file will contain your array routing ex :
///  class AppPages { static final pages = [
///   GetPage(name: Routes.HOME, page:()=> HomePage())
/// ]};

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashView(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: Routes.login,
      page: () => const AuthLoginPage(),
      bindings: [LoginBinding()],
    ),
    GetPage(
      name: Routes.register,
      page: () => const AuthRegisterPage(),
      bindings: [RegisterBinding()],
    ),
    GetPage(name: Routes.home, page: () => const HomeView(), bindings: [
      HomeBinding()
    ], children: [
      GetPage(
        name: Routes.classroom,
        page: () => const ClassroomInfosPage(),
      ),
    ]),
  ];
}

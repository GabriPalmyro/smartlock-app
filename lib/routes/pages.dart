import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/auth/auth_binding.dart';
import 'package:smartlock_app/app/modules/auth/auth_view.dart';
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
      name: Routes.auth,
      page: () => const AuthView(),
      bindings: [AuthBinding()],
    ),
    GetPage(
      name: Routes.home,
      page: () => HomeView(),
      bindings: [HomeBinding()],
    ),
  ];
}

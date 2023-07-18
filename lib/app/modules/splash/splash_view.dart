import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:smartlock_app/app/modules/splash/splash_controller.dart';
import 'package:smartlock_app/core/configs/app_animations.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  final controller = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Lottie.asset(
          AppAnimations.loading, // Caminho do arquivo Lottie na pasta assets
          width: 200, // Largura da animação
          height: 200, // Altura da animação
          fit: BoxFit.contain, // Modo de ajuste da animação no widget
        ),
      ),
    );
  }
}

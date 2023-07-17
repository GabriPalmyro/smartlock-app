import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/auth_states_enum.dart';
import 'package:smartlock_app/app/modules/auth/auth_controller.dart';
import 'package:smartlock_app/app/modules/auth/pages/auth_login_page.dart';
import 'package:smartlock_app/app/modules/auth/pages/auth_register_page.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: theme.primary,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Obx(
              () => AnimatedContainer(
                duration: const Duration(milliseconds: 550),
                curve: Curves.easeInOut,
                width: width,
                height: controller.page.value == AuthPage.login
                    ? height * 0.55
                    : height * 0.8,
                decoration: BoxDecoration(
                  color: theme.secondaryContainer,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 350),
                  firstChild: AuthLoginPage(),
                  secondChild: AuthRegisterPage(),
                  crossFadeState: controller.page.value == AuthPage.login
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

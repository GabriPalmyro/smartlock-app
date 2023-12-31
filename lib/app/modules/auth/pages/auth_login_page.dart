import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/auth_states_enum.dart';
import 'package:smartlock_app/app/modules/auth/login_controller.dart';
import 'package:smartlock_app/app/widgets/buttons/primary_button.dart';
import 'package:smartlock_app/app/widgets/buttons/secondary_button.dart';
import 'package:smartlock_app/app/widgets/inputs/custom_text_field.dart';
import 'package:smartlock_app/app/widgets/inputs/custom_text_field_password.dart';
import 'package:smartlock_app/app/widgets/snackbars/error_snackbar.dart';
import 'package:smartlock_app/core/configs/app_images.dart';

class AuthLoginPage extends GetView<LoginController> {
  const AuthLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: theme.background,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.paddingOf(context).top + 18.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bem Vindo,',
                          style: textTheme.titleLarge!
                              .copyWith(color: theme.primary),
                        ),
                        Text(
                          'Possui alguma\nconta registrada?',
                          style: textTheme.bodySmall!.copyWith(
                              fontSize: 18,
                              color: theme.primary,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 82.0, child: Image.asset(AppImages.ifspLogo)),
                ],
              ),
              const SizedBox(height: 12.0),
              CustomTextField(
                  hint: 'Prontuário',
                  controller: controller.prontuarioController,
                  focusNode: controller.prontuarioNode),
              const SizedBox(height: 12.0),
              CustomTextFieldPassword(
                hint: 'Senha',
                controller: controller.passwordController,
                focusNode: controller.passwordNode,
              ),
              const SizedBox(height: 24.0),
              Obx(() => PrimaryButtonWidget(
                    size: Size(width, 45),
                    onTap: () {
                      controller.login();
                    },
                    label: 'Entrar',
                    loading: controller.state.value == AuthStates.loging,
                  )),
              const SizedBox(height: 12.0),
              SecondaryButtonWidget(
                  size: Size(width, 45),
                  onTap: () {
                    showErrorSnackbar(
                      message:
                          'Desculpe, criação de conta para alunos ainda não está disponível. Caso seja um professor entre em contato com o suporte',
                    );
                    // Get.toNamed(Routes.register);
                  },
                  label: 'Criar uma Conta'),
              SizedBox(height: MediaQuery.paddingOf(context).bottom + 280),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/auth_states_enum.dart';
import 'package:smartlock_app/app/modules/auth/auth_controller.dart';
import 'package:smartlock_app/app/modules/auth/register_controller.dart';
import 'package:smartlock_app/app/widgets/buttons/primary_button.dart';
import 'package:smartlock_app/app/widgets/buttons/secondary_button.dart';
import 'package:smartlock_app/app/widgets/inputs/custom_text_field.dart';
import 'package:smartlock_app/app/widgets/inputs/custom_text_field_password.dart';
import 'package:smartlock_app/core/configs/app_images.dart';

class AuthRegisterPage extends GetView<RegisterController> {
  AuthRegisterPage({super.key});

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    final width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Crie uma\nnova conta',
                    style: textTheme.titleLarge!.copyWith(color: theme.primary),
                  ),
                ),
                Image.asset(AppImages.ifspLogo),
              ],
            ),
            const SizedBox(height: 18.0),
            CustomTextField(
                hint: 'Prontuário',
                controller: controller.prontuarioController),
            const SizedBox(height: 12.0),
            CustomTextField(
                hint: 'Nome Completo', controller: controller.nameController),
            const SizedBox(height: 12.0),
            CustomTextField(
                hint: 'Email', controller: controller.emailController),
            const SizedBox(height: 12.0),
            CustomTextField(
                hint: 'Telefone', controller: controller.numberController),
            const SizedBox(height: 12.0),
            CustomTextFieldPassword(
                hint: 'Senha', controller: controller.passwordController),
            const SizedBox(height: 24.0),
            PrimaryButtonWidget(
                size: Size(width, 45), onTap: () {}, label: 'Criar Conta'),
            const SizedBox(height: 12.0),
            SecondaryButtonWidget(
                size: Size(width, 45),
                onTap: () {
                  authController.page.value = AuthPage.login;
                },
                label: 'Já possui uma conta?'),
            SizedBox(height: MediaQuery.paddingOf(context).bottom + 280),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/user-settings/widgets/header_user_settings.dart';

import '../../data/services/user_service.dart';

class UserSettingsView extends StatelessWidget {
  UserSettingsView({super.key});

  final userService = Get.find<UserService>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            HeaderUserSettings(),
            const SizedBox(height: 18.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Informações Pessoais',
                    style: textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 18.0),
                  Text(
                    userService.user!.name,
                    style: textTheme.bodySmall,
                  ),
                  Text(
                    'Nome',
                    style: textTheme.bodySmall!.copyWith(color: textTheme.bodySmall!.color!.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    userService.user!.code,
                    style: textTheme.bodySmall,
                  ),
                  Text(
                    'Matrícula',
                    style: textTheme.bodySmall!.copyWith(color: textTheme.bodySmall!.color!.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    userService.user!.email,
                    style: textTheme.bodySmall,
                  ),
                  Text(
                    'Email',
                    style: textTheme.bodySmall!.copyWith(color: textTheme.bodySmall!.color!.withOpacity(0.8), fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';

class HeaderTeacherHome extends StatelessWidget {
  HeaderTeacherHome({super.key});

  final userService = Get.find<UserService>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(color: theme.primary),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0)
          .copyWith(bottom: 22.0),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.paddingOf(context).top + 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Olá, ${userService.user!.name.split(' ').first}',
                style: textTheme.bodyMedium!.copyWith(
                    color: theme.background, fontWeight: FontWeight.w600),
              ),
              InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: kWhite.withOpacity(0.3),
                  child: const Icon(
                    Icons.settings,
                    color: kWhite,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

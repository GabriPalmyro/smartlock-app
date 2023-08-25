import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';
import 'package:smartlock_app/core/configs/app_icons.dart';

class HeaderUserSettings extends StatelessWidget {
  HeaderUserSettings({super.key});

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
                'Conta',
                style: textTheme.titleLarge!.copyWith(
                    color: theme.background, fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      backgroundColor: kWhite.withOpacity(0.3),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: AppIcon(icon: AppIcons.edit),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: InkWell(
                      onTap: () {
                        userService.logout();
                      },
                      child: Icon(
                        Icons.logout_rounded,
                        color: Theme.of(context).colorScheme.surface,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

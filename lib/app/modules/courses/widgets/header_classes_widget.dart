import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';

class HeaderClassesHome extends StatelessWidget {
  HeaderClassesHome({super.key});

  final userService = Get.find<UserService>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(color: theme.primary),
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0)
          .copyWith(bottom: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.paddingOf(context).top + 12.0),
          Text(
            'Minhas Aulas',
            style: textTheme.bodyMedium!.copyWith(
                fontSize: 24,
                color: theme.background,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}

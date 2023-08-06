import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/home/home_controller.dart';
import 'package:smartlock_app/app/widgets/snackbars/error_snackbar.dart';
import 'package:smartlock_app/core/configs/app_icons.dart';

class BottomNavigatorWidget extends GetView<HomeController> {
  const BottomNavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width * 0.9,
          decoration: BoxDecoration(
            color: theme.background,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 2)
            ],
          ),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AnimatedOpacity(
                  opacity: controller.selectedIndex == 0 ? 1.0 : 0.5,
                  duration: const Duration(milliseconds: 120),
                  child: IconButton.outlined(
                      onPressed: () {
                        controller.onItemTapped(0);
                      },
                      icon: AppIcon(
                        icon: AppIcons.home,
                        color: theme.primary,
                      )),
                ),
                AnimatedOpacity(
                  opacity: controller.selectedIndex == 1 ? 1.0 : 0.5,
                  duration: const Duration(milliseconds: 120),
                  child: IconButton.outlined(
                      onPressed: () {
                        controller.onItemTapped(1);
                      },
                      icon: AppIcon(
                        icon: AppIcons.location,
                        color: theme.primary,
                      )),
                ),
                AnimatedOpacity(
                  opacity: controller.selectedIndex == 2 ? 1.0 : 0.5,
                  duration: const Duration(milliseconds: 120),
                  child: IconButton.outlined(
                      onPressed: () {
                        // controller.onItemTapped(2);
                        showErrorSnackbar(message: 'Não disponível ainda');
                      },
                      icon: AppIcon(
                        icon: AppIcons.book,
                        color: theme.primary,
                      )),
                ),
                AnimatedOpacity(
                  opacity: controller.selectedIndex == 3 ? 1.0 : 0.5,
                  duration: const Duration(milliseconds: 120),
                  child: IconButton.outlined(
                      onPressed: () {
                        // controller.onItemTapped(3);
                        showErrorSnackbar(message: 'Não disponível ainda');
                      },
                      icon: AppIcon(
                        icon: AppIcons.person,
                        color: theme.primary,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

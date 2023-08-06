import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/home/home_controller.dart';
import 'package:smartlock_app/app/widgets/navigators/bottom_navigator_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Obx(
        () => Stack(
          children: [
            IndexedStack(
              index: controller.selectedIndex,
              children: controller.widgetOptions,
            ),
            Positioned(
              bottom: 20 + MediaQuery.paddingOf(context).bottom,
              child: const BottomNavigatorWidget(),
            )
          ],
        ),
      ),
    );
  }
}

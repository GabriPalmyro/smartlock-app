import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/classroom/classroom_controller.dart';
import 'package:smartlock_app/app/modules/classroom/widgets/classroom_state_widget.dart';
import 'package:smartlock_app/app/modules/classroom/widgets/next_classes_widget.dart';
import 'package:smartlock_app/app/modules/classroom/widgets/open_class_modal.dart';
import 'package:smartlock_app/app/widgets/skeleton/skeleton.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';

import 'widgets/access_widget.dart';

class ClassroomInfosPage extends GetView<ClassroomController> {
  const ClassroomInfosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.primary,
      appBar: AppBar(
        backgroundColor: theme.primary,
        title: Obx(() => controller.loading.value
            ? const Skeleton(height: 35, width: 200, radius: 6)
            : Text(
                'Sala ${controller.classroomInfos.value!.block}${controller.classroomInfos.value!.name}',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: kWhite, fontSize: 26),
              )),
        elevation: 0,
        centerTitle: false,
        actions: const [ClassroomStateWidget()],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: Get.size.height,
            width: Get.size.width,
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 24.0),
                  AccessWidget(),
                  SizedBox(height: 16.0),
                  NextClassesWidget(),
                  SizedBox(height: 120),
                ],
              ),
            ),
          ),
          const OpenClassroomModal()
        ],
      ),
    );
  }
}

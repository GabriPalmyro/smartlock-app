import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/classroom/classroom_controller.dart';
import 'package:smartlock_app/app/modules/classroom/widgets/classroom_state_widget.dart';
import 'package:smartlock_app/app/modules/classroom/widgets/next_classes_widget.dart';
import 'package:smartlock_app/app/modules/classroom/widgets/open_class_modal.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';

import 'widgets/access_widget.dart';

class ClassroomInfosPage extends GetView<ClassroomController> {
  const ClassroomInfosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.primary,
      appBar: AppBar(
        backgroundColor: theme.primary,
        title: Text(
          'Sala ${controller.classroomInfos.value!.block}${controller.classroomInfos.value!.name}',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: kWhite, fontSize: 26),
        ),
        elevation: 0,
        centerTitle: false,
        actions: const [
          ClassroomStateWidget()
        ],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: Get.size.height,
            width: Get.size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 24.0),
                  AccessWidget(access: controller.classroomInfos.value!.access),
                  const SizedBox(height: 16.0),
                  NextClassesWidget(
                      nextclasses: controller.classroomInfos.value!.nextClasses)
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

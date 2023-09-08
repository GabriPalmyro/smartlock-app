import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/courses/classes_controller.dart';
import 'package:smartlock_app/app/modules/courses/widgets/header_classes_widget.dart';
import 'package:smartlock_app/app/modules/courses/widgets/list_all_classes_widget.dart';
import 'package:smartlock_app/core/configs/app_icons.dart';

class MyClassesPage extends GetView<ClassController> {
  const MyClassesPage({super.key});

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
            HeaderClassesHome(),
            Obx(() {
              if (controller.allClasses.isNotEmpty) {
                return const ListOfAllClasses();
              } else {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 18.0),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.2,
                        ),
                        const AppIcon(
                          icon: AppIcons.noList,
                          size: Size(
                            250,
                            250,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}

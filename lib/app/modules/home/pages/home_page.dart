import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/services/user_service.dart';
import 'package:smartlock_app/app/modules/courses/classes_controller.dart';
import 'package:smartlock_app/app/modules/home/widgets/header_teacher_home.dart';
import 'package:smartlock_app/app/modules/home/widgets/list_of_classes_from_today.dart';
import 'package:smartlock_app/core/configs/app_icons.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final userService = Get.find<UserService>();
  final classController = Get.find<ClassController>();

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
            HeaderTeacherHome(),
            Obx(() {
              if (classController.classesFromToday.isNotEmpty) {
                return const ListOfClassesFromToday();
              } else {
                return SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const SizedBox(height: 18.0),
                        Text(
                          'Suas próximas aulas de Hoje',
                          style: textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
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

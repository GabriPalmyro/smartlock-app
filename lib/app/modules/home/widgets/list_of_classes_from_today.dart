import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/home/classes/classes_controller.dart';
import 'package:smartlock_app/app/modules/home/widgets/card_home_class_teacher.dart';

class ListOfClassesFromToday extends GetView<ClassController> {
  const ListOfClassesFromToday({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 18.0),
          Text(
            'Suas próximas aulas de Hoje',
            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12.0),
          Obx(() => Column(
                children: List.generate(
                  controller.classesFromToday.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: CardHomeClassTeacher(
                      classe: controller.classesFromToday[index],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

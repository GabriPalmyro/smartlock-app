import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/courses/classes_controller.dart';
import 'package:smartlock_app/app/modules/courses/widgets/card_my_class_widget.dart';

class ListOfAllClasses extends GetView<ClassController> {
  const ListOfAllClasses({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 18.0),
          Obx(() => Column(
                children: List.generate(
                  controller.allClasses.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: CardMyClassTeacher(
                      classe: controller.allClasses[index],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

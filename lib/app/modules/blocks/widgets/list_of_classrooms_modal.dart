import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/classroom/classroom_controller.dart';
import 'package:smartlock_app/core/configs/app_icons.dart';
import 'package:smartlock_app/routes/pages.dart';

class ListOfClassroomsModal extends GetView<ClassroomController> {
  final String block;
  const ListOfClassroomsModal({super.key, required this.block});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: Get.size.height * 0.75,
      decoration: BoxDecoration(
        color: theme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bloco $block',
              style: textTheme.bodyLarge!
                  .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            Text(
              'Lista de Salas',
              style: textTheme.bodySmall!.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                controller.listOfClassroomByBlock.length,
                (index) => Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: theme.primary.withOpacity(0.5),
                    onTap: () async {
                      await controller.getClassroomInfosById(controller.listOfClassroomByBlock[index].id);
                      Get.toNamed(Routes.home + Routes.classroom);
                    },
                    child: Ink(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 8.0),
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: theme.primary, width: 1.5))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              'Sala ${controller.listOfClassroomByBlock[index].block}${controller.listOfClassroomByBlock[index].name}'),
                          AppIcon(
                            icon: AppIcons.arrowRight,
                            color: theme.primary,
                            size: const Size(16, 16),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

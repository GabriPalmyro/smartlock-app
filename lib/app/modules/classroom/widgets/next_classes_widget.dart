import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smartlock_app/app/modules/classroom/classroom_controller.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';
import 'package:smartlock_app/utils/helper/datetime.dart';

class NextClassesWidget extends GetView<ClassroomController> {
  const NextClassesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.95,
      decoration: BoxDecoration(
        color: theme.background,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Próximas Aulas',
            style: textTheme.bodyMedium!.copyWith(color: theme.surface),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Obx(() {
            if (controller.loading.value) {
              return Column(
                children: List.generate(
                  3,
                  (index) => Shimmer.fromColors(
                    baseColor: kPrimary.withOpacity(0.35),
                    highlightColor: kPrimary.withOpacity(0.3),
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 14.0),
                        decoration: BoxDecoration(
                            color: kWhite.withOpacity(0.57),
                            borderRadius: BorderRadius.circular(8)),
                        height: 60),
                  ),
                ),
              );
            } else {
              return Column(
                children: List.generate(
                  controller.classroomInfos.value!.nextClasses.length,
                  (index) => Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: theme.primary.withOpacity(0.6)),
                        borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    margin: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            controller
                                .classroomInfos.value!.nextClasses[index].name,
                            style: textTheme.bodyMedium!,
                          ),
                        ),
                        const SizedBox(width: 24.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              convertDateTimeToString(calculateNextClassDate(
                                  controller.classroomInfos.value!
                                      .nextClasses[index].dayOffTheWeek)),
                              style: textTheme.bodySmall!.copyWith(
                                  fontSize: 10,
                                  color: theme.primary.withOpacity(0.6)),
                            ),
                            const SizedBox(height: 2.0),
                            Row(
                              children: [
                                Text(
                                  '${convertDateTimeToStringTime(controller.classroomInfos.value!.nextClasses[index].initialTime)} - ',
                                  style: textTheme.bodyMedium!.copyWith(
                                      fontSize: 14,
                                      color: theme.primary.withOpacity(0.8),
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  convertDateTimeToStringTime(controller
                                      .classroomInfos
                                      .value!
                                      .nextClasses[index]
                                      .endTime),
                                  style: textTheme.bodyMedium!.copyWith(
                                      fontSize: 14,
                                      color: theme.primary.withOpacity(0.8),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
          })
        ],
      ),
    );
  }
}

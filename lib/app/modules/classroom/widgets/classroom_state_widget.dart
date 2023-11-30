import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/lock_states_enum.dart';
import 'package:smartlock_app/app/modules/classroom/classroom_controller.dart';
import 'package:smartlock_app/app/widgets/skeleton/skeleton.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';

class ClassroomStateWidget extends GetView<ClassroomController> {
  const ClassroomStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading.value
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0)
                  .copyWith(right: 12.0),
              child: const Skeleton(height: 30, width: 80, radius: 6),
            )
          : Container(
              height: 15,
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              margin: const EdgeInsets.symmetric(vertical: 16.0)
                  .copyWith(right: 12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: controller.classroomInfos.value!.lock != null
                      ? controller.classroomInfos.value!.lock!.state ==
                              LockState.close
                          ? Theme.of(context).colorScheme.surface
                          : kSuccess
                      : kError),
              child: Center(
                child: Text(
                  fromLockStateToString(
                      controller.classroomInfos.value!.lock == null
                          ? LockState.error
                          : controller.classroomInfos.value!.lock!.state),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: kWhite, fontWeight: FontWeight.w600, fontSize: 11),
                ),
              ),
            ),
    );
  }
}

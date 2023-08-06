import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/modules/classroom/classroom_controller.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';
import 'package:smartlock_app/core/configs/app_icons.dart';

class CardBlockWidget extends GetView<ClassroomController> {
  final String block;
  final String image;
  const CardBlockWidget({Key? key, required this.block, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: theme.secondary.withOpacity(0.4),
          onTap: () {
            controller.getClassroomByBlock(block);
          },
          child: Ink(
            height: 180,
            decoration: BoxDecoration(
              color: theme.primary,
              boxShadow: [
                BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(1, 4))
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            // margin: const EdgeInsets.only(bottom: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(height: 12.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Bloco: $block',
                        style: textTheme.bodyLarge!.copyWith(
                            color: kWhite,
                            fontWeight: FontWeight
                                .w700), // Use appropriate text style here
                      ),
                      const AppIcon(
                        icon: AppIcons.arrowRight,
                        color: kWhite,
                        size: Size(18, 18),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: SizedBox(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

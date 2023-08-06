import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/class_states_enum.dart';
import 'package:smartlock_app/app/data/model/class.dart';
import 'package:smartlock_app/app/modules/courses/classes_controller.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';
import 'package:smartlock_app/core/configs/app_icons.dart';
import 'package:smartlock_app/utils/helper/datetime.dart';

class OpenClassFromHomeBottomSheet extends StatefulWidget {
  final Course course;
  const OpenClassFromHomeBottomSheet({super.key, required this.course});

  @override
  State<OpenClassFromHomeBottomSheet> createState() =>
      _OpenClassFromHomeBottomSheetState();
}

class _OpenClassFromHomeBottomSheetState
    extends State<OpenClassFromHomeBottomSheet> {
  final controller = Get.find<ClassController>();

  double _slideValue = 0;
  final double _containerWidth = Get.size.width * 0.9 - 70.0;
  bool _isConfirmed = false;

  void _updateSlidePosition(double xPosition) {
    setState(() {
      // Limitar a posição do polegar entre 0 e a largura do container
      _slideValue = xPosition.clamp(0, _containerWidth) / _containerWidth;
      // Verificar se o usuário deslizou até o final do container para confirmar
      if (xPosition >= _containerWidth) {
        _slideValue = 1.0;
        _isConfirmed = true;
      } else {
        _isConfirmed = false;
      }
    });
  }

  void _onDragStart(BuildContext context, DragStartDetails startDetails) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset localOffset = box.globalToLocal(startDetails.globalPosition);
    _updateSlidePosition(localOffset.dx);
  }

  void _onDragUpdate(BuildContext context, DragUpdateDetails updateDetails) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset localOffset = box.globalToLocal(updateDetails.globalPosition);
    _updateSlidePosition(localOffset.dx);
  }

  void _onDragEnd(BuildContext context, DragEndDetails endDetails) async {
    if (_isConfirmed) {
      // Ação a ser executada quando o slide é confirmado
      log('Slide Confirmado!');
      // Coloque aqui a ação que deseja executar quando o slide é confirmado
      await controller.openClassById(widget.course.id);
    } else {
      // Reiniciar o estado do slide após confirmar ou cancelar
      setState(() {
        _slideValue = 0;
        _isConfirmed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final theme = Theme.of(context).colorScheme;
    return Container(
      height: Get.size.height * 0.3,
      decoration: BoxDecoration(
        color: theme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.course.subject,
            style: textTheme.bodyLarge!
                .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 6.0),
          Text(
            '${convertDateTimeToStringTime(widget.course.initialTimeClass)} - ${convertDateTimeToStringTime(widget.course.endTimeClass)}',
            style: textTheme.bodySmall!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: theme.primary.withOpacity(0.8)),
          ),
          const SizedBox(height: 6.0),
          Row(
            children: [
              Text(
                'Sala: ',
                style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: theme.primary.withOpacity(0.8)),
              ),
              Text(
                '${widget.course.classroom.block.toUpperCase()}${widget.course.classroom.name.toUpperCase()}',
                style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: theme.primary.withOpacity(0.8)),
              ),
            ],
          ),
          const SizedBox(height: 24.0),
          GestureDetector(
            dragStartBehavior: DragStartBehavior.start,
            onHorizontalDragStart: (details) =>
                _onDragStart(context, details),
            onHorizontalDragUpdate: (details) =>
                _onDragUpdate(context, details),
            onHorizontalDragEnd: (details) => _onDragEnd(context, details),
            child: Container(
              width: _containerWidth + 70,
              height: 65,
              decoration: BoxDecoration(
                  color: theme.surface,
                  borderRadius: BorderRadius.circular(12)),
              child: Stack(
                children: [
                  SizedBox(
                    width: Get.size.width,
                    height: 100,
                    child: Center(
                      child: Text(
                        'Abrir',
                        style: textTheme.bodySmall!.copyWith(
                            color: theme.background.withOpacity(0.8)),
                      ),
                    ),
                  ),
                  Obx(
                    () => AnimatedPositioned(
                      duration: const Duration(milliseconds: 250),
                      left: 0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        width: _isConfirmed
                            ? 70 + (_slideValue * _containerWidth)
                            : 70 + (_slideValue * _containerWidth),
                        height: 65,
                        decoration: BoxDecoration(
                            color: theme.primary,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CircleAvatar(
                          backgroundColor: kWhite,
                          child: AnimatedCrossFade(
                            duration: const Duration(milliseconds: 200),
                            firstChild: AnimatedCrossFade(
                              duration: const Duration(milliseconds: 200),
                              firstChild: const AppIcon(
                                icon: AppIcons.arrowRight,
                                size: Size(15, 15),
                              ),
                              secondChild: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: CircularProgressIndicator(
                                    strokeWidth: 1.5),
                              ),
                              crossFadeState: !_isConfirmed
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                            ),
                            secondChild: const AppIcon(
                              icon: AppIcons.check,
                              size: Size(15, 15),
                            ),
                            crossFadeState: controller.state.value ==
                                    ClassStates.classOpened
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/app/data/enum/lock_states_enum.dart';
import 'package:smartlock_app/app/modules/classroom/classroom_controller.dart';
import 'package:smartlock_app/app/widgets/snackbars/error_snackbar.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';
import 'package:smartlock_app/core/configs/app_icons.dart';

class OpenClassroomModal extends StatefulWidget {
  const OpenClassroomModal({super.key});

  @override
  State<OpenClassroomModal> createState() => _OpenClassroomModalState();
}

class _OpenClassroomModalState extends State<OpenClassroomModal> {
  final controller = Get.find<ClassroomController>();

  bool isModalOpen = false;

  double _slideValue = 0;
  final double _containerWidth = Get.size.width * 0.9 - 70.0;
  bool _isConfirmed = false;
  bool _isOpenedSucces = false;

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
    if (!_isOpenedSucces && !controller.isProcessingLock.value) {
      final RenderBox box = context.findRenderObject() as RenderBox;
      final Offset localOffset = box.globalToLocal(startDetails.globalPosition);
      _updateSlidePosition(localOffset.dx);
    }
  }

  void _onDragUpdate(BuildContext context, DragUpdateDetails updateDetails) {
    if (!_isOpenedSucces && !controller.isProcessingLock.value) {
      final RenderBox box = context.findRenderObject() as RenderBox;
      final Offset localOffset =
          box.globalToLocal(updateDetails.globalPosition);
      _updateSlidePosition(localOffset.dx);
    }
  }

  void _onDragEnd(BuildContext context, DragEndDetails endDetails) async {
    if (_isConfirmed) {
      // Ação a ser executada quando o slide é confirmado
      // Coloque aqui a ação que deseja executar quando o slide é confirmado
      try {
        if (controller.classroomInfos.value!.lock!.state == LockState.close) {
          await controller.openClassroomLock();
        } else {
          await controller.closeClassroomLock();
        }
        setState(() => _isOpenedSucces = true);
        await Future.delayed(const Duration(milliseconds: 1500));
        setState(() => isModalOpen = false);
        await Future.delayed(const Duration(milliseconds: 300));
        setState(() {
          _slideValue = 0;
          _isConfirmed = false;
          _isOpenedSucces = false;
        });
      } catch (error) {
        setState(() {
          _slideValue = 0;
          _isConfirmed = false;
        });
        showErrorSnackbar(message: error.toString());
      }
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
    return Obx(() => AnimatedPositioned(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOutQuad,
          bottom: controller.loading.value ||
                  controller.classroomInfos.value!.lock == null
              ? -210
              : isModalOpen
                  ? 0
                  : -110,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                color: theme.background,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, -5),
                  )
                ]),
            height: 200,
            width: MediaQuery.sizeOf(context).width,
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isModalOpen = !isModalOpen;
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    color: theme.background,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller.loading.value ||
                                  controller.classroomInfos.value!.lock == null
                              ? ''
                              : controller.classroomInfos.value!.lock?.state ==
                                      LockState.close
                                  ? 'Abrir Sala'
                                  : 'Fechar Sala',
                          style: textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                        AnimatedRotation(
                          duration: const Duration(milliseconds: 350),
                          curve: Curves.easeInOutQuad,
                          turns: isModalOpen ? 0 : 0.5,
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: theme.primary,
                            size: 26,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 52.0),
                GestureDetector(
                  dragStartBehavior: DragStartBehavior.start,
                  onHorizontalDragStart: (details) =>
                      _onDragStart(context, details),
                  onHorizontalDragUpdate: (details) =>
                      _onDragUpdate(context, details),
                  onHorizontalDragEnd: (details) =>
                      _onDragEnd(context, details),
                  child: Container(
                    width: _containerWidth + 70,
                    height: 55,
                    decoration: BoxDecoration(
                        color: theme.surface,
                        borderRadius: BorderRadius.circular(12)),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: Get.size.width,
                          height: 55,
                          child: Center(
                            child: Text(
                              controller.loading.value ||
                                      controller.classroomInfos.value!.lock ==
                                          null
                                  ? ''
                                  : controller.classroomInfos.value!.lock
                                              ?.state ==
                                          LockState.close
                                      ? 'Abrir'
                                      : 'Fechar',
                              style: textTheme.bodySmall!.copyWith(
                                  color: theme.background.withOpacity(0.8)),
                            ),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 250),
                          left: 0,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            width: _isConfirmed
                                ? 70 + (_slideValue * _containerWidth)
                                : 70 + (_slideValue * _containerWidth),
                            height: 55,
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
                                crossFadeState: _isOpenedSucces
                                    ? CrossFadeState.showSecond
                                    : CrossFadeState.showFirst,
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
          ),
        ));
  }
}

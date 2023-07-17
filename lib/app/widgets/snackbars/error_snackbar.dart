import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smartlock_app/core/configs/app_colors.dart';

void showErrorSnackbar({required String message}) {
  Get.closeAllSnackbars();
  Get.showSnackbar(GetSnackBar(
    message: message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: kError,
    borderRadius: 10,
    isDismissible: true,
    duration: const Duration(seconds: 3),
    forwardAnimationCurve: Curves.easeInOut,
    reverseAnimationCurve: Curves.easeInOut,
    margin: const EdgeInsets.symmetric(horizontal: 12.0).copyWith(top: 8),
  ));
}

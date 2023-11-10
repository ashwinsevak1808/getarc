import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetConstants {
  static errorSnackBar({required String content, Color textColor = Colors.white}) {
    return Get.snackbar(
      'Error',
      content,
      backgroundColor: Colors.red[400],
      colorText: textColor,
      borderRadius: 10,
    );
  }

  static successSnackBar({required String content, Color textColor = Colors.white}) {
    return Get.snackbar(
      'Success',
      content,
      backgroundColor: Colors.green[100]!.withOpacity(0.8),
      borderRadius: 6,
      colorText: textColor,
    );
  }
}

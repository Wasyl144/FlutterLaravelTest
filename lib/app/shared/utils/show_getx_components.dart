import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowGetxComponents {
  static showSnackBar(String title, String message, Color backgroundColor) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: backgroundColor,
        colorText: Colors.white);
  }

  static showDialog(String title, String message, Color backgroundColor) {
    Get.defaultDialog(
      title: title,
      middleText: message,
      backgroundColor: backgroundColor,
      titleStyle: TextStyle(color: Colors.white),
      middleTextStyle: TextStyle(color: Colors.white),

    );
  }
}
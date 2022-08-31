import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/utils/app_colors.dart';

class Message {
  static void taskErrorOrWarning(String taskName, String taskErrorOrWarning) {
    Get.snackbar(taskName, taskErrorOrWarning,
        backgroundColor: Colors.transparent.withOpacity(.1),
        barBlur: 3,
        messageText: Text(
          taskErrorOrWarning,
          style: TextStyle(
            fontSize: 20, color: AppColors.mainColor,
          ),
        ),
        titleText: Text(
          taskName,
          style: TextStyle(
            fontSize: 16,
            color:  AppColors.mainColor,
          ),
        ));
  }
}

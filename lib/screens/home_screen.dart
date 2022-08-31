import 'package:flutter/material.dart';
import 'package:task_management/screens/add_task.dart';
import 'package:task_management/screens/all_tasks.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/utils/main_greeting.dart';
import 'package:task_management/utils/main_images.dart';
import 'package:task_management/widgets/button_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
                text: getMainGreeting(),
                style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 50,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: '\nНачни свою продуктивную работу!',
                    style: TextStyle(
                      color: AppColors.smallTextColor,
                      fontSize: 16,
                    ),
                  )
                ]),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 2.5),
          InkWell(
            onTap: () {
              Get.to(() => AddTask(),
                  transition: Transition.native,
                  duration: Duration(milliseconds: 700));
            },
            child: ButtonWidget(
                backgroundColor: AppColors.mainColor,
                text: 'Добавить',
                textColor: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              Get.to(() => AllTasks(),
                  transition: Transition.native,
                  duration: Duration(milliseconds: 700));
            },
            child: ButtonWidget(
                backgroundColor: Colors.white,
                text: 'Открыть все',
                textColor: AppColors.smallTextColor),
          ),
        ],
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                getMainImage(),
              ))),
    ));
  }
}

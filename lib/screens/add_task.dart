import 'package:flutter/material.dart';
import 'package:task_management/controllers/data_controller.dart';
import 'package:task_management/screens/all_tasks.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/button_widget.dart';
import 'package:task_management/widgets/error_warning_ms.dart';
import 'package:task_management/widgets/textfield_widget.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    bool _dataValidation([String? message]) {
      if (nameController.text.trim().isEmpty) {
        Message.taskErrorOrWarning('Название', 'Название не может быть пустым');
        return false;
      } else if (detailController.text.trim().isEmpty) {
        Message.taskErrorOrWarning('Описание', 'Описание не может быть пустым');
        return false;
      } else if (message != null) {
        Message.taskErrorOrWarning('Ошибка', message);
      }
      return true;
    }

    return Scaffold(
        body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SizedBox(
                height: 60,
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back, color: AppColors.secondaryColor))
            ],
          ),
          Column(
            children: [
              TextFieldWidget(
                  textController: nameController,
                  hintText: 'Название',
                  borderRadius: 25),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                textController: detailController,
                hintText: 'Описание',
                borderRadius: 25,
                maxLines: 5,
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (_dataValidation()) {
                    Get.find<DataController>().postData(
                        name: nameController.text.trim(),
                        description: detailController.text.trim());
                    Get.to(() => AllTasks(),
                        transition: Transition.native,
                        duration: Duration(milliseconds: 700));
                  }
                },
                child: ButtonWidget(
                    backgroundColor: AppColors.mainColor,
                    text: 'Сохранить',
                    textColor: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 6,
          )
        ],
      ),
    ));
  }
}

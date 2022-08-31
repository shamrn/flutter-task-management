import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management/controllers/data_controller.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/textfield_widget.dart';

class ViewTask extends StatelessWidget {
  final int id;

  const ViewTask({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // _loadSingleTask() async {
    //   await Get.find<DataController>().getSingleData(id: id);
    // }
    //
    // _loadSingleTask();

    Map<String, dynamic> myData = Get.find<DataController>().singleData;

    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    return Scaffold(
        body: Scaffold(
            body: Container(
      width: double.maxFinite,
      height: double.maxFinite,
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          SizedBox(height: 200,),
          Column(
            children: [
              TextFieldWidget(
                textController: nameController,
                hintText: myData['name'],
                borderRadius: 25,
                readOnly: true,
              ),
              SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                textController: detailController,
                hintText: myData['description'],
                borderRadius: 25,
                maxLines: 5,
                readOnly: true,
              ),
            ],
          ),
        ],
      ),
    )));
  }
}

import 'package:flutter/material.dart';
import 'package:task_management/controllers/data_controller.dart';
import 'package:task_management/screens/add_task.dart';
import 'package:task_management/screens/edit_task.dart';
import 'package:task_management/screens/home_screen.dart';
import 'package:task_management/screens/view_task.dart';
import 'package:task_management/utils/app_colors.dart';
import 'package:task_management/widgets/button_widget.dart';
import 'package:task_management/widgets/task_widget.dart';
import 'package:get/get.dart';

class AllTasks extends StatelessWidget {
  const AllTasks({Key? key}) : super(key: key);

  _loadData() async {
    Get.find<DataController>().listData();
  }

  _loadSingleTask(id) async {
    Get.find<DataController>().retrieveData(id: id);
  }

  @override
  Widget build(BuildContext context) {

    _loadData();
    List<dynamic> myData = Get.find<DataController>().myData;
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Color(0xFF2e3253).withOpacity(.8),
      child: Icon(
        Icons.edit,
        color: Colors.white,
      ),
      alignment: Alignment.centerLeft,
    );
    final rightEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Colors.redAccent.withOpacity(0.9),
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: Alignment.centerRight,
    );


    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, top: 60),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Get.to(() => HomeScreen(),
                    transition: Transition.native,
                    duration: Duration(milliseconds: 700));
              },
              child: Icon(
                Icons.arrow_back,
                color: AppColors.secondaryColor,
              ),
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/header-banner.webp'))),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Row(
              children: [
                Icon(
                  Icons.home,
                  color: AppColors.secondaryColor,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => AddTask(),
                          transition: Transition.native,
                          duration: Duration(milliseconds: 700));
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  width: 22,
                  height: 22,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.5),
                      color: Colors.black),
                ),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.calendar_month_sharp,
                  color: AppColors.secondaryColor,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(Get.find<DataController>().myData.length.toString(),
                    style: TextStyle(
                        fontSize: 20, color: AppColors.secondaryColor)),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: myData.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    background: leftEditIcon,
                    secondaryBackground: rightEditIcon,
                    onDismissed: (DismissDirection direction) {},
                    confirmDismiss: (DismissDirection direction) async {
                      if (direction == DismissDirection.startToEnd) {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            context: context,
                            builder: (_) {
                              return Container(
                                decoration: BoxDecoration(
                                    color: AppColors.mainColor.withOpacity(0.5),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    )),
                                height: 550,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.off(() => ViewTask(
                                              id: myData[index]['id']));
                                        },
                                        child: ButtonWidget(
                                            backgroundColor:
                                                AppColors.mainColor,
                                            text: 'Открыть',
                                            textColor: Colors.white),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Get.off(() => EditTask(
                                              id: myData[index]['id']));
                                        },
                                        child: ButtonWidget(
                                            backgroundColor:
                                                AppColors.mainColor,
                                            text: 'Редактировать',
                                            textColor: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                        _loadSingleTask(myData[index]['id']);
                        return false;
                      } else {
                        Get.find<DataController>()
                            .deleteData(id: myData[index]['id']);
                        return true;
                      }
                    },
                    key: ObjectKey(index),
                    child: Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 10),
                      child: TaskWidget(
                          text: myData[index]['name'], color: Colors.blueGrey),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

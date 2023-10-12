import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_app/controllers/userTodoController.dart';
import 'package:intern_app/widgets/myButton.dart';
import 'package:intern_app/widgets/myText.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    UserTodoController controller = Get.find();
    final todoTextController = TextEditingController();
    controller.ReadData();

    return Scaffold(
        appBar: AppBar(
          title: Text('Todo'),
          actions: [
            IconButton(
              onPressed: () {
                controller.addNewTodo(1, 1, todoTextController);
              },
              icon: Icon(
                Icons.add,
              ),
            )
          ],
        ),
        body: Obx(
          () => ListView.builder(
            itemCount: controller.userTodoData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Container(
                  height: screenHeight * 0.1,
                  width: screenWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: screenWidth * 0.6,
                          child: controller.userTodoData[index].completed
                              ? Text(
                                  'Completed: ' +
                                      controller.userTodoData[index].title,
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                )
                              : MyText(
                                  text: 'Todo: ' +
                                      controller.userTodoData[index].title,
                                  fontWeight: FontWeight.w500,
                                  size: 18,
                                ),
                        ),
                      ),
                      MyButton(
                          top: 10,
                          bottom: 10,
                          widget: controller.userTodoData[index].completed
                              ? Icon(Icons.settings_backup_restore_rounded)
                              : Icon(Icons.done),
                          ontap: () {
                            controller.updateTodoStatus(
                                index,
                                controller.userTodoData[index].completed
                                    ? false
                                    : true);
                            controller.ReadData();
                          },
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.05),
                      MyButton(
                          top: 10,
                          bottom: 10,
                          widget: Icon(Icons.do_not_disturb_on),
                          ontap: () {
                            controller.deleteTodo(index);
                          },
                          color: Colors.red.shade400,
                          height: screenHeight * 0.05,
                          width: screenWidth * 0.05)
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}

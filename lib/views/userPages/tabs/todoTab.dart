// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_app/controllers/userTodoController.dart';
import 'package:intern_app/widgets/myText.dart';

class TodoTab extends StatelessWidget {
  TodoTab({
    Key? key,
    required this.userId,
  }) : super(key: key);
  final int userId;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    UserTodoController toDoController = Get.find();
    toDoController.getUserTodo(userId);
    return Obx(() => ListView(
          children: toDoController.todoData
              .map(
                (e) => Card(
                  child: Container(
                    height: screenHeight * 0.1,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          e.completed
                              ? Text(
                                  'Completed: ' + e.title,
                                  style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 18),
                                )
                              : MyText(
                                  text: 'Todo: ' + e.title,
                                  fontWeight: FontWeight.w500,
                                  size: 18,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ));
  }
}

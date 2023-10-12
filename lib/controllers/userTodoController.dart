import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intern_app/apis/todoApi.dart';
import 'package:intern_app/models/userTodoModel.dart';
import 'package:intern_app/widgets/myButton.dart';
import 'package:intern_app/widgets/myTextFormField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserTodoController extends GetxController {
  RxList<UserTodoModel> todoData = <UserTodoModel>[].obs;
//<---------------------------------------------------------------------------->
  RxList<UserTodoModel> userTodoData = <UserTodoModel>[].obs;

  void saveTodo(int userId, int id, String title, bool completed) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<UserTodoModel> todoList =
        userTodoData.toList(); // Convert RxList to a regular List
    UserTodoModel todoModelData = UserTodoModel(
        userId: userId, id: id, title: title, completed: completed);
    todoList.add(todoModelData); // Add the new todo to the list
    final jsondata = jsonEncode(todoList.map((todo) => todo.toJson()).toList());
    pref.setString('UserTodoData', jsondata);
  }

  void ReadData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final jsondata = pref.getString('UserTodoData');
    if (jsondata != null) {
      final List<dynamic> decodedData = jsonDecode(jsondata);
      userTodoData.assignAll(
        decodedData
            .map<UserTodoModel>((data) => UserTodoModel.fromJson(data))
            .toList(),
      );
    } else {
      userTodoData.assignAll([]); // Set to an empty list if there's no data
    }
  }

  // Method to delete a todo item
  void deleteTodo(int index) async {
    if (index >= 0 && index < userTodoData.length) {
      userTodoData.removeAt(index); // Remove the item from the list
      await saveTodoData(); // Save the updated list to SharedPreferences
    }
  }

  void updateTodoStatus(int index, bool completed) async {
    if (index >= 0 && index < userTodoData.length) {
      userTodoData[index].completed = completed; // Update the completed status
      await saveTodoData(); // Save the updated list to SharedPreferences
    }
  }

  // Method to save user-specific todo data to SharedPreferences
  Future<void> saveTodoData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final jsondata =
        jsonEncode(userTodoData.map((todo) => todo.toJson()).toList());
    pref.setString('UserTodoData', jsondata);
  }
//<---------------------------------------------------------------------------->

  void getUserTodo(int userId) async {
    todoData.clear();
    final data = await TodoApi().getUserTodo(userId);
    todoData.addAll(data);
  }

  //dialog box and save new data
  void addNewTodo(
      int userId, int id, TextEditingController todoTextController) {
    Get.defaultDialog(
      title: 'New Task',
      content:
          MyTextFormField(hintText: 'New Task', controller: todoTextController),
      cancel: MyButton(
          text: 'Cancel', ontap: () => Get.back(), height: 20, width: 100),
      confirm: MyButton(
          text: 'Save',
          ontap: () {
            if (todoTextController.text != '') {
              saveTodo(userId, id, todoTextController.text.toString(), false);
              Get.back();
              ReadData();
              todoTextController.text = '';
            } else {
              Get.back();
            }
          },
          height: 20,
          width: 100),
    );
  }
}

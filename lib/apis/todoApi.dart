import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intern_app/models/userTodoModel.dart';

class TodoApi {
  final dio = Dio();
  final List<UserTodoModel> todoData = [];

  Future<List<UserTodoModel>> getUserTodo(int userId) async {
    final response = await dio
        .get('https://jsonplaceholder.typicode.com/users/$userId/todos');
    try {
      if (response.statusCode == 200) {
        final data = userTodoModelFromJson(jsonEncode(response.data));
        todoData.addAll(data);
        return todoData;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return todoData;
  }
}

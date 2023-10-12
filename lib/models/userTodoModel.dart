// To parse this JSON data, do
//
//     final userTodoModel = userTodoModelFromJson(jsonString);

import 'dart:convert';

List<UserTodoModel> userTodoModelFromJson(String str) =>
    List<UserTodoModel>.from(
        json.decode(str).map((x) => UserTodoModel.fromJson(x)));

String userTodoModelToJson(List<UserTodoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserTodoModel {
  final int userId;
  final int id;
  final String title;
  bool completed;

  UserTodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory UserTodoModel.fromJson(Map<String, dynamic> json) => UserTodoModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
      };
}

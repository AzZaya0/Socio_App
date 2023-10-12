// To parse this JSON data, do
//
//     final userPhotosModel = userPhotosModelFromJson(jsonString);

import 'dart:convert';

List<UserPhotosModel> userPhotosModelFromJson(String str) =>
    List<UserPhotosModel>.from(
        json.decode(str).map((x) => UserPhotosModel.fromJson(x)));

String userPhotosModelToJson(List<UserPhotosModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserPhotosModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  UserPhotosModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory UserPhotosModel.fromJson(Map<String, dynamic> json) =>
      UserPhotosModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
      };
}

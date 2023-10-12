import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intern_app/models/UserPhotosModel.dart';

class UserPhotosApi {
  final dio = Dio();
  List<UserPhotosModel> userPhotoData = [];
  Future<List<UserPhotosModel>> getUserPhotos(int AlbumId) async {
    final response = await dio
        .get('https://jsonplaceholder.typicode.com/albums/$AlbumId/photos');
    try {
      if (response.statusCode == 200) {
        final data = userPhotosModelFromJson(jsonEncode(response.data));
        userPhotoData.addAll(data);
        return userPhotoData;
      }
    } catch (e) {
      print(e);
    }
    return userPhotoData;
  }
}

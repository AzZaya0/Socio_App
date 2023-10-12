import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intern_app/models/albumModel.dart';

class AlbumApi {
  final dio = Dio();
  List<AlbumModel> AlbumData = [];
  Future<List<AlbumModel>> getAlbumOfUser(int UserId) async {
    final response = await dio
        .get("https://jsonplaceholder.typicode.com/users/$UserId/albums");

    if (response.statusCode == 200) {
      List<AlbumModel> data = albumModelFromJson(jsonEncode(response.data));
      AlbumData.addAll(data);
      return AlbumData;
    }
    return AlbumData;
  }
}

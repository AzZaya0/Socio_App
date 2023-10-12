import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intern_app/models/postModel.dart';

class PostsApi {
  var dio = Dio();
  List<PostModel> PostData = [];
  List<PostModel> SinglePostData = [];

  String baseUri = 'https://jsonplaceholder.typicode.com/posts';
  Future<List<PostModel>> getPosts() async {
    try {
      final response = await dio.get(baseUri);

      if (response.statusCode == 200) {
        List<PostModel> posts = postModelFromJson(
            jsonEncode(response.data)); // Convert response.data to JSON string
        PostData.addAll(posts);
        return PostData;
      } else {}
    } catch (e) {
      print(e);
    }

    return PostData;
  }

  Future<List<PostModel>> viewSinglePostData(int user_id) async {
    try {
      final response = await dio
          .get('https://jsonplaceholder.typicode.com/users/$user_id/posts');

      if (response.statusCode == 200) {
        List<PostModel> posts = postModelFromJson(
            jsonEncode(response.data)); // Convert response.data to JSON string
        PostData.addAll(posts);
        return PostData;
      } else {}
    } catch (e) {
      print(e);
    }

    return PostData;
  }
}

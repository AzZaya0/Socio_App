import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:intern_app/models/commentModel.dart';

class CommentApi {
  var dio = Dio();
  List<CommentModel> commentData = [];
  List<CommentModel> PostcommentData = [];

  //
  Future<List<CommentModel>> sendComments(
      int postId, String name, String email, String body) async {
    try {
      // Sending POST request to the API to create a new comment for the specified post.
      final responses = await dio.post(
        'https://jsonplaceholder.typicode.com/posts/$postId/comments/',
        data: {
          'postId': postId,
          'name': name,
          'email': email,
          'body': body,
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (responses.statusCode == 201) {
        var jsonData = responses.data;
        CommentModel comment = CommentModel.fromJson(jsonData);
        commentData.add(comment);
        return commentData;
      } else {
        // Handle response status code other than 201 if needed.
        print('Error: ${responses.statusCode}');
      }
    } catch (e) {
      // Handle any errors that occur during the request or parsing.
      print('Error: $e');
    }
    // Return the list of fetched comments, which may be empty or contain data.
    return commentData;
  }

  Future<List<CommentModel>> getPostComments(int postId) async {
    try {
      final response = await dio.get(
        'https://jsonplaceholder.typicode.com/posts/$postId/comments/',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );
      if (response.statusCode == 200) {
        final jsonData = response.data;
        final data = jsonEncode(jsonData);
        List<CommentModel> comment = commentModelFromJson(data);
        PostcommentData.addAll(comment);
        return PostcommentData;
      } else {
        print('error');
      }
    } catch (e) {
      print(e);
    }

    return PostcommentData;
  }
}

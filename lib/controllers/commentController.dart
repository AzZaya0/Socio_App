import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_app/apis/commentsApi.dart';
import 'package:intern_app/models/commentModel.dart';

class CommentController extends GetxController {
  final isLoading = true.obs;

  // A list to store comments fetched from the API.
  RxList<CommentModel> commentData = <CommentModel>[].obs;
  RxList<CommentModel> PostcommentData = <CommentModel>[].obs;

  void sendComments(postId, name, email, body,Widget widget) async {
    var data = await CommentApi().sendComments(postId, name, email, body);
    commentData.addAll(data);
    print('done');
    Get.back();
    Get.defaultDialog(title: 'Status', content: widget);
  }

  final commentStream =
      StreamController<List<CommentModel>>(); //to solve data Dubitable problem

  void getPostComments(int postId) async {
    PostcommentData.clear();
    List<CommentModel> data2 = await CommentApi().getPostComments(postId);
    PostcommentData.addAll(data2);
    commentStream.add(PostcommentData);
    isLoading.value = false;
  }
}

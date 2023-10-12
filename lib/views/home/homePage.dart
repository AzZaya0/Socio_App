import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_app/controllers/postController.dart';
import 'package:intern_app/widgets/myPostCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double ScreenHeight = MediaQuery.of(context).size.height;
    double ScreenWidth = MediaQuery.of(context).size.width;
    PostController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: ScreenHeight * 0.05,
        title: Text('All Posts'),
      ),
      body: SafeArea(
        child: Container(
          height: ScreenHeight * 0.9,
          child: Center(
              child: Obx(
            () => ListView(
              physics: BouncingScrollPhysics(),
              children: controller.postData.map(
                (e) {
                  return MyPostCard(
                    userId: e.id,
                    postId: e.id,
                    title: 'Title',
                    titleText: e.title,
                    body: 'Body',
                    bodyText: e.body,
                    buttonName: 'comments',
                    ontap: () {
                      PostController.navigateToCommentPage(
                          e.id, e.title, e.body, e.userId);
                    },
                  );
                },
              ).toList(),
            ),
          )),
        ),
      ),
    );
  }
}

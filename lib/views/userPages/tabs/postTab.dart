// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_app/controllers/postController.dart';
import 'package:intern_app/models/userModel.dart';
import 'package:intern_app/widgets/myPostCard.dart';


class PostTab extends StatelessWidget {
  PostTab({
    Key? key,
    required this.userData,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);
  final UserModel userData;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    PostController postController = Get.find();
    return Container(
        color: Colors.white,
        child: Obx(
          () => ListView(
            physics: BouncingScrollPhysics(),
            children: postController.SinglePostData.map((e) => MyPostCard(
                  color: Colors.grey.shade100,
                  title: 'Title',
                  titleText: e.title,
                  body: 'Body',
                  bodyText: e.body,
                  buttonName: 'View comments',
                  ontap: () {
                    PostController.navigateToCommentPage(
                        e.id, e.title, e.body, e.userId);
                  },
                )).toList(),
          ),
        ));
  }
}
// child: Container(
//                 padding: EdgeInsets.all(20),
//                 height: screenHeight * 0.2,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       MyText(
//                         text: 'Post Title:\n' + e.title,
//                         size: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                       MyText(
//                         text: 'Post Body:\n' + e.body,
//                         size: 14,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
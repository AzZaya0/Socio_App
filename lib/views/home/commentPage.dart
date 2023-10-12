// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_app/controllers/commentController.dart';
import 'package:intern_app/controllers/userController.dart';
import 'package:intern_app/utils/constants.dart';
import 'package:intern_app/widgets/myButton.dart';
import 'package:intern_app/widgets/myText.dart';
import 'package:intern_app/widgets/myTextFormField.dart';
import 'package:lottie/lottie.dart';

class CommentPage extends StatelessWidget {
  CommentPage({
    Key? key,
    required this.postId,
    required this.userId,
    required this.postTitle,
    required this.postBody,
  }) : super(key: key);
  final int postId;
  final int userId;
  final String postTitle;
  final String postBody;

  @override
  Widget build(BuildContext context) {
    TextEditingController sendBodyController = TextEditingController();
    UserController userController = Get.find();
    CommentController commentController = Get.find();
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    // Execute the getSingleUser function with the userId
    userController
        .getSingleUser(userId); // Use a default value (1) if userId is null
    commentController.getPostComments(postId);
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () {
            if (userController.aUserData.isNotEmpty) {
              return Text(userController.aUserData[0].name);
            } else {
              return Text('Loading...');
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight * 0.8,
            width: screenWidth,
            child: Stack(
              children: [
                //<============================= post data  section ==============================\\
                Column(
                  children: [
                    Container(
                      height: screenHeight * 0.35,
                      width: screenWidth,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.grey),
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        children: [
                          MyText(
                            text: 'Post',
                            size: 20,
                            fontWeight: FontWeight.w500,
                          ),
                          Divider(
                            thickness: 2,
                            color: KTextColor,
                          ),
                          MyText(
                            text: 'Title: \n' + postTitle,
                            size: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          MyText(
                            top: 20,
                            text: 'Body: \n' + postBody,
                            size: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: screenHeight * 0.35,
                      width: screenWidth,
                      child: Obx(() {
                        if (commentController.isLoading.value) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: commentController.PostcommentData.length,
                            itemBuilder: (context, index) {
                              final comment =
                                  commentController.PostcommentData[index];
                              return ListTile(
                                title: Text(comment.name),
                                subtitle: Text(comment.body),
                              );
                            },
                          );
                        }
                      }),
                    ),
                    //<======================== Comment Section ===================================>\\
                  ],
                ),
                //<======================= Text Field =============================================>\\
                Align(
                  alignment: Alignment(0, 1),
                  child: MyButton(
                    text: 'New Comment',
                    ontap: () {
                      Get.defaultDialog(
                        title: 'New Comment',
                        content: MyTextFormField(
                            hintText: 'Enter your Comment',
                            controller: sendBodyController),
                        cancel: MyButton(
                            text: 'Cancel',
                            ontap: () => Get.back(),
                            height: 20,
                            width: 100),
                        confirm: MyButton(
                            text: 'send',
                            ontap: () {
                              commentController.sendComments(
                                  postId,
                                  'leaanne Graham',
                                  '123@email.com',
                                  sendBodyController.text.toString(),
                                  Container(
                                    child: Lottie.network(
                                        'https://lottie.host/c761d3cb-1455-4fee-874d-399579b49f4d/kNqDcrO0DV.json',
                                        repeat: false),
                                  ));
                            },
                            height: 20,
                            width: 100),
                      );
                    },
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

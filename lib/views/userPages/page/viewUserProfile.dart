// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_app/controllers/UserAlbumController.dart';
import 'package:intern_app/controllers/postController.dart';
import 'package:intern_app/models/userModel.dart';
import 'package:intern_app/views/userPages/tabs/albumTab.dart';
import 'package:intern_app/views/userPages/tabs/postTab.dart';
import 'package:intern_app/views/userPages/tabs/todoTab.dart';
import 'package:intern_app/widgets/myText.dart';
import 'package:lottie/lottie.dart';

class ViewUserProfile extends StatelessWidget {
  ViewUserProfile({
    Key? key,
    required this.userData,
  }) : super(key: key);

  final UserModel userData;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    PostController postController = Get.find();
    UserAlbumController userAlbumController = Get.find();
    postController.ViewSinglePost(userData.id);
    userAlbumController.getUserAlbum(userData.id);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Name: ' + userData.name.toString()),
        ),
        body: Container(
          height: screenHeight,
          width: screenWidth,
          child: Column(
            children: [
              Container(
                height: screenHeight * 0.21,
                width: screenWidth,
                color: Colors.white,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 15.0),
                            child: SizedBox(
                                height: 140,
                                width: 140,
                                child: Lottie.network(
                                  'https://lottie.host/04c6cbf8-732f-4f22-9e28-d7aada037461/ln4sgFR2nH.json',
                                  fit: BoxFit.fill,
                                )),
                          ),
                          MyText(
                            text: 'Username: ' + userData.username.toString(),
                            size: 15,
                            fontWeight: FontWeight.bold,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              top: 10,
                              text: 'Email: ' + userData.email.toString(),
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            MyText(
                              top: 10,
                              text: 'Number: ' + userData.phone.toString(),
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            MyText(
                              top: 10,
                              text: 'Website: ' + userData.website.toString(),
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            MyText(
                              top: 10,
                              text: 'City: ' + userData.address.city,
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            MyText(
                              top: 10,
                              text: 'Company: ' + userData.company.name,
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              TabBar(
                tabs: [
                  Tab(
                    icon: Icon(
                      CupertinoIcons.person_2_square_stack_fill,
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      CupertinoIcons.photo,
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      CupertinoIcons.arrowtriangle_down_square_fill,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(children: [
                PostTab(
                  userData: userData,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                AlbumTab(userName: userData.name),
                TodoTab(
                  userId: userData.id,
                )
              ]))
            ],
          ),
        ),
      ),
    );
  }
}

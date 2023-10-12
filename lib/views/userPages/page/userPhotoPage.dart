// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_app/controllers/UserAlbumController.dart';
import 'package:intern_app/widgets/myText.dart';

class UserPhotoPage extends StatelessWidget {
  UserPhotoPage({
    Key? key,
    required this.Name,
  }) : super(key: key);
  final String Name;
  @override
  Widget build(BuildContext context) {
    UserAlbumController controller = Get.find();
    double screenHeight = MediaQuery.of(context).size.height;
   // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(Name + ': Photos'),
      ),
      body: ListView(
        children: controller.userPhotoData
            .map((e) => Card(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          height: screenHeight * 0.2,
                          child: Image.network(e.url),
                        ),
                        MyText(left: 20, text: e.title),
                      ],
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

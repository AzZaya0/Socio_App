// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_app/controllers/UserAlbumController.dart';
import 'package:intern_app/widgets/myText.dart';

class AlbumTab extends StatelessWidget {
  AlbumTab({
    Key? key,
    required this.userName,
  }) : super(key: key);
  final String userName;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    UserAlbumController controller = Get.find();

    return Container(
        child: Obx(
      () => ListView.builder(
          itemCount: controller.albumData.length,
          itemBuilder: (BuildContext context, int index) {
            controller.getUserPhotoData(controller.albumData[index].id);
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  controller.navigateToPhotos(userName);
                },
                child: Card(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            height: 100,
                            width: 100,
                            child: Obx(() => controller.userPhotoData.isEmpty
                                ? Text('Loading')
                                : Image.network(controller
                                    .userPhotoData[index].thumbnailUrl))),
                        SizedBox(width: screenWidth * .05),
                        MyText(text: controller.albumData[index].title)
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    ));
  }
}

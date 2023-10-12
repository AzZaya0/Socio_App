import 'package:get/get.dart';
import 'package:intern_app/apis/albumApi.dart';
import 'package:intern_app/apis/userPhotosApi.dart';
import 'package:intern_app/models/UserPhotosModel.dart';
import 'package:intern_app/models/albumModel.dart';
import 'package:intern_app/views/userPages/page/userPhotoPage.dart';

class UserAlbumController extends GetxController {
  RxList<AlbumModel> albumData = <AlbumModel>[].obs;

  void getUserAlbum(int UserId) async {
    albumData.clear();
    final data = await AlbumApi().getAlbumOfUser(UserId);
    albumData.addAll(data);
  }

  RxList<UserPhotosModel> userPhotoData = <UserPhotosModel>[].obs;

  void getUserPhotoData(int AlbumId) async {
    userPhotoData.clear();
    final data = await UserPhotosApi().getUserPhotos(AlbumId);
    userPhotoData.addAll(data);
  }

  void navigateToPhotos(String Name) {
    Get.to(() => UserPhotoPage(
          Name: Name,
        ));
  }
}

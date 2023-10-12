import 'package:get/get.dart';
import 'package:intern_app/controllers/UserAlbumController.dart';
import 'package:intern_app/controllers/bottomNavBarController.dart';
import 'package:intern_app/controllers/commentController.dart';
import 'package:intern_app/controllers/postController.dart';
import 'package:intern_app/controllers/userController.dart';
import 'package:intern_app/controllers/userTodoController.dart';

class MyControllerBinding extends Bindings {
  @override
  void dependencies() {
    // Initialize your controllers or dependencies here
    Get.put(PostController());
    Get.put(UserController());
    Get.put(CommentController(), permanent: true);
    Get.put(BottomNavBarController());
    Get.put(CommentController());
    Get.put(UserAlbumController());
    Get.put(UserTodoController());
    //Get.lazyPut(() => HomepageController());
  }
}

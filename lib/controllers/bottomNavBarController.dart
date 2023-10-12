import 'package:get/get.dart';
import 'package:intern_app/views/Todo/todoPage.dart';
import 'package:intern_app/views/home/homePage.dart';
import 'package:intern_app/views/userPages/page/userPage.dart';

class BottomNavBarController extends GetxController {
  RxInt index = 0.obs;
  var pages = [HomePage(), UserPage(), TodoPage()];
}

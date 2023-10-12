// ignore_for_file: file_names

import 'dart:convert';

import 'package:get/get.dart';
import 'package:intern_app/apis/usersAPI.dart';
import 'package:intern_app/models/userModel.dart';
import 'package:intern_app/views/userPages/page/viewUserProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  RxList<UserModel> allUserData = <UserModel>[].obs;
  RxList<UserModel> aUserData = <UserModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    storeAllUser();
  }

  void storeAllUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var data = await UsersApi().getAllUsers();
    final jsondata = jsonEncode(data.map((todo) => todo.toJson()).toList());
    pref.setString('AllUserData', jsondata);
  }

  void getAllUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final jsondata = pref.getString('AllUserData');
    if (jsondata != null) {
      final List<dynamic> decodedData = jsonDecode(jsondata);
      allUserData.assignAll(
        decodedData.map<UserModel>((data) => UserModel.fromJson(data)).toList(),
      );
    }
  }

  void getSingleUser(id) async {
    aUserData.clear();
    var data2 = await UsersApi().getSingleUsers(id);
    aUserData.addAll(data2);
  }

  void navigateToViewUserProfile(UserModel data) {
    Get.to(() => ViewUserProfile(
          userData: data,
        ));
  }
}

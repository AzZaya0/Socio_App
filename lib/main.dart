import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intern_app/myControllerBinding.dart';
import 'package:intern_app/views/splashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Inter_App',
      initialBinding: MyControllerBinding(),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          toolbarHeight: MediaQuery.of(context).size.height * 0.05,
          backgroundColor:
              Colors.white, // Customize your AppBar background color
          foregroundColor: Colors.black, // Customize your AppBar text color
        ),
      ),
    );
  }
}

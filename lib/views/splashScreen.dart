import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intern_app/views/home/BottomNavigationBar.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            )));
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: screenHeight,
        width: screenWidth,
        child: Lottie.network(
            'https://lottie.host/0a21345a-8931-47f8-add9-842172fbca84/KQXLwOIJXe.json'),
      ),
    );
  }
}

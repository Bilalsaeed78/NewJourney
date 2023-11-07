import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/Screens/login_screen.dart';
import 'package:new_journey/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Get.offAll(() => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/10811.jpg', // Replace with the path to your image asset
              width: 200, // Set your desired width here
            ),
            SizedBox(
                height: 20), // Adjust the spacing between the image and text
            Text(
              'Your Splash MOOOOSA Text',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

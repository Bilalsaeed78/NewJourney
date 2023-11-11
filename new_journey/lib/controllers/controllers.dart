import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController studentCardController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> SignUp(String email, String password) async {
    try {
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential.user);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print(e.code);
    }
  }

  Future<User?> login() async {
    try {
      final String email = emailController.text;
      final String password = passwordController.text;

      final UserCredential userCredential =
          await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return userCredential.user;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (e) {
      // Handle login error
      print(e.code);
      return null;
    }
  }
}

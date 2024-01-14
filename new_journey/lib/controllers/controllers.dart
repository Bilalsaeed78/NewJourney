import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:new_journey/controllers/api_constants.dart';
import 'package:new_journey/local/cache_manager.dart';
import 'package:new_journey/Screens/login_screen.dart';

class AuthController extends GetxController {
  final CacheManager cacheManager = CacheManager();

  static const String baseUrl = ApiConstants.baseUrl;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> registerUser({
    required String name,
    required String email,
    required String password,
    required String cnic,
    required String phoneNumber,
    required String role,
  }) async {
    final url = Uri.parse('$baseUrl/user/register');

    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'name': name,
          'email': email,
          'password': password,
          'cnic': cnic,
          'phoneNumber': phoneNumber,
          'role': role,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
        encoding: Encoding.getByName('utf-8'),
      );

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'User registered successfully');
      } else {
        throw Exception('Failed to register user');
      }
    } catch (e) {
      throw Exception('Failed to register user: $e');
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
    required String type,
  }) async {
    final url = Uri.parse('$baseUrl/user/login');

    try {
      final response = await http.post(
        url,
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Save token in ApiConstants.accessToken
        ApiConstants.accessToken = responseData['token'];
        cacheManager.saveAccessToken(ApiConstants.accessToken!);

        // Update user information in the controller
        nameController.text = responseData['user']['name'];
        emailController.text = responseData['user']['email'];

        // Store user details in GetStorage
        final userDetails = {
          'name': responseData['user']['name'],
          'email': responseData['user']['email'],
          'role': responseData['user']['role'],
        };
        cacheManager.saveUserDetails(userDetails);

        // Get.snackbar('Success', 'Login successful. Welcome, ${responseData['user']['name']}');
      } else if (response.statusCode == 404) {
        throw Exception('User not found');
      } else if (response.statusCode == 401) {
        throw Exception('Invalid password');
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

  void logout() async {
    cacheManager.removeAccessToken();
    cacheManager.removeUserDetails();
    Get.offAll(() => LoginScreen());
  }
}

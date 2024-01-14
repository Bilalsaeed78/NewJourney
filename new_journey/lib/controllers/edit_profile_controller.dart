import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/controllers/api_constants.dart';
import 'package:new_journey/controllers/api_service.dart';
import 'package:new_journey/controllers/controllers.dart';
import 'package:new_journey/local/cache_manager.dart';

class EditProfileController extends GetxController {
  final AuthController authController = Get.find();
  final String baseUrl = ApiConstants.baseUrl;
  final CacheManager cacheManager = CacheManager();
  

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  Future<void> updateUserProfile({
    required String name,
    required String cnic,
    required String phoneNumber,
  }) async {
    try {
      await ApiService().updateUserProfile(

        name: name,
        cnic: cnic,
        phoneNumber: phoneNumber,
        token: cacheManager.getAccessToken() ?? '',
      );

      refreshUserDetail();


      Get.snackbar('Success', 'Profile updated successfully');
    } catch (error) {
      Get.snackbar('Error', 'Failed to update profile: $error');
    }
  }

  Future<void> refreshUserDetail() async {
    try {
      final updatedUserDetails = await ApiService().getUserDetails();
      cacheManager.saveUserDetails(updatedUserDetails);
      authController.update();
    } catch (error) {
      throw Exception('Error updating user details in drawer: $error');
    }
  }
}

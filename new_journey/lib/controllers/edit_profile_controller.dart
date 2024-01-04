import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/controllers/controllers.dart';
import 'package:new_journey/routes/routes.dart';

class EditProfileController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final AuthController authController = AuthController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    return null;
  }

  String? validateCnic(String? value) {
    if (value == null || value.isEmpty) {
      return 'CNIC is required';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }
    return null;
  }

  void updateProfile() {
    if (formKey.currentState!.validate()) {
      // Call the backend API to update the user profile
      // You can use authController.updateUserProfile() or a dedicated API call
      // Make sure to handle the response appropriately
      // For now, let's assume the update is successful
      Get.snackbar('Success', 'Profile updated successfully');

      // Navigate back to the dashboard after profile update
      RouteManager.goToOwnerDashboard();
    }
  }
}

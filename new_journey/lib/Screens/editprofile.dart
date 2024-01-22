import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/Screens/ownerdashboard.dart';
import 'package:new_journey/controllers/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final EditProfileController editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              controller: editProfileController.nameController,
              labelText: 'Name',
              icon: Icons.person,
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              controller: editProfileController.cnicController,
              labelText: 'CNIC',
              icon: Icons.credit_card,
            ),
            SizedBox(height: 16.0),
            _buildTextField(
              controller: editProfileController.phoneNumberController,
              labelText: 'Phone Number',
              icon: Icons.phone,
            ),
            SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await editProfileController.updateUserProfile(
                    name: editProfileController.nameController.text,
                    cnic: editProfileController.cnicController.text,
                    phoneNumber:
                        editProfileController.phoneNumberController.text,
                  );

                  await Future.delayed(const Duration(seconds: 2));

                  Get.offAll(() => OwnerDashboard());
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  primary: Colors.black,
                ),
                child: Text(
                  'Update Profile',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    IconData? icon,
    TextInputType? keyboardType,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: icon != null ? Icon(icon, color: Colors.black) : null,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

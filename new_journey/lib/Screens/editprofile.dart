import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/controllers/edit_profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  final EditProfileController editProfileController = Get.put(EditProfileController());
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: editProfileController.nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: editProfileController.cnicController,
              decoration: InputDecoration(labelText: 'CNIC'),
            ),
            TextField(
              controller: editProfileController.phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            ElevatedButton(
              onPressed: () {
                editProfileController.updateUserProfile(
                  name: editProfileController.nameController.text,
                  cnic: editProfileController.cnicController.text,
                  phoneNumber: editProfileController.phoneNumberController.text,
                );
              },
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}


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
        child: Form(
          key: editProfileController.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: editProfileController.nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => editProfileController.validateName(value),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: editProfileController.cnicController,
                decoration: InputDecoration(labelText: 'CNIC'),
                validator: (value) => editProfileController.validateCnic(value),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: editProfileController.phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) => editProfileController.validatePhoneNumber(value),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => editProfileController.updateProfile(),
                child: Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

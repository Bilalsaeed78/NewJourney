import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/Screens/create_space_category.dart';
import 'package:new_journey/Screens/editprofile.dart';
import 'package:new_journey/controllers/controllers.dart';

class AppDrawer extends StatelessWidget {
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: GetBuilder<AuthController>(builder: (controller) {
        final user = authController.cacheManager.getUserDetails();
        final userRole = user?['role'];

        return ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'User Information',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  if (user != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${user['name']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'Email: ${user['email']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'Role: ${user['role']}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Edit Profile'),
              onTap: () {
                Get.to(() => EditProfileScreen());
              },
            ),
            if (userRole == 'owner') ...[
              ListTile(
                title: const Text('Create Hotel'),
                onTap: () {
                  Get.to(()=> CategoryScreen());// Use the correct method
                },
              ),
              ListTile(
                title: const Text('Delete Hotel'),
                onTap: () {
                  // Navigate to the screen for deleting a hotel
                },
              ),
              ListTile(
                title: const Text('Edit Hotel'),
                onTap: () {
                  // Navigate to the screen for editing a hotel
                },
              ),
            ],
            ListTile(
              title: const Text('Logout'),
              onTap: () {
                authController.logout();
              },
            ),
          ],
        );
      }),
    );
  }
}

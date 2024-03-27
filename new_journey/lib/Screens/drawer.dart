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
        final userRole = user?['role'] ?? '';

        return ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'User Information',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  if (user != null)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage('assets/profilefordrawer.jpg'), // Replace with your image asset
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person, color: Colors.white, size: 16.0),
                                SizedBox(width: 5.0),
                                Text(
                                  'Name: ${user['name'] ?? ''}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.email, color: Colors.white, size: 16.0),
                                SizedBox(width: 5.0),
                                Text(
                                  'Email: ${user['email'] ?? ''}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      Icon(Icons.assignment_ind, color: Colors.white, size: 16.0),
                      SizedBox(width: 5.0),
                      Text(
                        'Role: $userRole',
                        style: TextStyle(
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
              leading: Icon(Icons.edit, color: Colors.black),
              title: const Text('Edit Profile'),
              onTap: () {
                Get.to(() => EditProfileScreen());
              },
            ),
            if (userRole == 'owner') ...[
              ListTile(
                leading: Icon(Icons.hotel, color: Colors.black),
                title: const Text('Create Space'),
                onTap: () {
                  Get.to(() => CategoryScreen());
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.black),
                title: const Text('Delete Space'),
                onTap: () {
                  // Navigate to the screen for deleting a hotel
                },
              ),
              ListTile(
                leading: Icon(Icons.edit, color: Colors.black),
                title: const Text('Edit Space'),
                onTap: () {
                  // Navigate to the screen for editing a hotel
                },
              ),
            ],
            ListTile(
              leading: Icon(Icons.logout, color: Colors.black),
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

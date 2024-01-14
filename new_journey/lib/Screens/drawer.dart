import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/Screens/editprofile.dart';
import 'package:new_journey/Screens/owner_dashboard.dart';
import 'package:new_journey/controllers/controllers.dart';
import 'package:new_journey/controllers/edit_profile_controller.dart';
import 'package:new_journey/routes/routes.dart';

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
              decoration: BoxDecoration(
                color: Colors.red,
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
                  SizedBox(height: 10.0),
                  if (user != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${user['name']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'Email: ${user['email']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'Role: ${user['role']}',
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
              title: Text('Edit Profile'),
              onTap: () {
                Get.to(() => EditProfileScreen());
              },
            ),
            if (userRole == 'owner') ...[
              ListTile(
                title: Text('Create Hotel'),
                onTap: () {
                  Get.to(()=> OwnerrDashboard());
                  // Navigate to the screen for creating a hotel
                },
              ),
              ListTile(
                title: Text('Delete Hotel'),
                onTap: () {
                  // Navigate to the screen for deleting a hotel
                },
              ),
              ListTile(
                title: Text('Edit Hotel'),
                onTap: () {
                  // Navigate to the screen for editing a hotel
                },
              ),
            ],
            ListTile(
              title: Text('Logout'),
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

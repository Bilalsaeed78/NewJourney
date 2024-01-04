// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class OwnerDashboard extends StatelessWidget {
//   final Map<String, dynamic> userDetails;

//   OwnerDashboard(this.userDetails);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Owner Dashboard'),
//       ),
//       drawer: Drawer(
//         child: Column(
//           children: [
//             UserAccountsDrawerHeader(
//               accountName: Text(userDetails['name']),
//               accountEmail: Text(userDetails['email']),
//               currentAccountPicture: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Text(userDetails['name'][0]),
//               ),
//             ),
//             // Add other drawer items as needed
//             ListTile(
//               title: Text('Logout'),
//               onTap: () {
//                 // Implement logout logic
//                 // You can use the AuthController's logout method
//                 // AuthController().logout();
//               },
//             ),
//           ],
//         ),
//       ),
//       // Add the rest of your dashboard content here
//     );
//   }
// }
// owner_dashboard.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_journey/controllers/controllers.dart';
import 'package:new_journey/routes/routes.dart';

class OwnerDashboard extends StatelessWidget {
  final AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    final userDetails = authController.getUserDetails();

    return Scaffold(
      appBar: AppBar(
        title: Text('Owner Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
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
                  if (userDetails != null)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${userDetails['name']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'Email: ${userDetails['email']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          'Role: ${userDetails['role']}',
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
                RouteManager.goToEditProfile();
                // Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Create Hotel'),
              onTap: () {
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
            ListTile(
              title: Text('Logout'),
              onTap: () {
                authController.logout();
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Welcome to the Owner Dashboard'),
      ),
    );
  }
}

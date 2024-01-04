// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_journey/controllers/controllers.dart';

// class OwnerDrawer extends StatelessWidget {
//   final AuthController authController = Get.find<AuthController>();

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Owner',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 FutureBuilder(
//                   future: authController.getUserDetails(),
//                   builder: (context, snapshot) {
//                     if (snapshot.connectionState == ConnectionState.done) {
//                       if (snapshot.hasError) {
//                         return Text(
//                           'Error fetching user details',
//                           style: TextStyle(color: Colors.white),
//                         );
//                       }
//                       final userDetails = snapshot.data as Map<String, dynamic>;
//                       return Text(
//                         'Email: ${userDetails['email']}',
//                         style: TextStyle(color: Colors.white),
//                       );
//                     } else {
//                       return CircularProgressIndicator();
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           ListTile(
//             title: Text('Logout'),
//             onTap: () {
//               authController.logout();
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

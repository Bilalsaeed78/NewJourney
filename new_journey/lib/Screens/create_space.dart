// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_journey/controllers/create_space_controller.dart';
// import 'package:location_picker/location_picker.dart';

// class CreateSpaceScreen extends StatelessWidget {
//   final CreateSpaceController createSpaceController =
//       Get.put(CreateSpaceController());

//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();

//   double? spaceLatitude;
//   double? spaceLongitude;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Create Space"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               _buildTextField(
//                 controller: titleController,
//                 labelText: 'Enter Title',
//               ),
//               _buildTextField(
//                 controller: descriptionController,
//                 labelText: 'Enter Description',
//               ),
//               _buildTextField(
//                 controller: priceController,
//                 labelText: 'Enter Price',
//               ),
//               _buildTextField(
//                 controller: phoneNumberController,
//                 labelText: 'Enter Phone Number',
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   await _selectLocation();
//                 },
//                 child: Text('Select Location'),
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _uploadSpace();
//                 },
//                 child: Text('Upload Space'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: labelText,
//           border: OutlineInputBorder(),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//         ),
//       ),
//     );
//   }



//   Future<void> _uploadSpace() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       final title = titleController.text;
//       final description = descriptionController.text;
//       final price = priceController.text;
//       final phoneNumber = phoneNumberController.text;

//       try {
//         final location = spaceLatitude != null && spaceLongitude != null
//             ? "Lat: $spaceLatitude, Long: $spaceLongitude"
//             : null;

//         await createSpaceController.uploadSpace(
//           title: title,
//           description: description,
//           price: price,
//           location: location,
//           phoneNumber: phoneNumber,
//         );

//         Get.snackbar('Success', 'Space uploaded successfully');
//       } catch (error) {
//         Get.snackbar('Error', 'Failed to upload space: $error');
//       }
//     }
//   }
// }
// // import 'package:flutter/material.dart';
// // import 'package:geolocator/geolocator.dart';
// // import 'package:get/get.dart';
// // import 'package:new_journey/Screens/location_picker.dart';
// // import 'package:new_journey/controllers/ownercontroller.dart';

// // class OwnerDashboard extends StatefulWidget {
// //   const OwnerDashboard({Key? key}) : super(key: key);

// //   @override
// //   _OwnerDashboardState createState() => _OwnerDashboardState();
// // }

// // class _OwnerDashboardState extends State<OwnerDashboard> {
// //   final _formKey = GlobalKey<FormState>();
// //   final TextEditingController titleController = TextEditingController();
// //   final TextEditingController descriptionController = TextEditingController();
// //   final TextEditingController priceController = TextEditingController();
// //   final TextEditingController locationController = TextEditingController();
// //   final TextEditingController phoneNumberController = TextEditingController();
// //   final ownerController = Get.put(OwnerController());

// //   double? ownerLatitude;
// //   double? ownerLongitude;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Owner Dashboard"),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             children: [
// //               _buildTextField(
// //                 controller: titleController,
// //                 labelText: 'Enter Title',
// //               ),
// //               _buildTextField(
// //                 controller: descriptionController,
// //                 labelText: 'Enter Description',
// //               ),
// //               _buildTextField(
// //                 controller: priceController,
// //                 labelText: 'Enter Price',
// //               ),
// //               _buildTextField(
// //                 controller: phoneNumberController,
// //                 labelText: 'Enter Phone Number',
// //               ),
// //               const SizedBox(height: 16),
// //               ElevatedButton(
// //                 onPressed: () async {
// //                   var result = await showDialog(
// //                     context: context,
// //                     builder: (BuildContext context) {
// //                       return MyLocationPickerDialog();
// //                     },
// //                   );
// //                   if (result != null) {
// //                     print(result[0]);
// //                     print(result[1]);
// //                     setState(() {
// //                       ownerLatitude = result[0];
// //                       ownerLongitude = result[1];
// //                     });
// //                     locationController.text =
// //                         "Lat: $ownerLatitude, Long: $ownerLongitude";
// //                   } else {
// //                     print('Dialog closed without a result');
// //                   }
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   primary: Colors.black,
// //                 ),
// //                 child: Container(
// //                   height: 50,
// //                   width: 400,
// //                   child: const Center(
// //                     child: Text(
// //                       "Get Location",
// //                       style: TextStyle(color: Colors.white),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(
// //                 height: 20.0,
// //               ),
// //               ElevatedButton(
// //                 onPressed: () {
// //                   _uploadHotel();
// //                 },
// //                 child: const Text('Upload'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildTextField({
// //     required TextEditingController controller,
// //     required String labelText,
// //   }) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 16.0),
// //       child: TextFormField(
// //         controller: controller,
// //         decoration: InputDecoration(
// //           labelText: labelText,
// //           border: OutlineInputBorder(),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Colors.black),
// //           ),
// //           enabledBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Colors.grey),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> _uploadHotel() async {
// //     if (_formKey.currentState?.validate() ?? false) {
// //       final title = titleController.text;
// //       final description = descriptionController.text;
// //       final price = priceController.text;
// //       final phoneNumber = phoneNumberController.text;

// //       if (ownerLatitude != null && ownerLongitude != null) {
// //         final location = "Lat: $ownerLatitude, Long: $ownerLongitude";

// //         try {
// //           await ownerController.uploadHotel(
// //             title: title,
// //             description: description,
// //             price: price,
// //             location: location,
// //             phoneNumber: phoneNumber,
// //           );

// //           Get.snackbar('Success', 'Hotel uploaded successfully');
// //         } catch (error) {
// //           Get.snackbar('Error', 'Failed to upload hotel: $error');
// //         }
// //       } else {
// //         Get.snackbar('Error', 'Location not selected');
// //       }
// //     }
// //   }

// //     Future<Position?> _getCurrentPosition() async {
// //     try {
// //       final status = await Geolocator.requestPermission();
// //       if (status == LocationPermission.denied) {
// //         return null;
// //       }
// //       final position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high,
// //       );
// //       return position;
// //     } catch (e) {
// //       return null;
// //     }
// // }
// // }
// //   // Future<void> _getCurrentLocation() async {
// //   //   final position = await _getCurrentPosition();
// //   //   if (position != null) {
// //   //     setState(() {
// //   //       ownerLatitude = position.latitude;
// //   //       ownerLongitude = position.longitude;
// //   //       controller.locationController.text =
// //   //           "Lat: $ownerLatitude, Long: $ownerLongitude";
// //   //     });
// //   //   }
// //   // }
// // // }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_journey/controllers/ownercontroller.dart';
// import 'package:new_journey/screens/location_picker.dart';

// class CreateSpace extends StatefulWidget {
//   const CreateSpace({Key? key}) : super(key: key);

//   @override
//   _CreateSpaceState createState() => _CreateSpaceState();
// }

// class _CreateSpaceState extends State<CreateSpace> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final ownerController = Get.put(OwnerController());

//   double? ownerLatitude;
//   double? ownerLongitude;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Owner Dashboard"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               _buildTextField(
//                 controller: titleController,
//                 labelText: 'Enter Title',
//               ),
//               _buildTextField(
//                 controller: descriptionController,
//                 labelText: 'Enter Description',
//               ),
//               _buildTextField(
//                 controller: priceController,
//                 labelText: 'Enter Price',
//               ),
//               _buildTextField(
//                 controller: phoneNumberController,
//                 labelText: 'Enter Phone Number',
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () async {
//                   var result = await showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return MyLocationPickerDialog();
//                     },
//                   );
//                   if (result != null) {
//                     print(result[0]);
//                     print(result[1]);
//                     setState(() {
//                       ownerLatitude = result[0];
//                       ownerLongitude = result[1];
//                     });
//                   } else {
//                     print('Dialog closed without a result');
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.black,
//                 ),
//                 child: Container(
//                   height: 50,
//                   width: 400,
//                   child: const Center(
//                     child: Text(
//                       "Get Location",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20.0,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   _uploadHotel();
//                 },
//                 child: const Text('Upload'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextFormField(
//         controller: controller,
//         decoration: InputDecoration(
//           labelText: labelText,
//           border: OutlineInputBorder(),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.grey),
//           ),
//         ),
//       ),
//     );
//   }
//   Future<void> _uploadHotel() async {
//   if (_formKey.currentState?.validate() ?? false) {
//     final title = titleController.text;
//     final description = descriptionController.text;
//     final price = priceController.text;
//     final phoneNumber = phoneNumberController.text;

//     try {
//       final location = ownerLatitude != null && ownerLongitude != null
//           ? "Lat: $ownerLatitude, Long: $ownerLongitude"
//           : null;

//       await ownerController.uploadHotel(
//         title: title,
//         description: description,
//         price: price,
//         location: location,
//         phoneNumber: phoneNumber,
//       );

//       Get.snackbar('Success', 'Hotel uploaded successfully');
//     } catch (error) {
//       Get.snackbar('Error', 'Failed to upload hotel: $error');
//     }
//   }
// }

//   }
// owner_dashboard.dart
// import 'package:flutter/material.dart';
// import 'package:new_journey/controllers/controllers.dart';

// class OwnerDashboardScreen extends StatelessWidget {
//   final AuthController authController = AuthController();

//   @override
//   Widget build(BuildContext context) {
//     final userDetails = authController.getUserDetails();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Owner Dashboard'),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'User Information',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20.0,
//                     ),
//                   ),
//                   SizedBox(height: 10.0),
//                   if (userDetails != null)
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Name: ${userDetails['name']}',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16.0,
//                           ),
//                         ),
//                         Text(
//                           'Email: ${userDetails['email']}',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16.0,
//                           ),
//                         ),
//                         Text(
//                           'Role: ${userDetails['role']}',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16.0,
//                           ),
//                         ),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//             ListTile(
//               title: Text('Logout'),
//               onTap: () {
//                 authController.logout();
//               },
//             ),
//           ],
//         ),
//       ),
//       body: Center(
//         child: Text('Welcome to the Owner Dashboard'),
//       ),
//     );
//   }
// }

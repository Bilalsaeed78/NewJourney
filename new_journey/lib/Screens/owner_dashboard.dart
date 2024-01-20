// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:new_journey/controllers/ownercontroller.dart';
// import 'package:new_journey/screens/location_picker.dart';

// class CreateSpace extends StatefulWidget {
//   const CreateSpace({Key? key}) : super(key: key);

//   @override
//   _CreateSpace createState() => _CreateSpace();
// }

// class _CreateSpace extends State<CreateSpace> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController titleController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final ownerController = Get.put(CreateSpaceController());

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
// //       Future<Position?> _getCurrentPosition() async {
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
// //   Future<void> _getCurrentLocation() async {
// //     final position = await _getCurrentPosition();
// //     if (position != null) {
// //       setState(() {
// //         ownerLatitude = position.latitude;
// //         ownerLongitude = position.longitude;
// //         controller.locationController.text =
// //             "Lat: $ownerLatitude, Long: $ownerLongitude";
// //       });
// //     }
// //   }


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
// }

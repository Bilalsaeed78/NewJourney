// // create_space_controller.dart
// import 'dart:convert';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:new_journey/controllers/api_constants.dart';

// class CreateSpaceController extends GetxController {
//   final String baseUrl = ApiConstants.baseUrl;

//   Future<void> uploadSpace({
//     required String title,
//     required String description,
//     required String price,
//     String? location,
//     required String phoneNumber,
//   }) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/space'),
//       headers: {
//         'Content-Type': 'application/json',
//       },
//       body: jsonEncode({
//         'title': title,
//         'description': description,
//         'price': price,
//         'location': location,
//         'phoneNumber': phoneNumber,
//       }),
//     );

//     if (response.statusCode == 201) {
//       // Space uploaded successfully
//       print('Space uploaded successfully');
//     } else {
//       // Handle errors
//       throw Exception('Failed to upload space: ${response.body}');
//     }
//   }

//   static createSpace({required String title, required String description, required String price, required String location, required String phoneNumber}) {}
// }

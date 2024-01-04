// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:new_journey/controllers/api_constants.dart';

// class DrawerController extends GetxController {
//   static const String baseUrl = ApiConstants.baseUrl;

//   RxString userName = ''.obs;
//   RxString userEmail = ''.obs;
//   RxString userCnic = ''.obs;
//   RxString userPhoneNumber = ''.obs;
//   RxString userRole = ''.obs;

//   Future<void> getUserDetails(String email, String authToken) async {
//     try {
//       final response = await http.get(
//         Uri.parse('$baseUrl/user/details'),
//         headers: {'Authorization': 'Bearer $authToken'},
//       );

//       if (response.statusCode == 200) {
//         final userJson = json.decode(response.body);

//         userName.value = userJson['name'];
//         userEmail.value = userJson['email'];
//         userCnic.value = userJson['cnic'];
//         userPhoneNumber.value = userJson['phoneNumber'];
//         userRole.value = userJson['role'];
//       } else {
//         throw Exception('Failed to load user details');
//       }
//     } catch (e) {
//       throw Exception('Error: $e');
//     }
//   }
// }
// import 'package:get/get.dart';

// class DrawerController extends GetxController {
//   var userName = "".obs;
//   var userEmail = "".obs;
//   var userRole = "".obs;

//   void setUserDetails({String name, String email, String role}) {
//     userName.value = name;
//     userEmail.value = email;
//     userRole.value = role;
//   }
// }


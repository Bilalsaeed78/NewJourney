import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:new_journey/controllers/api_constants.dart';

class CreateSpaceController extends GetxController {
  final String baseUrl = ApiConstants.baseUrl; // Replace with your API base URL

  Future<void> uploadSpace({
    required String category,
    required String title,
    required String description,
    required String price,
    String? location,
    required String phoneNumber,
    String? additionalField1,
    String? additionalField2,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/$category'), // Use the correct endpoint based on the category
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'title': title,
        'description': description,
        'price': price,
        'location': location,
        'phoneNumber': phoneNumber,
        'additionalField1': additionalField1,
        'additionalField2': additionalField2,
      }),
    );

    if (response.statusCode == 201) {
      print('$category uploaded successfully');
    } else {
      throw Exception('Failed to upload $category: ${response.body}');
    }
  }
}

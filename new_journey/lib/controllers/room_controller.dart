import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:new_journey/controllers/api_constants.dart';

class RoomController extends GetxController {
  final String baseUrl = ApiConstants.baseUrl;

  Future<void> uploadRoom({
    required String title,
    required String description,
    required String price,
    String? location,
    required String phoneNumber,
    required String wifiAvailability,
    required String generatorBackup,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/room'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'title': title,
          'description': description,
          'price': price,
          'location': location,
          'phoneNumber': phoneNumber,
          'wifiAvailability': wifiAvailability,
          'generatorBackup': generatorBackup,
        }),
      );

      if (response.statusCode == 201) {
        print('Room uploaded successfully');
        // You can add any further logic or actions here after successful upload
      } else {
        print("getting some error");
        throw Exception('Failed to upload room: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      print('Error uploading room: $error');
      throw Exception('Failed to upload room: $error');
    }
  }
}

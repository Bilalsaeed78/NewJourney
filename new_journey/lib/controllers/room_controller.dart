import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:new_journey/controllers/api_constants.dart';
import 'package:new_journey/models/roommodels.dart';

class RoomController extends GetxController {
  final String baseUrl = ApiConstants.baseUrl;

  RxList<Room> rooms = <Room>[].obs;


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

    Future<void> fetchRooms() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/room'));

    if (response.statusCode == 200) {
      final dynamic data = json.decode(response.body);

      if (data != null && data is List<dynamic>) {
        rooms.assignAll(data.map((json) {
          try {
            return Room.fromJson(json);
          } catch (e) {
            print('Error parsing room data: $e');
            throw Exception('Error parsing room data: $e');
          }
        }).toList());
      } else {
        print('Failed to load rooms: Invalid data format');
        throw Exception('Failed to load rooms: Invalid data format');
      }
    } else {
      print('Failed to load rooms: ${response.statusCode} - ${response.body}');
      throw Exception('Failed to load rooms: ${response.statusCode} - ${response.body}');
    }
  } catch (error) {
    print('Error fetching rooms: $error');
    throw Exception('Error fetching rooms: $error');
  }
}
    }

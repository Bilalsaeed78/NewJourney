import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_journey/controllers/api_constants.dart';
import 'package:new_journey/local/cache_manager.dart';

class ApiService {
  final String baseUrl = ApiConstants.baseUrl;

  Future<void> updateUserProfile({
    required String name,
    required String cnic,
    required String phoneNumber,
    required String token,
  }) async {
    final url = Uri.parse('$baseUrl/user/updateProfile');

    try {
      final response = await http.put(
        url,
        body: jsonEncode({
          'name': name,
          'cnic': cnic,
          'phoneNumber': phoneNumber,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        encoding: Encoding.getByName('utf-8'),
      );

      if (response.statusCode == 200) {
        // Profile updated successfully
      } else {
        print(response.body);
        print(ApiConstants.accessToken);
        print(token);
        throw Exception('status code is not 200 Failed to update profile');
      }
    } 
    catch (e) {
      throw Exception('Failed to update profile: $e');
    }
  }

  Future<Map<String, dynamic>> getUserDetails() async {
    final url = Uri.parse('$baseUrl/user/details');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${ApiConstants.accessToken}',
        },
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
      
        throw Exception('Failed to get user details');
      }
    } catch (e) {
      throw Exception('Failed to get user details: $e');
    }
  }
}

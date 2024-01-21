import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:new_journey/controllers/api_constants.dart';
import 'package:new_journey/models/officemodels.dart';

class OfficeController extends GetxController {
  final String baseUrl = ApiConstants.baseUrl;

  RxList<Office> offices = <Office>[].obs;

  Future<void> uploadOffice({
    required String title,
    required String description,
    required String price,
    String? location,
    required String phoneNumber,
    required String wifiAvailability,
    required String acAvailability,
    required String cabinsAvailability,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/office'),
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
          'acAvailability': acAvailability,
          'cabinsAvailability': cabinsAvailability,
        }),
      );

      if (response.statusCode == 201) {
        print('Office uploaded successfully');
        // You can add any further logic or actions here after successful upload
      } else {
        print("getting some error");
        throw Exception(
            'Failed to upload office: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      print('Error uploading office: $error');
      throw Exception('Failed to upload office: $error');
    }
  }

  Future<void> fetchOffices() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/office'));

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        if (data != null && data is List<dynamic>) {
          offices.assignAll(data.map((json) {
            try {
              return Office.fromJson(json);
            } catch (e) {
              print('Error parsing office data: $e');
              throw Exception('Error parsing office data: $e');
            }
          }).toList());
        } else {
          print('Failed to load offices: Invalid data format');
          throw Exception('Failed to load offices: Invalid data format');
        }
      } else {
        print(
            'Failed to load offices: ${response.statusCode} - ${response.body}');
        throw Exception(
            'Failed to load offices: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      print('Error fetching offices: $error');
      throw Exception('Error fetching offices: $error');
    }
  }
}

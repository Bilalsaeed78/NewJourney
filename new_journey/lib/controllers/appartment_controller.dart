import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:new_journey/controllers/api_constants.dart';
import 'package:new_journey/models/aparmentmodels.dart';

class ApartmentController extends GetxController {
  final String baseUrl = ApiConstants.baseUrl;

  RxList<Apartment> apartments = <Apartment>[].obs;
  List<Apartment> originalApartments = []; // Add this line to store original data

  void updateApartments(List<Apartment> updatedApartments) {
    apartments.clear();
    apartments.addAll(updatedApartments);
  }

  Future<void> uploadApartment({
    required String title,
    required String description,
    required String price,
    String? location,
    required String phoneNumber,
    required String floor,
    required String rooms,
    required String liftAvailability,
    required String generatorBackup,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/apartment'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'title': title,
          'description': description,
          'price': price,
          'location': location,
          'phoneNumber': phoneNumber,
          'floor': floor,
          'rooms': rooms,
          'liftAvailability': liftAvailability,
          'generatorBackup': generatorBackup,
        }),
      );

      if (response.statusCode == 201) {
        print('Apartment uploaded successfully');
        // You can add any further logic or actions here after successful upload
      } else {
        print("getting some error");
        throw Exception(
            'Failed to upload apartment: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      print('Error uploading apartment: $error');
      throw Exception('Failed to upload apartment: $error');
    }
  }

  Future<void> fetchApartments() async {
      originalApartments.clear(); 
    try {
      final response = await http.get(Uri.parse('$baseUrl/apartment'));

      if (response.statusCode == 200) {
        final dynamic data = json.decode(response.body);

        if (data != null && data is List<dynamic>) {
          apartments.assignAll(data.map((json) {
            try {
              return Apartment.fromJson(json);
            } catch (e) {
              print('Error parsing apartment data: $e');
              throw Exception('Error parsing apartment data: $e');
            }
          }).toList());
                            originalApartments.addAll(apartments);

        } else {
          print('Failed to load apartments: Invalid data format');
          throw Exception('Failed to load apartments: Invalid data format');
        }
      } else {
        print(
            'Failed to load apartments: ${response.statusCode} - ${response.body}');
        throw Exception(
            'Failed to load apartments: ${response.statusCode} - ${response.body}');
      }
    } catch (error) {
      print('Error fetching apartments: $error');
      throw Exception('Error fetching apartments: $error');
    }
  }
}

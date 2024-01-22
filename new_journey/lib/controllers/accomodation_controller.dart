// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class AccommodationController {
//   static Future<List<SearchResult>> searchAccommodations(String query) async {
//     final apiUrl = 'http://your-backend-url/search'; // Replace with your actual backend search API URL
//     final response = await http.get(Uri.parse(apiUrl), queryParameters: {'query': query});

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       final List<SearchResult> searchResults = data.map<SearchResult>((item) => SearchResult.fromJson(item)).toList();
//       return searchResults;
//     } else {
//       throw Exception('Failed to load search results');
//     }
//   }
// }

// class SearchResult {
//   final String title;
//   final String description;

//   SearchResult({required this.title, required this.description});

//   factory SearchResult.fromJson(Map<String, dynamic> json) {
//     return SearchResult(
//       title: json['title'] ?? '',
//       description: json['description'] ?? '',
//       // Parse other fields as needed
//     );
//   }
// }

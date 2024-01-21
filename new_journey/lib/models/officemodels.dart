class Office {
  final String id;
  final String title;
  final String description;
  final String price;
  final String? location;
  final String phoneNumber;
  final String wifiAvailability;
  final String acAvailability;
  final String cabinsAvailability;

  Office({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.location,
    required this.phoneNumber,
    required this.wifiAvailability,
    required this.acAvailability,
    required this.cabinsAvailability,
  });

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      location: json['location'],
      phoneNumber: json['phoneNumber'] ?? '',
      wifiAvailability: json['wifiAvailability'] ?? '',
      acAvailability: json['acAvailability'] ?? '',
      cabinsAvailability: json['cabinsAvailability'] ?? '',
    );
  }
}

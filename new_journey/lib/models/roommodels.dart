class Room {
  final String id; // Add id field
  final String title;
  final String description;
  final String price;
  final String location;
  final String wifiAvailability;
  final String generatorBackup;

  Room({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.wifiAvailability,
    required this.generatorBackup,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['_id'] ?? '', // Provide a default value if '_id' is null
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      location: json['location'] ?? '',
      wifiAvailability: json['wifiAvailability'] ?? '',
      generatorBackup: json['generatorBackup'] ?? '',
    );
  }
}

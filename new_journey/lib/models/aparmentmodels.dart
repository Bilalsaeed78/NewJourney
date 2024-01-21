class Apartment {
  final String id;
  final String title;
  final String description;
  final String price;
  final String? location;
  final String phoneNumber;
  final String floor;
  final String rooms;
  final String liftAvailability;
  final String generatorBackup;

  Apartment({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.location,
    required this.phoneNumber,
    required this.floor,
    required this.rooms,
    required this.liftAvailability,
    required this.generatorBackup,
  });

  factory Apartment.fromJson(Map<String, dynamic> json) {
    return Apartment(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      location: json['location'],
      phoneNumber: json['phoneNumber'] ?? '',
      floor: json['floor'] ?? '',
      rooms: json['rooms'] ?? '',
      liftAvailability: json['liftAvailability'] ?? '',
      generatorBackup: json['generatorBackup'] ?? '',
    );
  }
}

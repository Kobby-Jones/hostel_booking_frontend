class Room {
  final String id;
  final String roomNumber;
  final String roomType;
  final int capacity;
  final String pricePerNight;
  final String pricePerMonth;
  final bool isAvailable;

  Room({
    required this.id,
    required this.roomNumber,
    required this.roomType,
    required this.capacity,
    required this.pricePerNight,
    required this.pricePerMonth,
    required this.isAvailable,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json["id"] as String,
      roomNumber: json["roomNumber"] as String,
      roomType: json["roomType"] as String,
      capacity: json["capacity"] as int,
      pricePerNight: json["pricePerNight"] as String,
      pricePerMonth: json["pricePerMonth"] as String,
      isAvailable: json["isAvailable"] as bool,
    );
  }
}

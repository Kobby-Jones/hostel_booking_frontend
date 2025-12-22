class Booking {
  final String id;
  final String status;
  final String checkInDate;
  final String checkOutDate;

  Booking({
    required this.id,
    required this.status,
    required this.checkInDate,
    required this.checkOutDate,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json["id"] as String,
      status: json["status"] as String,
      checkInDate: json["checkInDate"] as String,
      checkOutDate: json["checkOutDate"] as String,
    );
  }
}

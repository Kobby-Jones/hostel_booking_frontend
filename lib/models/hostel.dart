import "owner.dart";
import "room.dart";
import "hostel_image.dart";

class Hostel {
  final String id;
  final String name;
  final String description;
  final String address;
  final String city;
  final String state;
  final String country;
  final double latitude;
  final double longitude;
  final double distanceFromCampus;
  final String status;
  final bool isActive;
  final Owner owner;
  final List<Room> rooms;
  final List<HostelImage> images;

  Hostel({
    required this.id,
    required this.name,
    required this.description,
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.distanceFromCampus,
    required this.status,
    required this.isActive,
    required this.owner,
    required this.rooms,
    required this.images,
  });

  factory Hostel.fromJson(Map<String, dynamic> json) {
    return Hostel(
      id: json["id"] as String,
      name: json["name"] as String,
      description: json["description"] as String,
      address: json["address"] as String,
      city: json["city"] as String,
      state: json["state"] as String,
      country: json["country"] as String,
      latitude: (json["latitude"] as num).toDouble(),
      longitude: (json["longitude"] as num).toDouble(),
      distanceFromCampus:
          (json["distanceFromCampus"] as num).toDouble(),
      status: json["status"] as String,
      isActive: json["isActive"] as bool,
      owner: Owner.fromJson(json["owner"]),
      rooms: (json["rooms"] as List)
          .map((e) => Room.fromJson(e))
          .toList(),
      images: (json["images"] as List)
          .map((e) => HostelImage.fromJson(e))
          .toList(),
    );
  }
}

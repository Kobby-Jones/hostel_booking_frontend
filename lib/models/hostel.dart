import 'package:freezed_annotation/freezed_annotation.dart';
import 'owner.dart';
import 'room.dart';
import 'hostel_image.dart';

part 'hostel.freezed.dart';
part 'hostel.g.dart';

@freezed
abstract class Hostel with _$Hostel {
  const Hostel._();

  const factory Hostel({
    required String id,
    required String name,
    required String description,
    required String address,
    required String city,
    required String state,
    @Default("Ghana") String country,
    double? latitude,
    double? longitude,
    double? distanceFromCampus,
    required String contactPhone,
    String? contactEmail,
    @Default([]) List<String> amenities,
    String? rules,
    String? checkInTime,
    String? checkOutTime,
    required String status,
    @Default(true) bool isActive,
    required Owner owner,
    @Default([]) List<Room> rooms,
    @Default([]) List<HostelImage> images,
  }) = _Hostel;

  factory Hostel.fromJson(Map<String, dynamic> json) => _$HostelFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hostel_booking/models/hostel.dart';
import '../core/json_converters.dart'; // Import the converter

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
abstract class Room with _$Room {
  const Room._();

  const factory Room({
    required String id,
    required String roomNumber,
    @Default("Standard Room") String title, // Use default to prevent null crash
    String? description,
    required String roomType,
    required int capacity,
    @DoubleConverter() required double pricePerNight, // Safe Decimal parsing
    @DoubleConverter() double? pricePerMonth,
    int? floor,
    double? size,
    @Default([]) List<String> amenities,
    @Default(true) bool isAvailable,
    Hostel? hostel,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
import 'package:freezed_annotation/freezed_annotation.dart';

part 'room.freezed.dart';
part 'room.g.dart';

@freezed
abstract class Room with _$Room {
  const Room._();

  const factory Room({
    required String id,
    required String roomNumber,
    required String title,
    String? description,
    required String roomType,
    required int capacity,
    required double pricePerNight,
    double? pricePerMonth,
    int? floor,
    double? size,
    @Default([]) List<String> amenities,
    @Default(true) bool isAvailable,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
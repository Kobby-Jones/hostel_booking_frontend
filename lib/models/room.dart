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
    String? description, // Prisma: String?
    required String roomType,
    required int capacity,
    required double pricePerNight, // Prisma: Decimal
    double? pricePerMonth, // Prisma: Decimal?
    int? floor, // Prisma: Int?
    double? size, // Prisma: Float?
    @Default([]) List<String> amenities, // Prisma: String[]
    @Default(true) bool isAvailable,
  }) = _Room;

  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}
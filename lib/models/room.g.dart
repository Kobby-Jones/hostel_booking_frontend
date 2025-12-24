// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
  id: json['id'] as String,
  roomNumber: json['roomNumber'] as String,
  title: json['title'] as String? ?? "Standard Room",
  description: json['description'] as String?,
  roomType: json['roomType'] as String,
  capacity: (json['capacity'] as num).toInt(),
  pricePerNight: const DoubleConverter().fromJson(json['pricePerNight']),
  pricePerMonth: const DoubleConverter().fromJson(json['pricePerMonth']),
  floor: (json['floor'] as num?)?.toInt(),
  size: (json['size'] as num?)?.toDouble(),
  amenities:
      (json['amenities'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  isAvailable: json['isAvailable'] as bool? ?? true,
  hostel: json['hostel'] == null
      ? null
      : Hostel.fromJson(json['hostel'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
  'id': instance.id,
  'roomNumber': instance.roomNumber,
  'title': instance.title,
  'description': instance.description,
  'roomType': instance.roomType,
  'capacity': instance.capacity,
  'pricePerNight': const DoubleConverter().toJson(instance.pricePerNight),
  'pricePerMonth': _$JsonConverterToJson<dynamic, double>(
    instance.pricePerMonth,
    const DoubleConverter().toJson,
  ),
  'floor': instance.floor,
  'size': instance.size,
  'amenities': instance.amenities,
  'isAvailable': instance.isAvailable,
  'hostel': instance.hostel,
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);

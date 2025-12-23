// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Room _$RoomFromJson(Map<String, dynamic> json) => _Room(
  id: json['id'] as String,
  roomNumber: json['roomNumber'] as String,
  title: json['title'] as String,
  description: json['description'] as String?,
  roomType: json['roomType'] as String,
  capacity: (json['capacity'] as num).toInt(),
  pricePerNight: (json['pricePerNight'] as num).toDouble(),
  pricePerMonth: (json['pricePerMonth'] as num?)?.toDouble(),
  floor: (json['floor'] as num?)?.toInt(),
  size: (json['size'] as num?)?.toDouble(),
  amenities:
      (json['amenities'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  isAvailable: json['isAvailable'] as bool? ?? true,
);

Map<String, dynamic> _$RoomToJson(_Room instance) => <String, dynamic>{
  'id': instance.id,
  'roomNumber': instance.roomNumber,
  'title': instance.title,
  'description': instance.description,
  'roomType': instance.roomType,
  'capacity': instance.capacity,
  'pricePerNight': instance.pricePerNight,
  'pricePerMonth': instance.pricePerMonth,
  'floor': instance.floor,
  'size': instance.size,
  'amenities': instance.amenities,
  'isAvailable': instance.isAvailable,
};

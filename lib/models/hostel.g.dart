// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hostel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Hostel _$HostelFromJson(Map<String, dynamic> json) => _Hostel(
  id: json['id'] as String,
  name: json['name'] as String,
  description: json['description'] as String,
  address: json['address'] as String,
  city: json['city'] as String,
  state: json['state'] as String,
  country: json['country'] as String? ?? "Ghana",
  latitude: (json['latitude'] as num?)?.toDouble(),
  longitude: (json['longitude'] as num?)?.toDouble(),
  distanceFromCampus: (json['distanceFromCampus'] as num?)?.toDouble(),
  contactPhone: json['contactPhone'] as String,
  contactEmail: json['contactEmail'] as String?,
  amenities:
      (json['amenities'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  rules: json['rules'] as String?,
  checkInTime: json['checkInTime'] as String?,
  checkOutTime: json['checkOutTime'] as String?,
  status: json['status'] as String,
  isActive: json['isActive'] as bool? ?? true,
  owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
  rooms:
      (json['rooms'] as List<dynamic>?)
          ?.map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  images:
      (json['images'] as List<dynamic>?)
          ?.map((e) => HostelImage.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$HostelToJson(_Hostel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'address': instance.address,
  'city': instance.city,
  'state': instance.state,
  'country': instance.country,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'distanceFromCampus': instance.distanceFromCampus,
  'contactPhone': instance.contactPhone,
  'contactEmail': instance.contactEmail,
  'amenities': instance.amenities,
  'rules': instance.rules,
  'checkInTime': instance.checkInTime,
  'checkOutTime': instance.checkOutTime,
  'status': instance.status,
  'isActive': instance.isActive,
  'owner': instance.owner,
  'rooms': instance.rooms,
  'images': instance.images,
};

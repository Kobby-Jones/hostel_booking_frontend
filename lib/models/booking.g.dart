// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Booking _$BookingFromJson(Map<String, dynamic> json) => _Booking(
  id: json['id'] as String,
  bookingCode: json['bookingCode'] as String?,
  status: json['status'] as String,
  checkInDate: DateTime.parse(json['checkInDate'] as String),
  checkOutDate: DateTime.parse(json['checkOutDate'] as String),
  numberOfNights: (json['numberOfNights'] as num).toInt(),
  numberOfGuests: (json['numberOfGuests'] as num).toInt(),
  totalAmount: const DoubleConverter().fromJson(json['totalAmount']),
  specialRequests: json['specialRequests'] as String?,
  room: json['room'] == null
      ? null
      : Room.fromJson(json['room'] as Map<String, dynamic>),
);

Map<String, dynamic> _$BookingToJson(_Booking instance) => <String, dynamic>{
  'id': instance.id,
  'bookingCode': instance.bookingCode,
  'status': instance.status,
  'checkInDate': instance.checkInDate.toIso8601String(),
  'checkOutDate': instance.checkOutDate.toIso8601String(),
  'numberOfNights': instance.numberOfNights,
  'numberOfGuests': instance.numberOfGuests,
  'totalAmount': const DoubleConverter().toJson(instance.totalAmount),
  'specialRequests': instance.specialRequests,
  'room': instance.room,
};

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
  numberOfGuests: (json['numberOfGuests'] as num).toInt(),
  studentPhone: json['studentPhone'] as String?,
  specialRequests: json['specialRequests'] as String?,
  totalAmount: (json['totalAmount'] as num).toDouble(),
);

Map<String, dynamic> _$BookingToJson(_Booking instance) => <String, dynamic>{
  'id': instance.id,
  'bookingCode': instance.bookingCode,
  'status': instance.status,
  'checkInDate': instance.checkInDate.toIso8601String(),
  'checkOutDate': instance.checkOutDate.toIso8601String(),
  'numberOfGuests': instance.numberOfGuests,
  'studentPhone': instance.studentPhone,
  'specialRequests': instance.specialRequests,
  'totalAmount': instance.totalAmount,
};

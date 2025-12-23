import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
abstract class Booking with _$Booking {
  const Booking._();

  const factory Booking({
    required String id,
    String? bookingCode,
    required String status,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int numberOfGuests,
    String? studentPhone,
    String? specialRequests,
    required double totalAmount,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
}
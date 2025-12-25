import 'package:freezed_annotation/freezed_annotation.dart';
import '../core/json_converters.dart';
import 'room.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@Freezed(toJson: true)
@JsonSerializable(explicitToJson: true)
abstract class Booking with _$Booking {
  const Booking._();

  const factory Booking({
    required String id,
    String? bookingCode,
    required String status,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int numberOfNights,
    required int numberOfGuests,
    @DoubleConverter() required double totalAmount,
    String? specialRequests,
    Room? room, 
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
}
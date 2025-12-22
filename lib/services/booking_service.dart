import "package:dio/dio.dart";
import "api/api_client.dart";
import "../models/booking.dart";


class BookingService {
  final Dio _dio = ApiClient.instance;

  Future<String> createBooking({
    required String roomId,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int numberOfGuests,
  }) async {
    final response = await _dio.post(
      "/bookings",
      data: {
        "roomId": roomId,
        "checkInDate": checkInDate.toUtc().toIso8601String(),
        "checkOutDate": checkOutDate.toUtc().toIso8601String(),
        "numberOfGuests": numberOfGuests,
      },
    );

    return response.data["data"]["booking"]["id"] as String;  // Return booking ID
  }

Future<List<Booking>> getMyBookings() async {
  final response = await _dio.get("/bookings");

  return (response.data["data"] as List)
      .map((e) => Booking.fromJson(e))
      .toList();
}
}




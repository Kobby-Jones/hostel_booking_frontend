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
    return response.data["data"]["booking"]["id"] as String;
  }

  Future<List<Booking>> getMyBookings() async {
    try {
      final response = await _dio.get("/bookings");
      
      final List? rawBookings = response.data["data"]["bookings"];
      
      if (rawBookings == null || rawBookings.isEmpty) return [];

      // Parse bookings with better error handling
      return rawBookings
          .map((e) {
            try {
              return Booking.fromJson(e as Map<String, dynamic>);
            } catch (e) {
              // Log but don't stop the entire list
              print('Warning: Skipped malformed booking: $e');
              return null;
            }
          })
          .whereType<Booking>() // Filter out nulls
          .toList();
          
    } on DioException catch (e) {
      throw Exception("Failed to load bookings: ${e.message}");
    } catch (e) {
      throw Exception("Failed to load bookings: $e");
    }
  }

  Future<void> cancelBooking(String bookingId, {String? reason}) async {
    await _dio.post(
      "/bookings/$bookingId/cancel",
      data: {"reason": reason},
    );
  }
}
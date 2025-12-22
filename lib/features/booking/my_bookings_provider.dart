import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hostel_booking/features/booking/booking_provider.dart";
import "../../models/booking.dart";

final myBookingsProvider =
    FutureProvider<List<Booking>>((ref) async {
  return ref.read(bookingServiceProvider).getMyBookings();
});

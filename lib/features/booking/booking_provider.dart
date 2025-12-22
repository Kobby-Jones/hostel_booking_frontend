import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/legacy.dart";
import "../../services/booking_service.dart";
import "../../services/payment_service.dart";

final bookingServiceProvider = Provider<BookingService>((ref) {
  return BookingService();
});

final paymentServiceProvider = Provider<PaymentService>((ref) {
  return PaymentService(ref);
});

final bookingLoadingProvider = StateProvider<bool>((ref) => false);

// persist bookingId
final activeBookingIdProvider = StateProvider<String?>((ref) => null);

import "package:go_router/go_router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hostel_booking/core/providers.dart";
import "package:hostel_booking/features/booking/booking_result_screen.dart";
import "package:hostel_booking/features/booking/my_bookings_screen.dart";

import "../features/auth/auth_controller.dart";
import "../features/auth/login_screen.dart";
import "../features/hostels/hostel_list_screen.dart";
import "../features/hostels/hostel_detail_screen.dart";
import "../features/booking/booking_intent_screen.dart";

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: "/hostels",
    redirect: (context, state) {
      final isLoggingIn = state.uri.path == "/login";
      final isBookingRoute = state.uri.path.startsWith("/booking");

      if (authState != AuthState.authenticated &&
          isBookingRoute &&
          !isLoggingIn) {
        return "/login?redirect=${state.uri.path}";
      }

      if (authState == AuthState.authenticated && isLoggingIn) {
        return state.uri.queryParameters["redirect"] ?? "/hostels";
      }

      return null;
    },
    routes: [
      GoRoute(
        path: "/hostels",
        builder: (context, _) => const HostelListScreen(),
      ),
      GoRoute(
        path: "/hostels/:id",
        builder: (context, state) =>
            HostelDetailScreen(hostelId: state.pathParameters["id"]!),
      ),
      GoRoute(
        path: "/booking/:roomId",
        builder: (context, state) =>
            BookingIntentScreen(roomId: state.pathParameters["roomId"]!),
      ),
      GoRoute(
        path: "/login",
        builder: (context, state) => LoginScreen(
          redirectTo: state.uri.queryParameters["redirect"],
        ),
      ),
      GoRoute(
  path: "/booking-result",
  builder: (context, state) {
    final success =
        state.uri.queryParameters["success"] == "true";
    return BookingResultScreen(success: success);
  },
),
GoRoute(
  path: "/bookings",
  builder: (context, _) => const MyBookingsScreen(),
),

    ],
  );
});

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hostel_booking/core/providers.dart";
import "package:hostel_booking/features/owner/create_hostel_screen.dart";
import "../features/auth/auth_controller.dart";
import "../features/auth/login_screen.dart";
import "../features/hostels/hostel_list_screen.dart";
import "../features/hostels/hostel_detail_screen.dart";
import "../features/booking/booking_intent_screen.dart";
import "../features/booking/booking_result_screen.dart";
import "../features/booking/my_bookings_screen.dart";
import "../features/payment/payment_result_screen.dart";
import "../features/navigation/main_wrapper.dart"; // Import the UI shell

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/hostels",
    redirect: (context, state) {
      final isLoggingIn = state.uri.path == "/login";
      final isBookingRoute = state.uri.path.startsWith("/booking");

      if (authState != AuthState.authenticated && isBookingRoute && !isLoggingIn) {
        return "/login?redirect=${state.uri.path}";
      }
      if (authState == AuthState.authenticated && isLoggingIn) {
        return state.uri.queryParameters["redirect"] ?? "/hostels";
      }
      return null;
    },
    routes: [
      // THE SHELL: This contains the Bottom Navigation Bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) => MainWrapper(navigationShell: navigationShell),
        branches: [
          // TAB 1: DISCOVER
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/hostels",
                builder: (context, _) => const HostelListScreen(),
              ),
            ],
          ),
          // TAB 2: BOOKINGS
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/bookings",
                builder: (context, _) => const MyBookingsScreen(),
              ),
            ],
          ),
          // TAB 3: PROFILE
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/profile",
                builder: (context, _) => const Scaffold(body: Center(child: Text("Profile Settings"))),
              ),
            ],
          ),
        ],
      ),

      // FOCUS SCREENS: These hide the bottom bar
      GoRoute(
        path: "/hostels/:id",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => HostelDetailScreen(hostelId: state.pathParameters["id"]!),
      ),
      GoRoute(
        path: "/booking/:roomId",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => BookingIntentScreen(roomId: state.pathParameters["roomId"]!),
      ),
      GoRoute(
        path: "/login",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => LoginScreen(redirectTo: state.uri.queryParameters["redirect"]),
      ),
      GoRoute(
        path: "/booking-result",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => BookingResultScreen(success: state.uri.queryParameters["success"] == "true"),
      ),
      GoRoute(
        path: "/payment-result",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => PaymentResultScreen(reference: state.uri.queryParameters["reference"] ?? ""),
      ),
    GoRoute(
      path: "/owner/create-hostel",
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => const CreateHostelScreen(),
    ),
        ],
  );
});
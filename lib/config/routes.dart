// lib/config/routes.dart
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hostel_booking/features/profile/profile_screen.dart";
import "../core/providers.dart";
import "../features/auth/auth_controller.dart";
import "../features/auth/login_screen.dart";
import "../features/home/home_screen.dart";
import "../features/hostels/hostel_list_screen.dart";
import "../features/hostels/hostel_detail_screen.dart";
import "../features/booking/booking_intent_screen.dart";
import "../features/booking/booking_result_screen.dart";
import "../features/booking/my_bookings_screen.dart";
import "../features/payment/payment_result_screen.dart";
import "../features/navigation/main_wrapper.dart";
import "../features/owner/create_hostel_screen.dart";
import "../features/owner/owner_dashboard_screen.dart";

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: "/",
    redirect: (context, state) {
      final isLoggingIn = state.uri.path == "/login";
      final isHome = state.uri.path == "/";
      final isBookingRoute = state.uri.path.startsWith("/booking");

      // Redirect authenticated users away from login/home
      if (authState == AuthState.authenticated && (isLoggingIn || isHome)) {
        return "/hostels";
      }

      // Require auth for booking routes
      if (authState != AuthState.authenticated &&
          isBookingRoute &&
          !isLoggingIn) {
        return "/login?redirect=${state.uri.path}";
      }

      return null;
    },
    routes: [
      // LANDING/HOME SCREEN
      GoRoute(
        path: "/",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, _) => const HomeScreen(),
      ),

      // AUTHENTICATION
      GoRoute(
        path: "/login",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => LoginScreen(
          redirectTo: state.uri.queryParameters["redirect"],
        ),
      ),

      // THE SHELL: Bottom Navigation Bar
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            MainWrapper(navigationShell: navigationShell),
        branches: [
          // TAB 1: DISCOVER/EXPLORE
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

          // TAB 3: FAVORITES (Placeholder for now)
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/favorites",
                builder: (context, _) => const Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Favorites",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Save hostels you love here",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          // TAB 4: PROFILE
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: "/profile",
                builder: (context, _) => const ProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // FOCUS SCREENS (Hide bottom bar)
      GoRoute(
        path: "/hostels/:id",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) =>
            HostelDetailScreen(hostelId: state.pathParameters["id"]!),
      ),

      GoRoute(
        path: "/booking/:roomId",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) =>
            BookingIntentScreen(roomId: state.pathParameters["roomId"]!),
      ),

      GoRoute(
        path: "/booking-result",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => BookingResultScreen(
          success: state.uri.queryParameters["success"] == "true",
        ),
      ),

      GoRoute(
        path: "/payment-result",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => PaymentResultScreen(
          reference: state.uri.queryParameters["reference"] ?? "",
        ),
      ),

      // OWNER ROUTES
      GoRoute(
        path: "/owner/create-hostel",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const CreateHostelScreen(),
      ),

      GoRoute(
        path: "/owner/hostels",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const OwnerDashboardScreen(),
      ),

      // PLACEHOLDER ROUTES
      GoRoute(
        path: "/profile/edit",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, _) => Scaffold(
          appBar: AppBar(title: const Text("Edit Profile")),
          body: const Center(child: Text("Edit Profile Screen")),
        ),
      ),

      GoRoute(
        path: "/profile/security",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, _) => Scaffold(
          appBar: AppBar(title: const Text("Security")),
          body: const Center(child: Text("Security Screen")),
        ),
      ),

      GoRoute(
        path: "/profile/notifications",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, _) => Scaffold(
          appBar: AppBar(title: const Text("Notifications")),
          body: const Center(child: Text("Notifications Screen")),
        ),
      ),

      GoRoute(
        path: "/help",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, _) => Scaffold(
          appBar: AppBar(title: const Text("Help Center")),
          body: const Center(child: Text("Help Center")),
        ),
      ),

      GoRoute(
        path: "/about",
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, _) => Scaffold(
          appBar: AppBar(title: const Text("About")),
          body: const Center(child: Text("About Screen")),
        ),
      ),
    ],
  );
});
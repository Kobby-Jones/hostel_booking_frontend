// lib/features/navigation/main_wrapper.dart
// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/legacy.dart";
import "package:go_router/go_router.dart";
import "package:hostel_booking/core/providers.dart";
import "../../config/theme.dart";

// Add this provider to track user role
final userRoleProvider = StateProvider<String?>((ref) => null);

class MainWrapper extends ConsumerStatefulWidget {
  final StatefulNavigationShell navigationShell;
  const MainWrapper({super.key, required this.navigationShell});

  @override
  ConsumerState<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends ConsumerState<MainWrapper> {
  String? _userRole;

  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }

  Future<void> _loadUserRole() async {
    try {
      // Get user profile to determine role
      final token = await ref.read(secureStorageProvider).read(key: "access_token");
      if (token != null) {
        // TODO: Fetch user profile from API to get actual role
        // For now, we'll default to STUDENT
        setState(() {
          _userRole = 'STUDENT';
        });
        ref.read(userRoleProvider.notifier).state = 'STUDENT';
      }
    } catch (e) {
      setState(() {
        _userRole = 'STUDENT';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Default to STUDENT if role not loaded yet
    final isOwner = _userRole == 'OWNER';
    
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: NavigationBar(
          selectedIndex: widget.navigationShell.currentIndex,
          onDestinationSelected: (index) => widget.navigationShell.goBranch(index),
          height: 72,
          backgroundColor: Colors.white,
          indicatorColor: AppTheme.primaryColor.withOpacity(0.15),
          elevation: 0,
          destinations: isOwner
              ? const [
                  NavigationDestination(
                    icon: Icon(Icons.dashboard_outlined),
                    selectedIcon: Icon(Icons.dashboard_rounded),
                    label: "Dashboard",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.business_outlined),
                    selectedIcon: Icon(Icons.business_rounded),
                    label: "My Hostels",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.bar_chart_outlined),
                    selectedIcon: Icon(Icons.bar_chart_rounded),
                    label: "Analytics",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline_rounded),
                    selectedIcon: Icon(Icons.person_rounded),
                    label: "Profile",
                  ),
                ]
              : const [
                  NavigationDestination(
                    icon: Icon(Icons.explore_outlined),
                    selectedIcon: Icon(Icons.explore_rounded),
                    label: "Explore",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.bookmark_border_rounded),
                    selectedIcon: Icon(Icons.bookmark_rounded),
                    label: "Bookings",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.favorite_border_rounded),
                    selectedIcon: Icon(Icons.favorite_rounded),
                    label: "Favorites",
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.person_outline_rounded),
                    selectedIcon: Icon(Icons.person_rounded),
                    label: "Profile",
                  ),
                ],
        ),
      ),
      floatingActionButton: isOwner
          ? FloatingActionButton.extended(
              onPressed: () => context.push('/owner/create-hostel'),
              icon: const Icon(Icons.add_rounded),
              label: const Text('Add Hostel'),
              backgroundColor: AppTheme.primaryColor,
              foregroundColor: Colors.white,
            )
          : null,
    );
  }
}
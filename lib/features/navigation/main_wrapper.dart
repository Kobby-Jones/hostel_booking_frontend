// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class MainWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainWrapper({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body is the current branch (screen) provided by GoRouter
      body: navigationShell,
      
      // Modern Floating Navigation Bar
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: NavigationBar(
            selectedIndex: navigationShell.currentIndex,
            onDestinationSelected: (index) => navigationShell.goBranch(index),
            backgroundColor: const Color(0xFFF8FAFC),
            indicatorColor: const Color(0xFF0D9488).withOpacity(0.1),
            labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
            height: 64,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.explore_outlined, color: Color(0xFF64748B)),
                selectedIcon: Icon(Icons.explore_rounded, color: Color(0xFF0D9488)),
                label: "Discover",
              ),
              NavigationDestination(
                icon: Icon(Icons.bookmark_border_rounded, color: Color(0xFF64748B)),
                selectedIcon: Icon(Icons.bookmark_rounded, color: Color(0xFF0D9488)),
                label: "Bookings",
              ),
              NavigationDestination(
                icon: Icon(Icons.person_outline_rounded, color: Color(0xFF64748B)),
                selectedIcon: Icon(Icons.person_rounded, color: Color(0xFF0D9488)),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
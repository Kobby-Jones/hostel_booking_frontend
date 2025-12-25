import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class MainWrapper extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainWrapper({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.explore_outlined), label: "Explore"),
          NavigationDestination(icon: Icon(Icons.bookmark_border_rounded), label: "Bookings"),
          NavigationDestination(icon: Icon(Icons.person_outline_rounded), label: "Profile"),
        ],
      ),
    );
  }
}
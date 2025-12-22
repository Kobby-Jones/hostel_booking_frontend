import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "config/routes.dart";
import "config/theme.dart";

class HostelBookingApp extends ConsumerWidget {
  const HostelBookingApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: router,
    );
  }
}

import "package:dio/dio.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hostel_booking/features/auth/auth_controller.dart";
import "package:hostel_booking/services/api/api_client.dart";
import "package:hostel_booking/services/hostel_service.dart";

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _bootstrap();
  }

 Future<void> _bootstrap() async {
  await Future.delayed(const Duration(seconds: 2));

   final authState = ref.watch(authControllerProvider);

  try {
    final response = await ApiClient.instance.get("/hostels");
    debugPrint("Hostels API reachable. Status: ${response.statusCode}");
  } on DioException catch (e) {
    debugPrint("API connectivity error: ${e.response?.statusCode}");
    debugPrint("Message: ${e.message}");
  } catch (e) {
    debugPrint("Unexpected error: $e");
  }

final (hostels, _) = await HostelService().fetchHostels();
debugPrint(hostels.first.name);

  debugPrint("Authenticated: $authState");
}

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

import "package:flutter/material.dart";
import "../../ui/primitives/app_button.dart";
import "../../ui/primitives/app_section.dart";
import "../../ui/tokens/spacing.dart";

class BookingResultScreen extends StatelessWidget {
  final bool success;

  const BookingResultScreen({super.key, required this.success});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Booking Status"),
      ),
      body: AppSection(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              success ? Icons.check_circle : Icons.error,
              size: 72,
              color: success ? Colors.green : Colors.red,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              success
                  ? "Your booking was successful!"
                  : "Payment not completed.",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              label: "View My Bookings",
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/bookings");
              },
            ),
          ],
        ),
      ),
    );
  }
}

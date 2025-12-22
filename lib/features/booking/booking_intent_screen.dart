// ignore_for_file: use_build_context_synchronously

import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:url_launcher/url_launcher.dart";
import "../../ui/primitives/app_button.dart";
import "../../ui/primitives/app_section.dart";
import "../../ui/tokens/spacing.dart";
import "booking_provider.dart";

class BookingIntentScreen extends ConsumerStatefulWidget {
  final String roomId;

  const BookingIntentScreen({super.key, required this.roomId});

  @override
  ConsumerState<BookingIntentScreen> createState() =>
      _BookingIntentScreenState();
}

class _BookingIntentScreenState
    extends ConsumerState<BookingIntentScreen> {
  DateTime? checkInDate;
  DateTime? checkOutDate;
  int numberOfGuests = 1;

  Future<void> _pickDate({
    required bool isCheckIn,
  }) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      firstDate: now,
      lastDate: DateTime(now.year + 1),
      initialDate: now,
    );

    if (picked == null) return;

    setState(() {
      if (isCheckIn) {
        checkInDate = picked;
        if (checkOutDate != null && checkOutDate!.isBefore(picked)) {
          checkOutDate = null;
        }
      } else {
        checkOutDate = picked;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(bookingLoadingProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Confirm Booking")),
      body: AppSection(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Check-in
            TextButton(
              onPressed: () => _pickDate(isCheckIn: true),
              child: Text(
                checkInDate == null
                    ? "Select check-in date"
                    : "Check-in: ${checkInDate!.toLocal().toString().split(" ")[0]}",
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            // Check-out
            TextButton(
              onPressed: checkInDate == null
                  ? null
                  : () => _pickDate(isCheckIn: false),
              child: Text(
                checkOutDate == null
                    ? "Select check-out date"
                    : "Check-out: ${checkOutDate!.toLocal().toString().split(" ")[0]}",
              ),
            ),

            const SizedBox(height: AppSpacing.md),

            // Guests
            Row(
              children: [
                const Text("Guests"),
                const SizedBox(width: AppSpacing.md),
                DropdownButton<int>(
                  value: numberOfGuests,
                  items: List.generate(
                    6,
                    (i) => DropdownMenuItem(
                      value: i + 1,
                      child: Text("${i + 1}"),
                    ),
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => numberOfGuests = value);
                    }
                  },
                ),
              ],
            ),

            const Spacer(),

            AppButton(
              label: "Proceed to Payment",
              isLoading: isLoading,
              onPressed: (isLoading || checkInDate == null || checkOutDate == null)
    ? null
    : () async {
        try {
          ref.read(bookingLoadingProvider.notifier).state = true;

          String? bookingId = ref.read(activeBookingIdProvider);

          if (bookingId == null) {
            debugPrint("📦 Creating booking...");
            debugPrint("Room ID: ${widget.roomId}");
            debugPrint("Check-in: ${checkInDate!.toUtc().toIso8601String()}");
            debugPrint("Check-out: ${checkOutDate!.toUtc().toIso8601String()}");
            debugPrint("Guests: $numberOfGuests");

            bookingId = await ref
                .read(bookingServiceProvider)
                .createBooking(
                  roomId: widget.roomId,
                  checkInDate: checkInDate!,
                  checkOutDate: checkOutDate!,
                  numberOfGuests: numberOfGuests,
                );

            debugPrint("✅ Booking created: $bookingId");
            ref.read(activeBookingIdProvider.notifier).state = bookingId;
          } else {
            debugPrint("♻️ Using existing booking: $bookingId");
          }

          debugPrint("💳 Creating payment session...");
          final paymentUrl = await ref
              .read(paymentServiceProvider)
              .createPaymentSession(bookingId: bookingId);

          debugPrint("✅ Payment URL: $paymentUrl");

          final uri = Uri.parse(paymentUrl);

          if (kIsWeb) {
            await launchUrl(uri, webOnlyWindowName: "_self");
          } else {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        } on DioException catch (e) {
          debugPrint("❌ DioException: ${e.message}");
          debugPrint("Status: ${e.response?.statusCode}");
          debugPrint("Response: ${e.response?.data}");
          
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  e.response?.data?["message"] ?? "Payment failed: ${e.message}"
                ),
              ),
            );
          }
        } catch (e) {
          debugPrint("❌ Unexpected error: $e");
          
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: $e")),
            );
          }
        } finally {
          ref.read(bookingLoadingProvider.notifier).state = false;
        }
      },

            ),
          ],
        ),
      ),
    );
  }
}

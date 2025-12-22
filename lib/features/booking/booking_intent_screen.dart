// ignore_for_file: use_build_context_synchronously

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
             onPressed: isLoading
    ? null
    : () async {
        try {
          ref.read(bookingLoadingProvider.notifier).state = true;

          // 1️⃣ Check if booking already exists
          String? bookingId =
              ref.read(activeBookingIdProvider);

          // 2️⃣ Create booking ONLY if it doesn't exist
          if (bookingId == null) {
            bookingId = await ref
                .read(bookingServiceProvider)
                .createBooking(
                  roomId: widget.roomId,
                  checkInDate: checkInDate!,
                  checkOutDate: checkOutDate!,
                  numberOfGuests: numberOfGuests,
                );

            // Persist bookingId
            ref.read(activeBookingIdProvider.notifier).state =
                bookingId;
          }

          // 3️⃣ Create payment session (retry-safe)
          final paymentUrl = await ref
              .read(paymentServiceProvider)
              .createPaymentSession(
                bookingId: bookingId,
              );

         final uri = Uri.parse(paymentUrl);

          if (kIsWeb) {
            // Flutter Web: must use browser navigation
            // ignore: avoid_web_libraries_in_flutter
            // This is REQUIRED for payment gateways
            // because popups are blocked otherwise
            await launchUrl(
              uri,
              webOnlyWindowName: "_self",
            );
          } else {
            // Mobile: external browser
            await launchUrl(
              uri,
              mode: LaunchMode.externalApplication,
            );
          }

        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Payment initiation failed"),
            ),
          );
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

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:intl/intl.dart";
import "../../ui/primitives/app_card.dart";
import "../../ui/tokens/spacing.dart";
import "my_bookings_provider.dart";

class MyBookingsScreen extends ConsumerWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myBookingsProvider);
    final dateFormat = DateFormat('yyyy-MM-dd');

    return Scaffold(
      appBar: AppBar(title: const Text("My Bookings")),
      body: state.when(
        loading: () =>
            const Center(child: CircularProgressIndicator()),
        error: (e, _) =>
            Center(child: Text("Failed to load bookings\n$e")),
        data: (bookings) {
          if (bookings.isEmpty) {
            return const Center(child: Text("No bookings yet"));
          }

          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: bookings.length,
            separatorBuilder: (_, __) =>
                const SizedBox(height: AppSpacing.md),
            itemBuilder: (context, index) {
              final booking = bookings[index];

              return AppCard(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Booking ID: ${booking.id}",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Text("Status: ${booking.status}"),

                      Text(
                        "Stay: ${dateFormat.format(booking.checkInDate)} → "
                        "${dateFormat.format(booking.checkOutDate)}",
                      ),

                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

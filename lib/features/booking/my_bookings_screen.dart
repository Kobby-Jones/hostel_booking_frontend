// ignore_for_file: deprecated_member_use, unnecessary_underscores, unused_result

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:hostel_booking/features/booking/booking_provider.dart";
import "package:intl/intl.dart";
import "../../ui/tokens/spacing.dart";
import "../../ui/primitives/app_shimmer.dart";
import "../../models/booking.dart";
import "my_bookings_provider.dart";

class MyBookingsScreen extends ConsumerWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(myBookingsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text("My Reservations"),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(myBookingsProvider.future),
        child: state.when(
          loading: () => const _LoadingState(),
          error: (e, _) => _ErrorState(error: e.toString()),
          data: (bookings) {
            if (bookings.isEmpty) return const _EmptyState();

            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.lg),
              itemCount: bookings.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.lg),
              itemBuilder: (context, index) => _BookingCard(booking: bookings[index]),
            );
          },
        ),
      ),
    );
  }
}

class _BookingCard extends ConsumerWidget {
  final Booking booking;
  const _BookingCard({required this.booking});

  void _showCancelDialog(BuildContext context, WidgetRef ref, String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Cancel Booking?"),
        content: const Text("Are you sure? Depending on the time left until check-in, a partial refund may apply."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Keep Booking"),
          ),
          TextButton(
            onPressed: () async {
              await ref.read(bookingServiceProvider).cancelBooking(id);
              ref.refresh(myBookingsProvider);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text("Yes, Cancel", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hostelName = booking.room?.hostel?.name ?? "Hostel Reservation";
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 20, offset: const Offset(0, 8))
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(hostelName, 
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: -0.5)),
                    ),
                    _StatusChip(status: booking.status),
                  ],
                ),
                const SizedBox(height: 16),
                _InfoRow(icon: Icons.calendar_today_rounded, 
                  label: "${DateFormat('MMM dd').format(booking.checkInDate)} - ${DateFormat('MMM dd').format(booking.checkOutDate)}"),
                const SizedBox(height: 8),
                _InfoRow(icon: Icons.meeting_room_rounded, label: "Room: ${booking.room?.roomNumber ?? 'N/A'}"),
                const SizedBox(height: 8),
                _InfoRow(icon: Icons.payments_rounded, label: "Total Paid: GH₵ ${booking.totalAmount}"),
              ],
            ),
          ),
          
          // Futuristic Verification Area
          if (booking.bookingCode != null)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: AppSpacing.lg),
              decoration: BoxDecoration(
                color: const Color(0xFF0D9488).withOpacity(0.05),
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("VERIFICATION CODE", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w800, color: Color(0xFF0D9488))),
                      Text("Show this at check-in", style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D9488),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(booking.bookingCode!, 
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2)),
                  ),
                ],
              ),
            ),
          
          // Cancel Button
          if (booking.status != 'CANCELLED' && booking.status != 'COMPLETED')
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 16.0, bottom: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _showCancelDialog(context, ref, booking.id),
                    child: const Text("Cancel Reservation", style: TextStyle(color: Colors.redAccent, fontSize: 13, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    switch (status) {
      case 'PAID': color = Colors.blue; break;
      case 'CONFIRMED': color = Colors.teal; break;
      case 'PENDING_PAYMENT': color = Colors.orange; break;
      case 'CANCELLED': color = Colors.red; break;
      default: color = Colors.grey;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(status.replaceAll('_', ' '), 
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  const _InfoRow({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[400]),
        const SizedBox(width: 8),
        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 14)),
      ],
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: 3,
      itemBuilder: (_, __) => const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: AppShimmer(width: double.infinity, height: 180, borderRadius: 24),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bookmark_border_rounded, size: 80, color: Colors.grey[300]),
          const SizedBox(height: 16),
          const Text("No reservations yet", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 8),
          const Text("Your booked hostels will appear here", style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String error;
  const _ErrorState({required this.error});
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Error: $error"));
  }
}
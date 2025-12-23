// ignore_for_file: deprecated_member_use

import "dart:ui";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:url_launcher/url_launcher.dart";
import "package:intl/intl.dart";
import "../../ui/tokens/spacing.dart";
import "../../ui/primitives/app_button.dart";
import "booking_provider.dart";

class BookingIntentScreen extends ConsumerStatefulWidget {
  final String roomId;
  const BookingIntentScreen({super.key, required this.roomId});

  @override
  ConsumerState<BookingIntentScreen> createState() => _BookingIntentScreenState();
}

class _BookingIntentScreenState extends ConsumerState<BookingIntentScreen> {
  DateTimeRange? _selectedRange;
  int _guests = 1;

  void _showDateRangePicker() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xFF0F766E)),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => _selectedRange = picked);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(bookingLoadingProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Finalize Booking"),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFF0FDFA), Color(0xFFF8FAFB)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader("Reservation Dates"),
                const SizedBox(height: AppSpacing.md),
                _buildGlassCard(
                  onTap: _showDateRangePicker,
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_month_outlined, color: Color(0xFF0F766E)),
                      const SizedBox(width: AppSpacing.md),
                      Text(
                        _selectedRange == null
                            ? "Select Check-in & Check-out"
                            : "${DateFormat('MMM dd').format(_selectedRange!.start)} — ${DateFormat('MMM dd').format(_selectedRange!.end)}",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                _buildSectionHeader("Guest Information"),
                const SizedBox(height: AppSpacing.md),
                _buildGlassCard(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Number of Guests", style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          _buildGuestBtn(Icons.remove, () => setState(() => _guests = _guests > 1 ? _guests - 1 : 1)),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                            child: Text("$_guests", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          _buildGuestBtn(Icons.add, () => setState(() => _guests++)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                _buildSectionHeader("Price Summary"),
                const SizedBox(height: AppSpacing.md),
                _buildGlassCard(
                  child: Column(
                    children: [
                      _buildPriceRow("Room Total", "Calculation Pending"),
                      const Divider(height: 32),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Payable", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text("Secure Payment", style: TextStyle(color: Color(0xFF0F766E), fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),
                AppButton(
                  label: "Confirm & Pay with Paystack",
                  isLoading: isLoading,
                  onPressed: _selectedRange == null ? null : _handlePayment,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, letterSpacing: 1.2, color: Color(0xFF64748B)));
  }

  Widget _buildGlassCard({required Widget child, VoidCallback? onTap}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              border: Border.all(color: Colors.white.withOpacity(0.3)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: child,
          ),
        ),
      ),
    );
  }

  Widget _buildGuestBtn(IconData icon, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)]),
        child: Icon(icon, size: 20, color: const Color(0xFF0F766E)),
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text(label, style: const TextStyle(color: Color(0xFF64748B))), Text(value, style: const TextStyle(fontWeight: FontWeight.w600))]);
  }

  Future<void> _handlePayment() async {
    try {
      ref.read(bookingLoadingProvider.notifier).state = true;
      final bookingId = await ref.read(bookingServiceProvider).createBooking(
            roomId: widget.roomId,
            checkInDate: _selectedRange!.start,
            checkOutDate: _selectedRange!.end,
            numberOfGuests: _guests,
          );
      final paymentUrl = await ref.read(paymentServiceProvider).createPaymentSession(bookingId: bookingId);
      final uri = Uri.parse(paymentUrl);
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      ref.read(bookingLoadingProvider.notifier).state = false;
    }
  }
}
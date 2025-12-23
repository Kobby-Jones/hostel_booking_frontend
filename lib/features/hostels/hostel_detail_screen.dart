// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:cached_network_image/cached_network_image.dart";
import "../../ui/tokens/spacing.dart";
import "../../models/hostel.dart";
import "../../models/room.dart";
import "hostel_detail_provider.dart";

class HostelDetailScreen extends ConsumerWidget {
  final String hostelId;
  const HostelDetailScreen({super.key, required this.hostelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(hostelDetailProvider(hostelId));

    return Scaffold(
      body: state.when(
        loading: () => const _LoadingDetail(),
        error: (e, _) => Center(child: Text("Error loading details: $e")),
        data: (hostel) => _HostelDetailContent(hostel: hostel),
      ),
    );
  }
}

class _HostelDetailContent extends StatelessWidget {
  final Hostel hostel;
  const _HostelDetailContent({required this.hostel});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            // Dynamic Header with Hero Image
            SliverAppBar(
              expandedHeight: 400,
              pinned: true,
              stretch: true,
              leadingWidth: 80,
              leading: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [StretchMode.zoomBackground],
                background: Hero(
                  tag: 'hostel-${hostel.id}',
                  child: CachedNetworkImage(
                    imageUrl: hostel.images.isNotEmpty ? hostel.images.first.url : "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Hostel Info & Description
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hostel.name, style: Theme.of(context).textTheme.headlineLarge),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on_rounded, color: Colors.teal, size: 16),
                        const SizedBox(width: 4),
                        Text("${hostel.city}, ${hostel.state}", style: Theme.of(context).textTheme.bodyLarge),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Text("About this hostel", style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 12),
                    Text(hostel.description, style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(height: 32),
                    
                    // Amenities Section
                    Text("Amenities", style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 16),
                    _AmenitiesGrid(amenities: hostel.amenities),
                    
                    const SizedBox(height: 32),
                    Text("Available Rooms", style: Theme.of(context).textTheme.headlineMedium),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            // Room List
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => _RoomCard(room: hostel.rooms[index]),
                  childCount: hostel.rooms.length,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)), // Bottom padding
          ],
        ),

        // Sticky Bottom Booking Bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: _BookingBottomBar(hostel: hostel),
        ),
      ],
    );
  }
}

class _AmenitiesGrid extends StatelessWidget {
  final List<String> amenities;
  const _AmenitiesGrid({required this.amenities});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: amenities.map((a) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Text(a, style: const TextStyle(fontWeight: FontWeight.w600)),
      )).toList(),
    );
  }
}

class _RoomCard extends StatelessWidget {
  final Room room;
  const _RoomCard({required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[200]!),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(room.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text("${room.capacity} Person · ${room.roomType}", style: TextStyle(color: Colors.grey[600], fontSize: 14)),
                const SizedBox(height: 8),
                Text("GH₵ ${room.pricePerNight}", style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w800, fontSize: 18)),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              minimumSize: const Size(100, 44),
            ),
            onPressed: () => context.push("/booking/${room.id}"),
            child: const Text("Select"),
          ),
        ],
      ),
    );
  }
}

class _BookingBottomBar extends StatelessWidget {
  final Hostel hostel;
  const _BookingBottomBar({required this.hostel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey[200]!)),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 20)],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Starting from", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                Text("GH₵ ${hostel.rooms.isNotEmpty ? hostel.rooms.first.pricePerNight : 'N/A'}", 
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal)),
              ],
            ),
          ),
          SizedBox(
            width: 180,
            child: ElevatedButton(
              onPressed: () {
                // Scroll to rooms section logic could go here
              },
              child: const Text("Book Now"),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingDetail extends StatelessWidget {
  const _LoadingDetail();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
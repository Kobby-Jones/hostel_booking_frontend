// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:cached_network_image/cached_network_image.dart";
import "../../ui/primitives/app_card.dart";
import "../../ui/primitives/app_shimmer.dart";
import "../../ui/tokens/spacing.dart";
import "../../models/hostel.dart";
import "hostel_list_provider.dart";

class HostelListScreen extends ConsumerWidget {
  const HostelListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(hostelListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover Hostels"),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded), // Modern filter icon
            onPressed: () {
              // We will build the filter bottom sheet later
            },
          ),
        ],
      ),
      body: state.when(
        loading: () => const _HostelListLoading(),
        error: (error, _) => _ErrorState(error: error.toString()),
        data: (data) {
          final hostels = data.$1;
          if (hostels.isEmpty) return const _EmptyState();

          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: hostels.length,
            separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.md),
            itemBuilder: (context, index) => _HostelCard(hostel: hostels[index]),
          );
        },
      ),
    );
  }
}

class _HostelCard extends StatelessWidget {
  final Hostel hostel;
  const _HostelCard({required this.hostel});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => context.push("/hostels/${hostel.id}"),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
                child: AspectRatio(
                  aspectRatio: 16 / 10,
                  child: hostel.images.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: hostel.images.first.url,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const AppShimmer(width: double.infinity, height: double.infinity),
                          errorWidget: (context, url, error) => Container(color: Colors.grey[200], child: const Icon(Icons.image_not_supported)),
                        )
                      : Container(color: Colors.grey[200]),
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "${hostel.distanceFromCampus}km away",
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(hostel.name, style: Theme.of(context).textTheme.headlineMedium),
                    ),
                    const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                    const Text(" 4.8", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 4),
                Text("${hostel.city}, ${hostel.state}", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey[600])),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: hostel.amenities.take(3).map((a) => _AmenityTag(label: a)).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AmenityTag extends StatelessWidget {
  final String label;
  const _AmenityTag({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: Colors.teal.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
      child: Text(label, style: const TextStyle(color: Colors.teal, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }
}

class _HostelListLoading extends StatelessWidget {
  const _HostelListLoading();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(AppSpacing.md),
      itemCount: 3,
      separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.md),
      // ignore: unnecessary_underscores
      itemBuilder: (_, __) => const AppShimmer(width: double.infinity, height: 320, borderRadius: 24),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final String error;
  const _ErrorState({required this.error});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline_rounded, size: 64, color: Colors.redAccent),
          const SizedBox(height: 16),
          Text("Oops! Something went wrong", style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          Text(error, textAlign: TextAlign.center),
          const SizedBox(height: 24),
          ElevatedButton(onPressed: () {}, child: const Text("Try Again")),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No hostels found matching your criteria."));
  }
}
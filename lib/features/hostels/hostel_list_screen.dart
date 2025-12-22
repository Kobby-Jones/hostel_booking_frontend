import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "../../ui/primitives/app_card.dart";
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
        title: const Text("Available Hostels"),
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, _) => Center(
          child: Text(
            "Failed to load hostels.\n$error",
            textAlign: TextAlign.center,
          ),
        ),
        data: (data) {
          final hostels = data.$1;

          if (hostels.isEmpty) {
            return const Center(
              child: Text("No hostels available"),
            );
          }

          return ListView.separated(
            padding: const EdgeInsets.all(AppSpacing.md),
            itemCount: hostels.length,
            separatorBuilder: (_, _) =>
                const SizedBox(height: AppSpacing.md),
            itemBuilder: (context, index) {
              final hostel = hostels[index];
              return _HostelCard(hostel: hostel);
            },
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
    final imageUrl =
        hostel.images.isNotEmpty ? hostel.images.first.thumbnailUrl : null;

    return AppCard(
     onTap: () {
        context.push("/hostels/${hostel.id}");
      },


      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (imageUrl != null)
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hostel.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  "${hostel.city}, ${hostel.state}",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  "${hostel.distanceFromCampus} km from campus",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

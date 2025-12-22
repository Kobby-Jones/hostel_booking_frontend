import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:hostel_booking/ui/primitives/app_button.dart";
import "../../ui/primitives/app_section.dart";
import "../../ui/tokens/spacing.dart";
import "../../models/hostel.dart";
import "hostel_detail_provider.dart";

class HostelDetailScreen extends ConsumerWidget {
  final String hostelId;

  const HostelDetailScreen({super.key, required this.hostelId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(hostelDetailProvider(hostelId));

    return Scaffold(
      body: state.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Failed to load hostel\n$e")),
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
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 280,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(hostel.name),
            background: PageView(
              children: hostel.images
                  .map(
                    (img) => Image.network(
                      img.url,
                      fit: BoxFit.cover,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: AppSection(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${hostel.city}, ${hostel.state}",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  "${hostel.distanceFromCampus} km from campus",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  hostel.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  "Available Rooms",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: AppSpacing.sm),
                ...hostel.rooms.map(
                  (room) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                    child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${room.roomType} • ${room.capacity} person(s)",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      SizedBox(
                        width: 120,
                        child: AppButton(
                          label: "Book",
                          variant: AppButtonVariant.outline,
                          onPressed: () {
                            context.push("/booking/${room.id}");
                          },
                        ),
                      ),
                    ],
                  ),

                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}

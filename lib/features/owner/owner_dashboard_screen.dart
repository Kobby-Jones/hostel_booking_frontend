// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "../../ui/tokens/spacing.dart";
import "../../models/hostel.dart";
import "owner_provider.dart";

class OwnerDashboardScreen extends ConsumerWidget {
  const OwnerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hostelsState = ref.watch(ownerHostelsProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: CustomScrollView(
        slivers: [
          _buildHeader(context),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Your Properties", style: Theme.of(context).textTheme.headlineMedium),
                  TextButton.icon(
                    onPressed: () => context.push("/owner/create-hostel"),
                    icon: const Icon(Icons.add_circle_outline, size: 20),
                    label: const Text("Add New"),
                  ),
                ],
              ),
            ),
          ),
          hostelsState.when(
            loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
            error: (e, _) => SliverFillRemaining(child: Center(child: Text("Error: $e"))),
            data: (hostels) => hostels.isEmpty 
              ? const _EmptyDashboard()
              : SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => _OwnerHostelCard(hostel: hostels[index]),
                      childCount: hostels.length,
                    ),
                  ),
                ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 220,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF0F766E), Color(0xFF134E4A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.xl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Owner Dashboard", style: TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  const Text("Welcome back, Host", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  _buildQuickStats(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuickStats() {
    return Row(
      children: [
        _statItem("Total Revenue", "GH₵ 0.00"), // We can aggregate this from stats later
        const SizedBox(width: 24),
        _statItem("Occupancy", "0%"),
      ],
    );
  }

  Widget _statItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.white60, fontSize: 12)),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

class _OwnerHostelCard extends StatelessWidget {
  final Hostel hostel;
  const _OwnerHostelCard({required this.hostel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.03), blurRadius: 10, offset: const Offset(0, 4))],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60, height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  image: hostel.images.isNotEmpty 
                    ? DecorationImage(image: NetworkImage(hostel.images.first.url), fit: BoxFit.cover)
                    : null,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hostel.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("${hostel.city}, ${hostel.state}", style: TextStyle(color: Colors.grey[500], fontSize: 12)),
                  ],
                ),
              ),
              _StatusBadge(status: hostel.status), // Displaying ListingStatus
            ],
          ),
          const Divider(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _miniStat("Rooms", "${hostel.rooms.length}"),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F766E),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(100, 36),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () => context.push("/owner/hostels/${hostel.id}"),
                child: const Text("Manage"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _miniStat(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  final String status;
  const _StatusBadge({required this.status});

  @override
  Widget build(BuildContext context) {
    Color color = status == 'APPROVED' ? Colors.green : Colors.orange;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color.withOpacity(0.1), borderRadius: BorderRadius.circular(8)),
      child: Text(status, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold)),
    );
  }
}

class _EmptyDashboard extends StatelessWidget {
  const _EmptyDashboard();
  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Center(
        child: Text("You haven't added any hostels yet."),
      ),
    );
  }
}
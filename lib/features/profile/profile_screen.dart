// lib/features/profile/profile_screen.dart
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../config/theme.dart';
import '../../ui/tokens/spacing.dart';
import '../../services/api/api_client.dart';
import '../auth/auth_controller.dart';
import '../navigation/main_wrapper.dart';

// Provider for user profile data
final userProfileProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  try {
    final response = await ApiClient.instance.get('/auth/me');
    return response.data['data']['user'];
  } catch (e) {
    return null;
  }
});

// Provider for owner stats
final ownerStatsProvider = FutureProvider<Map<String, dynamic>?>((ref) async {
  try {
    final userRole = ref.watch(userRoleProvider);
    if (userRole != 'OWNER') return null;

    // Fetch owner's hostels to calculate stats
    final response = await ApiClient.instance.get('/hostels/owner/me');
    final hostels = response.data['data']['hostels'] as List;
    
    return {
      'hostelCount': hostels.length,
      'bookingCount': 0, // You can fetch this from a dedicated endpoint
    };
  } catch (e) {
    return null;
  }
});

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // Refresh profile data when screen loads
    Future.microtask(() => ref.refresh(userProfileProvider));
  }

  @override
  Widget build(BuildContext context) {
    final userProfileAsync = ref.watch(userProfileProvider);
    final ownerStatsAsync = ref.watch(ownerStatsProvider);

    return Scaffold(
      body: userProfileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              const Text('Failed to load profile'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => ref.refresh(userProfileProvider),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
        data: (userData) {
          if (userData == null) {
            return const Center(child: Text('No user data available'));
          }

          final firstName = userData['firstName'] ?? 'User';
          final lastName = userData['lastName'] ?? '';
          final email = userData['email'] ?? '';
          final role = userData['role'] ?? 'STUDENT';
          final isOwner = role == 'OWNER';

          // Update global role provider
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(userRoleProvider.notifier).state = role;
          });

          return CustomScrollView(
            slivers: [
              // Gradient Header
              SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    decoration: const BoxDecoration(
                      gradient: AppTheme.primaryGradient,
                    ),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: AppShadows.medium,
                            ),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: AppTheme.primaryColor,
                              child: Text(
                                firstName.isNotEmpty ? firstName[0].toUpperCase() : 'U',
                                style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          Text(
                            '$firstName $lastName',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            email,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              isOwner ? 'Hostel Owner' : 'Student',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Content
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Quick Stats (for owners)
                      if (isOwner) ...[
                        ownerStatsAsync.when(
                          loading: () => const Center(
                            child: Padding(
                              padding: EdgeInsets.all(AppSpacing.md),
                              child: CircularProgressIndicator(),
                            ),
                          ),
                          error: (_, _) => const SizedBox.shrink(),
                          data: (stats) {
                            if (stats == null) return const SizedBox.shrink();
                            return Column(
                              children: [
                                _buildQuickStats(
                                  stats['hostelCount'] ?? 0,
                                  stats['bookingCount'] ?? 0,
                                ),
                                const SizedBox(height: AppSpacing.xl),
                              ],
                            );
                          },
                        ),
                      ],

                      // Account Section
                      _buildSectionTitle('Account'),
                      const SizedBox(height: AppSpacing.md),
                      _ProfileMenuItem(
                        icon: Icons.person_outline_rounded,
                        title: 'Personal Information',
                        subtitle: 'Update your details',
                        onTap: () => context.push('/profile/edit'),
                      ),
                      _ProfileMenuItem(
                        icon: Icons.security_rounded,
                        title: 'Security',
                        subtitle: 'Password and authentication',
                        onTap: () => context.push('/profile/security'),
                      ),
                      _ProfileMenuItem(
                        icon: Icons.notifications_outlined,
                        title: 'Notifications',
                        subtitle: 'Manage your preferences',
                        onTap: () => context.push('/profile/notifications'),
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      // Hostel Owner Options
                      if (isOwner) ...[
                        _buildSectionTitle('Business'),
                        const SizedBox(height: AppSpacing.md),
                        _ProfileMenuItem(
                          icon: Icons.add_business_rounded,
                          title: 'Add New Hostel',
                          subtitle: 'List a new property',
                          color: AppTheme.accentColor,
                          onTap: () => context.push('/owner/create-hostel'),
                        ),
                        _ProfileMenuItem(
                          icon: Icons.business_center_rounded,
                          title: 'My Hostels',
                          subtitle: 'Manage your properties',
                          onTap: () => context.push('/owner/hostels'),
                        ),
                        _ProfileMenuItem(
                          icon: Icons.analytics_outlined,
                          title: 'Analytics',
                          subtitle: 'View performance metrics',
                          onTap: () => context.push('/owner/analytics'),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                      ],

                      // Student-specific options
                      if (!isOwner) ...[
                        _buildSectionTitle('Bookings'),
                        const SizedBox(height: AppSpacing.md),
                        _ProfileMenuItem(
                          icon: Icons.bookmark_rounded,
                          title: 'My Bookings',
                          subtitle: 'View your reservations',
                          onTap: () => context.go('/bookings'),
                        ),
                        _ProfileMenuItem(
                          icon: Icons.favorite_rounded,
                          title: 'Favorites',
                          subtitle: 'Saved hostels',
                          onTap: () => context.push('/favorites'),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                      ],

                      // General Options
                      _buildSectionTitle('Support'),
                      const SizedBox(height: AppSpacing.md),
                      _ProfileMenuItem(
                        icon: Icons.help_outline_rounded,
                        title: 'Help Center',
                        subtitle: 'FAQs and support',
                        onTap: () => context.push('/help'),
                      ),
                      _ProfileMenuItem(
                        icon: Icons.info_outline_rounded,
                        title: 'About',
                        subtitle: 'App version and info',
                        onTap: () => context.push('/about'),
                      ),

                      const SizedBox(height: AppSpacing.xl),

                      // Logout Button
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFEF4444), Color(0xFFDC2626)],
                          ),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: AppShadows.colored(AppTheme.errorColor),
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            // Show confirmation dialog
                            final shouldLogout = await showDialog<bool>(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Logout'),
                                content: const Text('Are you sure you want to logout?'),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, false),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, true),
                                    child: const Text('Logout'),
                                  ),
                                ],
                              ),
                            );

                            if (shouldLogout == true && context.mounted) {
                              await ref.read(authControllerProvider.notifier).logout();
                              if (context.mounted) {
                                context.go('/');
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            minimumSize: const Size.fromHeight(56),
                          ),
                          child: const Text('Logout'),
                        ),
                      ),

                      const SizedBox(height: AppSpacing.xl),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title.toUpperCase(),
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w800,
        color: Color(0xFF64748B),
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildQuickStats(int hostelCount, int bookingCount) {
    return Row(
      children: [
        Expanded(
          child: _StatCard(
            icon: Icons.home_rounded,
            label: 'Hostels',
            value: hostelCount.toString(),
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(width: AppSpacing.md),
        Expanded(
          child: _StatCard(
            icon: Icons.trending_up_rounded,
            label: 'Bookings',
            value: bookingCount.toString(),
            color: AppTheme.accentColor,
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: AppSpacing.sm),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w900,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final Color? color;

  const _ProfileMenuItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final itemColor = color ?? AppTheme.primaryColor;

    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: AppShadows.small,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: itemColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: itemColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.darkSurface,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.grey.shade400,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
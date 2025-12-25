import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/hostel.dart';
import '../../services/hostel_service.dart';

final ownerHostelsProvider = FutureProvider<List<Hostel>>((ref) async {
  return HostelService().getOwnerHostels();
});

// Provider for specific hostel stats
final hostelStatsProvider = FutureProvider.family<Map<String, dynamic>, String>((ref, id) async {
  return HostelService().getHostelStats(id);
});
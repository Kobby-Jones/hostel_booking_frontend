import "package:flutter_riverpod/flutter_riverpod.dart";
import "../../models/hostel.dart";
import "../../services/hostel_service.dart";

final hostelDetailProvider =
    FutureProvider.family<Hostel, String>((ref, hostelId) async {
  final (hostels, _) = await HostelService().fetchHostels();
  return hostels.firstWhere((h) => h.id == hostelId);
});

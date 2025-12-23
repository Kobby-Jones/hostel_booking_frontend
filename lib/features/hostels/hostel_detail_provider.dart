import "package:flutter_riverpod/flutter_riverpod.dart";
import "../../models/hostel.dart";
import "../../services/hostel_service.dart";

final hostelDetailProvider = FutureProvider.family<Hostel, String>((ref, id) async {
  return HostelService().fetchHostelById(id);
});
import "package:flutter_riverpod/flutter_riverpod.dart";
import "../../models/hostel.dart";
import "../../models/pagination.dart";
import "../../services/hostel_service.dart";

final hostelListProvider =
    FutureProvider<(List<Hostel>, Pagination)>((ref) async {
  return HostelService().fetchHostels();
});

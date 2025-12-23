import "../models/hostel.dart";
import "../models/pagination.dart";
import "api/api_client.dart";

class HostelService {
  Future<(List<Hostel>, Pagination)> fetchHostels() async {
    try {
      final response = await ApiClient.instance.get("/hostels");
      final data = response.data["data"];

      // Safely parse hostels, skipping any that are totally malformed
      final hostels = (data["hostels"] as List?)?.map((e) {
            try {
              return Hostel.fromJson(e as Map<String, dynamic>);
            } catch (e) {
              print("Warning: Skipping a malformed hostel: $e");
              return null;
            }
          }).whereType<Hostel>().toList() ?? [];

      final pagination = Pagination.fromJson(data["pagination"] ?? {});

      return (hostels, pagination);
    } catch (e) {
      throw Exception("Failed to load hostels: $e");
    }
  }

  Future<Hostel> fetchHostelById(String id) async {
    final response = await ApiClient.instance.get("/hostels/$id");
    return Hostel.fromJson(response.data["data"]["hostel"]);
  }
}
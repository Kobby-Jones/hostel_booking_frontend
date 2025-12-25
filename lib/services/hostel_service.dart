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


  /// Fetches only the hostels belonging to the logged-in owner
  Future<List<Hostel>> getOwnerHostels() async {
    final response = await ApiClient.instance.get("/hostels/owner/me");
    // Backend returns { success: true, data: { hostels: [...] } }
    final List rawHostels = response.data["data"]["hostels"] ?? [];
    return rawHostels.map((e) => Hostel.fromJson(e)).toList();
  }

  /// Fetches detailed analytics for a specific hostel
  Future<Map<String, dynamic>> getHostelStats(String hostelId) async {
    final response = await ApiClient.instance.get("/hostels/$hostelId/stats");
    // Returns totalRooms, availableRooms, totalBookings, activeBookings, totalRevenue
    return response.data["data"]["stats"];
  }

  // Add to your existing HostelService class
Future<String> createHostel(Map<String, dynamic> data) async {
  final response = await ApiClient.instance.post("/hostels", data: data);
  // Returns { success: true, data: { hostel: { id: ... } } }
  return response.data["data"]["hostel"]["id"];
}
}
import "../models/hostel.dart";
import "../models/pagination.dart";
import "api/api_client.dart";

class HostelService {
  Future<(List<Hostel>, Pagination)> fetchHostels() async {
    final response = await ApiClient.instance.get("/hostels");

    final data = response.data["data"];

    final hostels = (data["hostels"] as List)
        .map((e) => Hostel.fromJson(e))
        .toList();

    final pagination = Pagination.fromJson(data["pagination"]);

    return (hostels, pagination);
  }
}

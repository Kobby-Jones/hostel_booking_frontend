import "package:dio/dio.dart";
import "api/api_client.dart";
import "../core/providers.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class PaymentService {
  final Dio _dio;
  final Ref ref;

  PaymentService(this.ref) : _dio = ApiClient.instance;

  Future<String> createPaymentSession({
    required String bookingId,
  }) async {
    final token =
        await ref.read(secureStorageProvider).read(key: "access_token");

    final response = await _dio.post(
      "/payments/create-session",
      data: {
        "bookingId": bookingId,
      },
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    return response.data["data"]["authorizationUrl"] as String;
  }
}

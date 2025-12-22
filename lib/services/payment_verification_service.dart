import "package:dio/dio.dart";
import "api/api_client.dart";

class PaymentVerificationService {
  final Dio _dio = ApiClient.instance;

  Future<bool> verifyPayment({
    required String reference,
  }) async {
    final response = await _dio.post(
      "/payments/verify",
      data: {
        "reference": reference,
      },
    );

    return response.data["success"] == true;
  }
}

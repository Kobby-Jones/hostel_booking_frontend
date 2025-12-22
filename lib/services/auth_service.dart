import "package:dio/dio.dart";
import "../services/api/api_client.dart";

class AuthService {
  final Dio _dio = ApiClient.instance;

  Future<Response> login({
    required String email,
    required String password,
  }) {
    return _dio.post(
      "/auth/login",
      data: {
        "email": email,
        "password": password,
      },
    );
  }

  Future<Response> register({
    required String name,
    required String email,
    required String password,
  }) {
    return _dio.post(
      "/auth/register",
      data: {
        "name": name,
        "email": email,
        "password": password,
      },
    );
  }
}

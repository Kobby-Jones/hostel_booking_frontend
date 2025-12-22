import "package:dio/dio.dart";
import "../../config/env.dart";
import "auth_interceptor.dart";

class ApiClient {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Env.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  )..interceptors.add(AuthInterceptor());

  static Dio get instance => _dio;
}

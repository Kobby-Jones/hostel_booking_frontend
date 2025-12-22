import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_riverpod/legacy.dart";
import "package:hostel_booking/features/auth/auth_provider.dart";
import "../../core/providers.dart";

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(ref),
);

class AuthController extends StateNotifier<AuthState> {
  Future<String?> getAccessToken() async {
  return ref.read(secureStorageProvider).read(key: "access_token");
}

  final Ref ref;

  AuthController(this.ref) : super(AuthState.unauthenticated);

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = AuthState.loading;

    try {
      final response = await ref
          .read(authServiceProvider)
          .login(email: email, password: password);

      final token = response.data["data"]["accessToken"];

      await ref
          .read(secureStorageProvider)
          .write(key: "access_token", value: token);

      state = AuthState.authenticated;
    } catch (_) {
      state = AuthState.unauthenticated;
      rethrow;
    }
  }

  Future<void> logout() async {
    await ref.read(secureStorageProvider).delete(key: "access_token");
    state = AuthState.unauthenticated;
  }
}

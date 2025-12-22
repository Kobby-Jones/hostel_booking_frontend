// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "package:hostel_booking/core/providers.dart";
import "../../ui/primitives/app_button.dart";
import "../../ui/primitives/app_section.dart";
import "../../ui/tokens/spacing.dart";
import "auth_controller.dart";

class LoginScreen extends ConsumerStatefulWidget {
  final String? redirectTo;

  const LoginScreen({super.key, this.redirectTo});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: AppSection(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
            const SizedBox(height: AppSpacing.md),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: AppSpacing.lg),
            AppButton(
              label: "Login",
              isLoading: authState == AuthState.loading,
              onPressed: () async {
                try {
                  await ref
                      .read(authControllerProvider.notifier)
                      .login(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );

                  final target = widget.redirectTo ?? "/hostels";
                  context.go(target);
                } catch (_) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login failed")),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

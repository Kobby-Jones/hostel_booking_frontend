import "package:flutter/material.dart";
import "../tokens/spacing.dart";

class AppSection extends StatelessWidget {
  final Widget child;

  const AppSection({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: child,
    );
  }
}

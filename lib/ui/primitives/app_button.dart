import "package:flutter/material.dart";
import "../tokens/spacing.dart";
import "../tokens/radius.dart";

enum AppButtonVariant { primary, secondary, outline }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color background;
    Color foreground;
    BorderSide? border;

    switch (variant) {
      case AppButtonVariant.secondary:
        background = theme.colorScheme.secondary;
        foreground = Colors.white;
        border = null;
        break;
      case AppButtonVariant.outline:
        background = Colors.transparent;
        foreground = theme.colorScheme.primary;
        border = BorderSide(color: theme.colorScheme.primary);
        break;
      default:
        background = theme.colorScheme.primary;
        foreground = Colors.white;
        border = null;
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 52,
      ),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: background,
            foregroundColor: foreground,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              side: border ?? BorderSide.none,
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
            ),
          ),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : Text(label),
        ),
      ),
    );
  }
}

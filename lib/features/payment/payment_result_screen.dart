import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "../../ui/primitives/app_button.dart";
import "../../ui/primitives/app_section.dart";
import "../../ui/tokens/spacing.dart";
import "../../services/payment_verification_service.dart";

final paymentVerificationProvider =
    Provider<PaymentVerificationService>((ref) {
  return PaymentVerificationService();
});

class PaymentResultScreen extends ConsumerStatefulWidget {
  final String reference;

  const PaymentResultScreen({super.key, required this.reference});

  @override
  ConsumerState<PaymentResultScreen> createState() =>
      _PaymentResultScreenState();
}

class _PaymentResultScreenState
    extends ConsumerState<PaymentResultScreen> {
  bool? success;

  @override
  void initState() {
    super.initState();
    _verify();
  }

  Future<void> _verify() async {
    try {
      final result = await ref
          .read(paymentVerificationProvider)
          .verifyPayment(reference: widget.reference);

      setState(() => success = result);
    } catch (_) {
      setState(() => success = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Payment Status"),
      ),
      body: AppSection(
        child: success == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    success! ? Icons.check_circle : Icons.error,
                    size: 80,
                    color: success! ? Colors.green : Colors.red,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Text(
                    success!
                        ? "Payment Successful"
                        : "Payment Not Completed",
                    style:
                        Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppButton(
                    label: "View My Bookings",
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed("/bookings");
                    },
                  ),
                ],
              ),
      ),
    );
  }
}

import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Payment Details"),
    );
  }
}

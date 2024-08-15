import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/payment_methods.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(children: [
      PaymentMethodsListView(),
    ]);
  }
}

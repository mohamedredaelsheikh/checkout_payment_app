import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/custom_credit_card.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(children: [
        PaymentMethodsListView(),
        CustomCreditCard(),
      ]),
    );
  }
}

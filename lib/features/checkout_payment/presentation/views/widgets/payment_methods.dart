import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethodsListView extends StatelessWidget {
  const PaymentMethodsListView({super.key});

  final List<String> paymentMethodItems = const [
    "assets/images/card.svg",
    "assets/images/paypal.svg"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: paymentMethodItems.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: PaymentMethodItem(
                isActive: true,
                image: paymentMethodItems[index],
              ),
            );
          }),
    );
  }
}

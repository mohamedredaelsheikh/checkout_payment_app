import 'package:checkout_payment_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: Styles.style18,
      ),
      Text(
        value,
        style: Styles.style18,
      ),
    ]);
  }
}

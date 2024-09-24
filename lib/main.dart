import 'package:checkout_payment_app/core/utlis/api_keys.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/my_card_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.publishablekey;
  runApp(const CheckOutPaymentApp());
}

class CheckOutPaymentApp extends StatelessWidget {
  const CheckOutPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCardView(),
    );
  }
}

// ignore_for_file: file_names

import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/custom_app_bar.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/payment_details_view_body.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: "Payment Details"),
      body: const PaymentDetailsViewBody(),
    );
  }
}

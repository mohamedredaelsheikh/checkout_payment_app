import 'package:checkout_payment_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mu card',
          textAlign: TextAlign.center,
          style: Styles.style25,
        ),
      ),
    );
  }
}

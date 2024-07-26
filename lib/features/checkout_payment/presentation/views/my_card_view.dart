import 'package:checkout_payment_app/core/utlis/styles.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/my_card_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: SvgPicture.asset(
            "assets/images/arrow.svg",
            height: 24,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          'My card',
          textAlign: TextAlign.center,
          style: Styles.style25,
        ),
      ),
      body: const MyCardViewBody(),
    );
  }
}

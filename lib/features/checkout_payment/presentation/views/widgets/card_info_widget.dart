import 'package:checkout_payment_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 22,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/images/master_card.svg",
          ),
          const SizedBox(
            width: 22,
          ),
          Column(children: [
            Text(
              "credit card   ",
              style: Styles.style18,
            ),
            Text(
              "MasterCard **78",
              style: Styles.style18,
            )
          ])
        ],
      ),
    );
  }
}

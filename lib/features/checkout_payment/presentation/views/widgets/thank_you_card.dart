import 'package:checkout_payment_app/core/utlis/styles.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/card_info_widget.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/payment_item_info.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50 + 16,
          left: 20,
          right: 20,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                "Thank You",
                style: Styles.style20,
              ),
              Text(
                "Your Transaction was Successful ",
                style: Styles.style20,
              ),
              const SizedBox(
                height: 42,
              ),
              const PaymentItemInfo(
                title: "Date",
                value: "25/8/2024",
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentItemInfo(
                title: "Time",
                value: "10:30 AM",
              ),
              const SizedBox(
                height: 20,
              ),
              const PaymentItemInfo(
                title: "To",
                value: "waled Ali",
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                height: 60,
                thickness: 2,
              ),
              const TotalPrice(
                title: "Total",
                value: r"$50.97",
              ),
              const SizedBox(
                height: 30,
              ),
              const CardInfoWidget(),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    FontAwesomeIcons.barcode,
                    size: 64,
                  ),
                  Container(
                    width: 113,
                    height: 58,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: Color(0xff34A859)),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "PAID",
                        textAlign: TextAlign.center,
                        style: Styles.style24.copyWith(
                          color: const Color(0xff34A859),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                  height:
                      ((MediaQuery.sizeOf(context).height * .2 + 20) / 2) - 29)
            ],
          ),
        ),
      ),
    );
  }
}

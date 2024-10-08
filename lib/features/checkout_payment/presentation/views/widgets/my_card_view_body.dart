import 'package:checkout_payment_app/features/checkout_payment/data/repo/checkout_repo_imple.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/custom_button.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/order_info_item.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCardViewBody extends StatelessWidget {
  const MyCardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset("assets/images/basket_image.png")),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'$42.8',
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'$0',
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'$8',
          ),
          const Divider(
            height: 34,
            thickness: 2,
            color: Color(0xffC7C7C7),
          ),
          const TotalPrice(title: "Total", value: r"$50.7"),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: "Complete Payment",
            onTap: () {
              /*  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const PaymentDetailsView();
              }));*/
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) =>
                          StripePaymentCubit(CheckoutRepoImple()),
                      child: const PaymentMethodButtomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}

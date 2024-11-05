import 'dart:developer';

import 'package:checkout_payment_app/core/utlis/api_keys.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/models/amount_model/amount_model.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/models/amount_model/details.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/models/items_list_model/item.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/models/items_list_model/items_list_model.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/thank_you_view.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const ThankYouView();
          }));
        }
        if (state is StripePaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              /* PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                      amount: "100",
                      currency: "USD",
                      customerId: "cus_RA2dmoz6BvrGgS");
              BlocProvider.of<StripePaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            */
              var transactionData = getTransactionData();
              excutePaypalPayment(context, transactionData);
            },
            isLoading: State is StripePaymentLoading ? true : false,
            text: "Continue");
      },
    );
  }

  void excutePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemsListModel itemsList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true,
        clientId: ApiKeys.clientId,
        secretKey: ApiKeys.paypalsecretKey,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemsList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.pop(context);
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemsListModel itemsList}) getTransactionData() {
    var amount = AmountModel(
        total: "100",
        currency: "USD",
        details: Details(subtotal: "100", shipping: "0", shippingDiscount: 0));

    List<OrderItemModel> orders = [
      OrderItemModel(
        name: "Apple",
        quantity: 4,
        price: '10',
        currency: "USD",
      ),
      OrderItemModel(
          name: "Pineapple", quantity: 5, price: '12', currency: "USD"),
    ];

    var itemsList = ItemsListModel(orders: orders);

    return (amount: amount, itemsList: itemsList);
  }
}

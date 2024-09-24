import 'dart:ffi';

class PaymentIntentInputModel {
  final String amount;
  final String currency;

  PaymentIntentInputModel({required this.amount, required this.currency});

//  PaymentIntentInputModel.paymentIntentInputModel(
  //    {required this.amount, required this.currency});
  tojosn() {
    return {
      "amount": "${amount}00",
      "currency": currency,
    };
  }
}

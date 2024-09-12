import 'dart:ffi';

class PaymentIntentInputModel {
  final Double amount;
  final String currency;

  PaymentIntentInputModel.paymentIntentInputModel(
      {required this.amount, required this.currency});
  tojosn() {
    return {
      "amount": amount,
      "currency": currency,
    };
  }
}

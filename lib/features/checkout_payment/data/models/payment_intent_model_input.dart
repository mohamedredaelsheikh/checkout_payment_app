import 'dart:ffi';

class PaymentIntentModelInput {
  final Double amount;
  final String currency;

  PaymentIntentModelInput({required this.amount, required this.currency});
  tojosn() {
    return {
      "amount": amount,
      "currency": currency,
    };
  }
}

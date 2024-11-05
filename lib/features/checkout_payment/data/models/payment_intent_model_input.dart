class PaymentIntentInputModel {
  final String amount;
  final String currency;
  final String customerId;

  PaymentIntentInputModel(
      {required this.customerId, required this.amount, required this.currency});

//  PaymentIntentInputModel.paymentIntentInputModel(
  //    {required this.amount, required this.currency});
  tojosn() {
    return {
      "amount": "${amount}00",
      "currency": currency,
      "customer": customerId,
    };
  }
}

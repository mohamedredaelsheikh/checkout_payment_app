class InitPaymentSheetModelInput {
  final String paymentIntentClientSecret;
  final String ephemeralKeySecret;
  final String customerId;

  InitPaymentSheetModelInput(
      {required this.customerId,
      required this.paymentIntentClientSecret,
      required this.ephemeralKeySecret});
}

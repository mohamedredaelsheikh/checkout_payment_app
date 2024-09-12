import 'dart:async';

import 'package:checkout_payment_app/core/utlis/api_keys.dart';
import 'package:checkout_payment_app/core/utlis/api_service.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/models/payment_intent_model_input.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
/*
paymentIntentObject create payment intent (amount , currency)

init payment sheet (paymentIntentClientSecret)
 PresentPaymentSheet()
*/

  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentModelInput) async {
    var response = await apiService.Post(
      body: paymentIntentModelInput.tojosn(),
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Mohamed Elsheikh',
        paymentIntentClientSecret: paymentIntentClientSecret,
      ),
    );
  }

  Future disPalyPaymentSheet() async {
    Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await disPalyPaymentSheet();
  }
}

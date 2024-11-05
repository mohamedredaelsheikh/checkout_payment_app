import 'dart:async';

import 'package:checkout_payment_app/core/utlis/api_keys.dart';
import 'package:checkout_payment_app/core/utlis/api_service.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/models/init_payment_sheet_model_input.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/models/payment_intent_model_input.dart';
import 'package:dio/dio.dart';
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
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/payment_intents",
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  Future initPaymentSheet(
      {required InitPaymentSheetModelInput initPaymentSheetModelInput}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Mohamed Elsheikh',
        paymentIntentClientSecret:
            initPaymentSheetModelInput.paymentIntentClientSecret,
        customerEphemeralKeySecret:
            initPaymentSheetModelInput.ephemeralKeySecret,
        customerId: initPaymentSheetModelInput.customerId,
      ),
    );
  }

  Future disPalyPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);

    var ephemeralKeyModel = await createEphemeralKey(
        customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetModelInput = InitPaymentSheetModelInput(
      customerId: paymentIntentInputModel.customerId,
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      ephemeralKeySecret: ephemeralKeyModel.secret!,
    );
    await initPaymentSheet(
        initPaymentSheetModelInput: initPaymentSheetModelInput);
    await disPalyPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerId}) async {
    var response = await apiService.Post(
      body: {"customer": customerId},
      token: ApiKeys.secretKey,
      headers: {
        "Authorization": "Bearer ${ApiKeys.secretKey} ",
        "Stripe-Version": "2024-06-20"
      },
      contentType: Headers.formUrlEncodedContentType,
      url: "https://api.stripe.com/v1/ephemeral_keys",
    );
    var EphemeralKey = EphemeralKeyModel.fromJson(response.data);
    return EphemeralKey;
  }
}

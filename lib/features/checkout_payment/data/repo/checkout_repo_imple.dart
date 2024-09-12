import 'package:checkout_payment_app/core/errors/failures.dart';
import 'package:checkout_payment_app/core/utlis/stripe_service.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/models/payment_intent_model_input.dart';
import 'package:checkout_payment_app/features/checkout_payment/data/repo/checkout_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutRepoImple extends CheckoutRepo {
  final StripeService stripeService = StripeService();

  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentModelInput}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentModelInput);

      return right(null);
    } on Exception catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

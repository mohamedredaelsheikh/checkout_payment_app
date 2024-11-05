import 'package:checkout_payment_app/features/checkout_payment/data/models/payment_intent_model_input.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/manger/cubit/stripe_payment_cubit.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/thank_you_view.dart';
import 'package:checkout_payment_app/features/checkout_payment/presentation/views/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                      amount: "100",
                      currency: "USD",
                      customerId: "cus_RA2dmoz6BvrGgS");
              BlocProvider.of<StripePaymentCubit>(context).makePayment(
                  paymentIntentInputModel: paymentIntentInputModel);
            },
            isLoading: State is StripePaymentLoading ? true : false,
            text: "Continue");
      },
    );
  }
}

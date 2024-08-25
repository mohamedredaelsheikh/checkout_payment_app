import 'package:checkout_payment_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar buildAppBar({final String? title}) {
  return AppBar(
    leading: Center(
      child: SvgPicture.asset(
        "assets/images/arrow.svg",
        height: 24,
      ),
    ),
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}

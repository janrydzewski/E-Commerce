import 'package:animated_snack_bar/animated_snack_bar.dart';

import 'package:flutter/material.dart';

snackBarError(BuildContext context, String text) {
  AnimatedSnackBar.material(
    duration: const Duration(seconds: 1),
    text,
    type: AnimatedSnackBarType.error,
    mobilePositionSettings: const MobilePositionSettings(
      topOnAppearance: 75,
    ),
  ).show(context);
}

snackBarInfo(BuildContext context, String text) {
  AnimatedSnackBar.material(
    duration: const Duration(seconds: 1),
    text,
    type: AnimatedSnackBarType.info,
    mobilePositionSettings: const MobilePositionSettings(
      topOnAppearance: 75,
    ),
  ).show(context);
}

snackBarSuccess(BuildContext context, String text) {
  AnimatedSnackBar.material(
    duration: const Duration(seconds: 1),
    text,
    type: AnimatedSnackBarType.success,
    mobilePositionSettings: const MobilePositionSettings(
      topOnAppearance: 75,
    ),
  ).show(context);
}

class DisableGlow extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

final shippingList = [
  ["Economy", "Estimated Arrival, Dec 20-23", "10"],
  ["Regular", "Estimated Arrival, Dec 20-22", "15"],
  ["Cargo", "Estimated Arrival, Dec 19-20", "20"],
  ["Express", "Estimated Arrival, Dec 18-19", "30"],
];

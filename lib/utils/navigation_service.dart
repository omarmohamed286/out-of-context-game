import 'package:flutter/material.dart';

void navigateWithoutAnimation(BuildContext context, dynamic view) {
  Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
          pageBuilder: (context, _, __) => view,
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero),
      ((route) => false));
}

void navigateWithAnimation(BuildContext context, dynamic view) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => view,
      ));
}
